class Shoe < ActiveRecord::Base
  belongs_to :user

  validates :brand, :model, :year, :purchase_date, presence: true
end
