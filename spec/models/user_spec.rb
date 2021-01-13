require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    # let(:@user_donation){create(:@user_donation)} 

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user).to be_valid
    end
    it "nicknameが空では登録できない" do
      @user.nickname = ""  # nicknameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ""  # emailの値を空にする
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
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'password:半角英数混合(半角英語のみ)' do
      @user.password = 'aaaaaa1'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "surnameが空では登録できない" do
      @user.surname = ""  # surnameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname can't be blank")
    end
    it "firstnameが空では登録できない" do
      @user.firstname = ""  # firstnameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname can't be blank")
    end
    it "surname_kanaが空では登録できない" do
      @user.surname_kana = ""  # surname_kanaの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname kana can't be blank")
    end
    it "firstname_kanaが空では登録できない" do
      @user.firstname_kana = ""  # firstname_kanaの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
    end
    it "birthdataが空では登録できない" do
      @user.birthdata = ""  # birthdataの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthdata can't be blank")
    end

    # 本人確認名前全角入力のテスト ▼

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

    # 本人確認カタカナ全角入力のテスト ▼

    it 'surname_kanaが全角カタカナでなければ登録できない' do
      @user.surname_kana = "あいうえお"
      @user.valid?
      expect(@user.errors.full_messages).to include("Surname kana surname_kana Full-width katakana characters")
    end
    it 'firstname_kanaが全角カタカナでなければ登録できない' do
      @user.firstname_kana = "あいうえお"
      @user.valid?
      expect(@user.errors.full_messages).to include("Firstname kana firstname_kana kana Full-width katakana characters")
    end
  end
end

