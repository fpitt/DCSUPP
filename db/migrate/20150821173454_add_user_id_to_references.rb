class AddUserIdToReferences < ActiveRecord::Migration
  def change
    add_column :references, :user_id, :integer
  end
end
