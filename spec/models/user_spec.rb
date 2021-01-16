require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user).to be_valid
    end
    it "nicknameが空では登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
    it '@を含まないemailだと登録できない' do
      @user.email = 'aaaaaaaaa.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordがpassword_confirmationと一致していない場合、無効である' do
      @user.password_confirmation = "1bbbbbb"
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    it 'password:半角英数混合(半角、尚且つ英数混合のみ)' do
      @user.password = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'password:半角英数混合(半角、尚且つ英数混合のみ)' do
      @user.password = '1111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'password:半角英数混合(半角、尚且つ英数混合のみ)' do
      @user.password = 'ａａａａａａａ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "password:５文字以下では登録できない" do
      @user.password = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "surnameが空では登録できない" do
      @user.surname = "" 
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname Full-width characters")
    end
    it "firstnameが空では登録できない" do
      @user.firstname = "" 
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname Full-width characters")
    end
    it "surname_kanaが空では登録できない" do
      @user.surname_kana = ""  
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname kana Full-width katakana characters")
    end
    it "firstname_kanaが空では登録できない" do
      @user.firstname_kana = ""  
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kana Full-width katakana characters")
    end
    it "birthdataが空では登録できない" do
      @user.birthdata = ""  
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthdata can't be blank")
    end

    it 'surnameが全角入力でなければ登録できない' do
      @user.surname = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname Full-width characters")
    end
    it 'first_nameが全角入力でなければ登録できない' do
      @user.firstname = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname Full-width characters")
    end

    it 'surname_kanaが全角カタカナでなければ登録できない' do
      @user.surname_kana = "あいうえお"
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname kana Full-width katakana characters")
    end
    it 'firstname_kanaが全角カタカナでなければ登録できない' do
      @user.firstname_kana = "あいうえお"
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kana Full-width katakana characters")
    end
  end
end

