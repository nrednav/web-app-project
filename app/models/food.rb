class Food < ApplicationRecord
	
	has_and_belongs_to_many :orders

	scope :cuisine, ->(cuisine) { where(cuisine: cuisine) }
	scope :course, ->(course) { where(course: course) }
end
