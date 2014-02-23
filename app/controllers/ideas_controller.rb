require 'rails_autolink'

class IdeasController < ApplicationController
		
  before_action :set_idea, only: [:show, :edit, :update, :destroy]
  before_action :set_keywords
  #before_action :set_comments
    
  # GET /ideas
  # GET /ideas.json
  def index
    kw = Keyword.find(params[:kw].to_i) unless params[:kw].nil?
    @ideas = Idea.all
    @indexideas = Idea.all if kw.nil?
    @indexideas = Idea.all.select{ |i| i.keywords.include?(kw)} if not kw.nil?
    @keywordname = "" if kw.nil?
    @keywordname = kw.name  + " - " unless kw.nil?
    @keywords = []
    @indexideas.each do |i|
      i.keywords.each do |k| 
        @keywords << k
      end
    end
    @keywords = @keywords.inject([]){ |result, h| result << h unless result.include?(h); result }
    @words = @keywords unless kw.nil?
  end


  # GET /ideas/1
	# GET /ideas/1.json
  def show
    @idea = Idea.find(params[:id])
    # get comments from db
    @comments = Comment.find_comments_for_commentable( "Idea", @idea.id )
    @keywords = @idea.keywords
    @words = @keywords
    @all = Keyword.all
    keyword_id = params[:keyword_id]
    remove_id = params[:remove_id]
    unless remove_id.nil? or remove_id.empty?
      #keyword = Keyword.find(remove_id)
      @idea.keywords.delete(remove_id)
    end
    unless keyword_id.nil? or keyword_id.empty?
      keyword = Keyword.find(keyword_id)
      @idea.keywords << keyword
      redirect_to idea_path(@idea)
    end
    order = params[:order] || 'name'

    case order
      when 'name' then @all.sort_by!{ |b| b.name }
    end
  end
    

  # GET /ideas/new
  def new
    @idea = Idea.new
    @keywords = Keyword.all
    
    order = params[:order] || 'name'

    case order
      when 'name' then @keywords.sort_by!{ |b| b.name }
    end
  end

  # GET /ideas/1/edit
  def edit
    @keywords = Keyword.all
    @all = Keyword.all
  end

# POST /ideas # POST /ideas.json
  def create
    @idea = Idea.new(idea_params)
    keyword_ids = params[:idea][:keyword_ids]
    if @idea.save
      keywords =
        Keyword.select do |k|
        keyword_ids.include? k.id.to_s
        end
      @idea.keywords << keywords
      redirect_to @idea

    else
      respond_to do |format|
        format.html { render action: 'new' }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    @idea = Idea.find(params[:id])
    # get user to add comment, for now just one default user
    user = User.first
    comment_body = params[:comment_body]
    unless comment_body.nil? or comment_body.empty?
      comment = Comment.build_from(@idea, user.id, comment_body)
      comment.save
    end
    if(params.has_key?(:idea))
      #unless params[:idea][:keyword_ids].nil? or params[:idea][:keyword_ids].empty?    
      keyword_ids = params[:idea][:keyword_ids]
      keywords =
        Keyword.select do |k|
          keyword_ids.include? k.id.to_s
        end
      respond_to do |format|
        if @idea.update(idea_params)
          format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @idea.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to @idea
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to ideas_url }
      format.json { head :no_content }
    end
  end
  
  def upvote
    @idea = Idea.find(params[:id])
    user = User.first
    @idea.liked_by User.first
    redirect_to :back
  end
  
  def downvote
    @idea = Idea.find(params[:id])
    user = User.first
    @idea.downvote_from User.first
    redirect_to :back
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_idea
    @idea = Idea.find(params[:id])
  end

  def set_keywords
    @words = Keyword.all
    
    order = params[:order] || 'name'

    case order
      when 'name' then @words.sort_by!{ |b| b.name }
    end
  end

  def set_comments
    idea = Idea.find(params[:id])
    @comments = Comment.find_comments_for_commentable( "Idea", idea.id )
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def idea_params
    params.require(:idea).permit(:name, :desc)
  end


end
