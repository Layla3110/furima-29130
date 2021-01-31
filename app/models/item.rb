class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
  belongs_to :duration
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :user

  with_options presence: true do
    validates :item_name
    validates :text
    validates :amount, inclusion:{in:300..9999999}, format:{with: /\A[0-9]+\z/}
    validates :condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :duration_id
    validates :category_id
    validates :user
    validates :image

    validates :category_id, numericality: { other_than: 1 } 
  end
end
