class Draft < ActiveRecord::Base

	belongs_to :user
	belongs_to :project

#validates :name, presence: true, length: { minimum: 3, maximum: 50 }
#validates :description, presence: true, length: { minimum: 5, maximum: 200}


end
