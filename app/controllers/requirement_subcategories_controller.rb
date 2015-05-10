class RequirementSubcategoriesController < ApplicationController

	def create

		param = params[:requirement_subcategories]
		category =  param[:column_type]

		@new_subCategory = RequirementSubcategory.new()

		if @new_subCategory.save

	    end

	    @new_subCategory.update_column(:requirement_category_id, param[:category])
	    @new_subCategory.update_column(:student_attribute, param[:student_attribute])
	    @new_subCategory.update_column(:sub_category_name, param[:item_title])

		case category
		when 1 #Input Number
			@new_subCategory.update_column(:attribute_type, "InputNumber")
			if param[:decimal]
				@new_subCategory.update_column(:regex, param[:decimal])
			end

			if param[:min_value]
				@new_subCategory.update_column(:regex, param[:minimumValue].to_i)
			end

			if param[:max_value]
				@new_subCategory.update_column(:regex, param[:maximumValue].to_i)
			end
		when 2 #Input Date
			@new_subCategory.update_column(:attribute_type, "InputDate")
			if param[:before_date]
				@new_subCategory.update_column(:regex, param[:start_date].to_formatted_s(:db))
			end

			if param[:after_date]
				@new_subCategory.update_column(:regex, param[:after_date].to_formatted_s(:db))
			end

		when 3 #Boolean
			@new_subCategory.update_column(:attribute_type, "Boolean")
			@new_subCategory.update_column(:placeholder, param[:boolean_attribute])

		when 4 #Input Field
			@new_subCategory.update_column(:attribute_type, "InputField")

		else 
			puts category
		end


		respond_to do |format|
	    	format.js
	    end
	end
	
end
