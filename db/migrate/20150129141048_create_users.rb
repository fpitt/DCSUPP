class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.timestamps null: false
      t.string :name
      t.boolean :professor, :default => false
      t.boolean :administrator, :default => false
      t.string :user_id

    end
  end
end
