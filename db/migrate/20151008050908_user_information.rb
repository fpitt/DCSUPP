class UserInformation < ActiveRecord::Migration
  def change
  	add_column :users, :contact_email, :string
  	add_column :users, :introduction, :text
  end
end
