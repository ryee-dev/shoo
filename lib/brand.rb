class Brand < ActiveRecord::Base
  has_and_belongs_to_many :stores
  private

  validates(:name, {:presence => true, :uniqueness => true, :length => {maximum: 100}})
  validates(:price, {:presence => false})
  before_save(:normalize)
  private

  def normalize
    self.name = name.downcase.titleize
  end
end
