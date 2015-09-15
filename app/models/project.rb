class Project < ActiveRecord::Base

	belongs_to :user
	has_many :drafts
    
    #accepts_nested_attributes_for :draft

	validates :name, presence: true, length: { minimum: 3, maximum: 50 }
	validates :description, presence: true, length: { minimum: 5, maximum: 200}


end
