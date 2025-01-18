class CreateDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :documents do |t|
      t.string :title, null: false
      t.text :content

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
