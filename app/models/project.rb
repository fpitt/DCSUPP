class Project < ActiveRecord::Base
	
	belongs_to :user

	has_many :project_application
	has_many :project_requirement

	has_many :users, :through => :project_applications
	has_many :requirement_subcategories, :through => :project_requirements

	attr_accessible :item_title, :item_text

  	validates :item_title, presence: true, allow_blank: false
  	validates :item_text, presence: true, allow_blank: false

	before_save do |project|

		project.item_date = Time.current
		project.item_id = SecureRandom.urlsafe_base64

	end

end
