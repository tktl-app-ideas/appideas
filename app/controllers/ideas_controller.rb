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
    @keywordname = "" if kw.nil?
    @keywordname = kw.name  + " - " unless kw.nil?
    @indexideas = Idea.all if kw.nil?
    @indexideas = Idea.all.select{ |i| i.keywords.include?(kw)} if not kw.nil?

# This section adds filtering to keyword bar, customer doesn't want it anymore
=begin
    @keywords = []
    @indexideas.each do |i|
        i.keywords.each do |k| 
          @keywords << k
        end
        
      order = params[:order] || 'id'

      case order
        when 'id' then @indexideas.sort_by!{ |b| b.id }
      end
    end
=end
# replaced by @keywords = Keyword.all
    @keywords = Keyword.all

    @keywords = @keywords.inject([]){ |result, h| result << h unless result.include?(h); result }
    @words = @keywords unless kw.nil?
    
    order = params[:order] || 'name'

    case order
      when 'name' then @words.sort_by!{ |b| b.name }
    end
    
    # this new idea needed when there is no related keyword to form new idea partial
    @idea = Idea.new
    
    
  end


  # GET /ideas/1
	# GET /ideas/1.json
  def show
    @idea = Idea.find(params[:id])
    # get comments from db
    @comments = Comment.find_comments_for_commentable( "Idea", @idea.id )
    @keywords = @idea.keywords
    #@words = @keywords
    @all = Keyword.all
    keyword_id = params[:keyword_id]
=begin
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
=end
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
    
    order = params[:order] || 'name'

    case order
      when 'name' then @keywords.sort_by!{ |b| b.name }
    end
  end

# POST /ideas # POST /ideas.json
  def create
    @idea = Idea.new(idea_params)
    keyword_ids = params[:idea][:keyword_ids]
    keywords =
        Keyword.select do |k|
        keyword_ids.include? k.id.to_s
        end
    if @idea.save
      @idea.keywords << keywords
      redirect_to @idea
    else
      @keywords = Keyword.all
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
    old_keywords = @idea.keywords
    
    
    if(params.has_key?(:idea))
      keyword_ids = params[:idea][:keyword_ids]
      keywords =
        Keyword.select do |k|
          keyword_ids.include? k.id.to_s
        end
      keywords.each do |kw|
        unless old_keywords.include? kw
          @idea.keywords << kw
        end
      end
      old_keywords.each do |old|
        IdeaKeyword.find_by_keyword_id_and_idea_id(old.id, @idea.id).destroy unless keywords.include? old
      end
      respond_to do |format|
        if @idea.update(idea_params)
          format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
          format.json { head :no_content }
        else
          @keywords = Keyword.all
    			@all = Keyword.all
  # Any other options to set comments? It shows now idea's comments after trying to update unvalid idea.
    			set_comments
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
    if current_user.nil?
      redirect_to signin_path, notice:'In order to vote, you should sign in'
    else
      @idea = Idea.find(params[:id])
      @idea.liked_by current_user
      redirect_to :back
    end
  end
  
  def downvote
    if current_user.nil?
      redirect_to signin_path, notice:'In order to vote, you should sign in'
    else
      @idea = Idea.find(params[:id])
      @idea.downvote_from current_user
      redirect_to :back
    end
  end

  def admin
    @ideas = Idea.all
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
