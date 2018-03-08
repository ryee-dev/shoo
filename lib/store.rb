class Store < ActiveRecord::Base
  has_and_belongs_to_many :brands

  validates(:name, {:presence => true, :uniqueness => true, :length => {maximum: 100}})
  validates(:location, {:presence => true, :length => {minimum: 3}})
  before_save(:normalize)

  private

  def normalize
    self.name = name.downcase.titleize
    self.location = location.downcase.titleize
  end
end
