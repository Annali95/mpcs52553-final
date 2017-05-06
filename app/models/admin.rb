class Admin < ApplicationRecord
	validates :name, presence: true
	validates :mail, presence: true
	validates :password, presence: true
end
