class ChangeDataTypeInReferences < ActiveRecord::Migration
  def up
    change_column :references, :professor_approved, :boolean
  end

  def down
    change_column :references, :professor_approved, :string
  end
end
