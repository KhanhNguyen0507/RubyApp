class Good < ActiveRecord::Base
	belongs_to :shop

	validates :name, presence: true, length: {minimum: 5, maximum: 100} 
	validates :price, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 1000000 }
	validates :summary, presence: true, length: {minimum: 5, maximum: 500} 
	validates :description, presence: true, length: {minimum: 5, maximum: 1000} 
	validates :shop_id, presence: true
end