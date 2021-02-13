require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase = FactoryBot.build(:purchase, user_id: user.id, item_id: item.id)
    sleep(1)
  end

  describe "クレジットカード情報登録" do
    context 'クレジットカード情報登録ができる時' do
      it 'すべての条件が入力されていれば保存できること' do
        expect(@purchase).to be_valid
      end
    end

    context 'クレジットカード情報登録ができない時' do
      it "tokenが空では登録できない" do
        @purchase.token = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
      it "postal_codeが空では登録できない" do
        @purchase.postal_code = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it "郵便番号にハイフンがないと登録できない" do
        @purchase.postal_code ="1234567"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "prefecture_idを選択しないと登録できない" do
        @purchase.prefecture_id = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "municipalitiesが空では登録できない" do
        @purchase.municipalities = "" 
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Municipalities can't be blank")
      end
      it "house_numberが空では登録できない" do
        @purchase.house_number = "" 
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("House number can't be blank")
      end
      it "phone_numberが空では登録できない" do
        @purchase.phone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_number:11桁以上では登録できない" do
        @purchase.phone_number = '000000000000'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is invalid.")
      end
      it "phone_numberにハイフンがあると登録できない" do
        @purchase.phone_number = '000-0000-0000'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is invalid.")
      end
    end
  end
end
