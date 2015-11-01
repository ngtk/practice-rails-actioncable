class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
      t.text :content
      t.integer :last_modified_user_id
      t.integer :created_user_id

      t.timestamps
    end
  end
end
