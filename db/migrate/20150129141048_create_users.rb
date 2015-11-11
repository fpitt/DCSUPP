class CreateUsers < ActiveRecord::Migration
    def change
        create_table :users do |t|
            t.timestamps null: false
            t.string :name
            t.boolean :professor, :default => false
            t.boolean :administrator, :default => false
            t.text :introduction
            t.string :contact_email
        end
    end
end
