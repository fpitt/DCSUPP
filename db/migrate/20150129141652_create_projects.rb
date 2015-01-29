class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|

      t.timestamps null: false
      t.belongs_to :user, index: true
      t.string :item_id
      t.string :item_title
      t.integer :column_type
      t.datetime :item_date
      t.text :item_text
      t.boolean :approval_status

    end
  end
end
