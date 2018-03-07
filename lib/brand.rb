class Brand < ActiveRecord::Base
  has_many :stores_brands
  has_many :stores, through: :stores_brands
end
