class Gallery < ActiveRecord::Base
	has_many :pictures, dependent: :destroy
	belongs_to :user
	acts_as_votable
	has_many :comments, dependent: :destroy
end
