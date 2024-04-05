require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do
    context '新規登録できる場合' do
      it "name、email、password、password_confirmation、last_name、first_name、last_name_kana、first_name_kanaとbirthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end

    end
    context '新規登録できない場合' do
      it 'ニックネームが必須であること。' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが必須であること。' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスが一意性であること。' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスは、@を含む必要があること。' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが必須であること。' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it ' パスワードは、6文字以上での入力が必須であること。' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードは、半角英数字混合での入力が必須であること。' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'パスワードとパスワード（確認）は、値の一致が必須であること。' do
        @user.password = '1234ab'
        @user.password_confirmation = '1234abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
  describe '新規登録/本人情報確認' do
    context '新規登録できる場合' do
      it "last_name、first_name、last_name_kana、first_name_kanaとbirthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'お名前(全角)は、名字が必須であること。' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角（漢字・ひらがな・カタカナ）を使用してください")
      end
      it 'お名前(全角)は、名前が必須であること。' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角（漢字・ひらがな・カタカナ）を使用してください")
      end
      it 'お名前(名字)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。' do
        @user.last_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角（漢字・ひらがな・カタカナ）を使用してください")
      end
      it 'お名前(名前)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。' do
        @user.first_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角（漢字・ひらがな・カタカナ）を使用してください")
      end
      it 'お名前カナ(全角)は、名字が必須であること。' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カナを使用してください")
      end
      it 'お名前カナ(全角)は、名前が必須であること。' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カナを使用してください")
      end
      it 'お名前カナ(名字)は、全角（カタカナ）での入力が必須であること。' do
        @user.last_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カナを使用してください")
      end
      it 'お名前カナ(名前)は、全角（カタカナ）での入力が必須であること。' do
        @user.first_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カナを使用してください")
      end
      it '生年月日が必須であること。' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
