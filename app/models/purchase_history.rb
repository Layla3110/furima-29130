class PurchaseHistory < ApplicationRecord

  # with_options presence: true do
  #   validates :price
  # end

  belongs_to :user
  belongs_to :item
  has_one    :address
end
