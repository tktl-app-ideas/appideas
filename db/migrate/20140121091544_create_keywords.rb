class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :name
      t.boolean :concrete

      t.timestamps
    end
  end
end
