class StoreBrand < ActiveRecord::Base
  belongs_to :stores
  belongs_to :brands
end
