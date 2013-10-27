class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :content_visitor
      t.string :email_visitor
      t.references :post, index: true

      t.timestamps
    end
  end
end
