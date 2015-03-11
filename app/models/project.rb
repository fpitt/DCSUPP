class Project < ActiveRecord::Base
	
	belongs_to :user

	has_many :project_application
	has_many :project_requirement

	has_many :users, :through => :project_applications
	has_many :requirement_subcategories, :through => :project_requirements

	attr_accessible :title, :text

  	validates :title, presence: true, allow_blank: false
  	validates :text, presence: true, allow_blank: false


end
