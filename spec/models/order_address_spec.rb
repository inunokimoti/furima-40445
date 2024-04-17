require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '購入商品の登録' do

    context '購入ができる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it '建物名がなくても他の値が入力されていれば保存できること' do
        @order_address.adderss_bilding_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '購入ができない場合' do
      it '郵便番号が空欄の場合、登録できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンがない場合、登録できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '都道府県が初期値の場合、登録できない' do
        @order_address.from_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("From can't be blank")
      end
      it '市区町村が空欄の場合、登録できない' do
        @order_address.adderss_city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Adderss city can't be blank")
      end
      it '番地が空欄の場合、登録できない' do
        @order_address.adderss_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Adderss number can't be blank")
      end
      it '電話番号が空欄の場合、登録できない' do
        @order_address.tel_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number can't be blank")
      end
      it '電話番号が10桁未満の場合、登録できない' do
        @order_address.tel_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number is 10 or 11 digits only")
      end
      it '電話番号が12桁以上の場合、登録できない' do
        @order_address.tel_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number is 10 or 11 digits only")
      end
      it '電話番号が半角数値以外の場合、登録できない' do
        @order_address.tel_number = '090-123-456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Tel number is 10 or 11 digits only")
      end
      it 'user_idが紐付いていない場合、登録できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐付いていない場合、登録できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
