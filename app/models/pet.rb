class Pet < ActiveRecord::Base
	attr_accessible :name, :age, :user_id
	belongs_to :user
	validates_presence_of :name
	scope :adult, -> { where("age > 4").order(:name)}
	scope :high_priority, -> { where('user_id = ?', "3")}
	scope :low_priority, -> { where('user_id <> ?', "3")}
end
