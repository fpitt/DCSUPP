class Project < ActiveRecord::Base
	
	belongs_to :user

	has_many :project_application
	has_many :project_requirement

	attr_accessible :title, :text

  	validates :title, presence: true, allow_blank: false
  	validates :text, presence: true, allow_blank: false


end
