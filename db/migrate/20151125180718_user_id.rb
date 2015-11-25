class UserId < ActiveRecord::Migration
  def change
  	add_column :users, :utor_id, :string
  end
end
