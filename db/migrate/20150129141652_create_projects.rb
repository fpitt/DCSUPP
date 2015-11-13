class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|

      t.timestamps null: false
      t.belongs_to :user, index: true
      t.string :title
      t.datetime :deadline_date
      t.text :text
      t.boolean :approval_status
      t.boolean :completed
      t.boolean :looking_for_students
      t.text :additional_requirement

    end
  end
end
