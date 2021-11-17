class CreateDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :documents do |t|
      t.text :content, null: false
      t.integer :creator_id
      t.datetime :start_at
      t.datetime :end_at
      t.integer :assigner_id
      t.text :description
      t.references :project, foreign_key: true, on_delete: :cascade
      t.text :location
      t.timestamps
    end

    add_foreign_key :documents, :projects, on_delete: :cascade
    add_foreign_key :documents, :users, column: :creator_id, on_delete: :cascade
    add_foreign_key :documents, :users, column: :assigner_id, on_delete: :cascade
  end
end
