class CreateIdeaKeywords < ActiveRecord::Migration
  def change
    create_table :idea_keywords do |t|
      t.integer :idea_id
      t.integer :keyword_id

      t.timestamps
    end
  end
end
