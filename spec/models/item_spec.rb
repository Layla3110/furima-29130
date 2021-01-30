require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    context '商品出品ができる時' do
      it 'すべての条件が入力されていれば保存できること' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない時' do
      it "item_nameが空では登録できない" do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "textが空では登録できない" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'category_idを選択しないと登録できない' do
        @item.category_id = 'レディース'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it "condition_idを選択しないと登録できない" do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "delivery_fee_idを選択しないと登録できない" do
        @item.delivery_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it "prefecture_idを選択しないと登録できない" do
        @item.prefecture_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "duration_idを選択しないと登録できない" do
        @item.duration_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Duration can't be blank")
      end
      it "amountが空では登録できない" do
        @item.amount = ""  
        @item.valid?
        expect(@item.errors.full_messages).to include("Amount can't be blank")
      end
      it 'imageがなければ登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end