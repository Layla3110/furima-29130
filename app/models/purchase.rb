class Purchase 
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :house_number, :building, :phone_number, :item_id, :token, :user_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipalities, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :house_number
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/ , message: "is invalid."}
    validates :token
  end

    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

    def save
      purchase = PurchaseHistory.create(user_id: user_id, item_id: item_id)
      Address.create(postal_code: postal_code,  prefecture_id: prefecture_id, municipalities: municipalities, house_number: house_number, building: building, phone_number: phone_number, purchase_history_id: purchase.id)
    end
end
