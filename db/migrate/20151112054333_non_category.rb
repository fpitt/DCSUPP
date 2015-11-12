class NonCategory < ActiveRecord::Migration
  def change
  	add_column :projects, :additional_requirement, :text
  end
end
