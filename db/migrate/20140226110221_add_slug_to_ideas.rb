class AddSlugToIdeas < ActiveRecord::Migration
  def change
    add_column :keywords, :slug, :string
    add_index :keywords, :slug
  end
end
