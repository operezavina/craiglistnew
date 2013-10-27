class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.boolean :approved
      t.references :user, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
