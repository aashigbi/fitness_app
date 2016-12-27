class User < ApplicationRecord
	has_secure_password
	has_and_belongs_to_many :foods
	validates :name, presence: true, length: {maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum: 255}, 
		format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	validates :current_weight, :target_weight,  numericality: { greater_than:0, less_than: 1000, allow_nil: true }
	validates :carb_percent, :protein_percent, :fat_percent,  numericality: { only_integer: true, greater_than: 0, less_than: 100, allow_nil: true }
	
end
