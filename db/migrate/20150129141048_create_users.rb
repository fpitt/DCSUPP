class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.timestamps null: false
      t.string :name
      t.boolean :professor, :default => false
      t.boolean :administrator, :default => false

    end
  end
end
