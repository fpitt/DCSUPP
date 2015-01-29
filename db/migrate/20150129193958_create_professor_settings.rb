class CreateProfessorSettings < ActiveRecord::Migration
  def change
    create_table :professor_settings do |t|

      t.timestamps null: false
      t.belongs_to :user, index: true
      t.boolean :approval_status, :default => false
      t.text :approval_message
    end
  end
end
