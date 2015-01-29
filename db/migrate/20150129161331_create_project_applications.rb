class CreateProjectApplications < ActiveRecord::Migration
  def change
    create_table :project_applications do |t|

      t.timestamps null: false
      t.belongs_to :user, index: true
      t.belongs_to :project, index: true
      t.text :message
      t.text :title_message

    end
  end
end
