class StudentEntries < ActiveRecord::Migration
  def change

  	add_column :student_settings, :student_info_A, :string, :default => "Blank"
  	add_column :student_settings, :student_info_B, :string, :default => "Blank"
  	add_column :student_settings, :student_info_C, :string, :default => "Blank"
  	add_column :student_settings, :student_info_D, :string, :default => "Blank"
  	add_column :student_settings, :student_info_F, :string, :default => "Blank"
  	add_column :student_settings, :settings_initalized, :boolean, :default => false

  end
end
