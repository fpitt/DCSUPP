class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :professor_id
      t.boolean :project_rating
      t.integer :project_id
      t.string :comment
      t.integer :rating

      t.timestamps null: false
    end
  end
end
