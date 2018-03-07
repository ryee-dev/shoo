class Store < ActiveRecord::Base
  has_many :stores_brands
  has_many :brands, through: :stores_brands
end
