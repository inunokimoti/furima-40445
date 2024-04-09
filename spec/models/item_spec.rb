require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品出品登録できる場合' do
      it "image、item_name、describe、category_id、state_id、shipping_charge_id、from_id、transport_day_id、sale_priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
    context '商品出品登録できない場合' do
      it "imageが空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "item_nameが空では登録できない" do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "describeが空では登録できない" do
        @item.describe = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Describe can't be blank")
      end
      it "category_idが初期値では登録できない" do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "state_idが初期値では登録できない" do
        @item.state_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end
      it "shipping_charge_idが初期値では登録できない" do
        @item.shipping_charge_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it "from_idが初期値では登録できない" do
        @item.from_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("From can't be blank")
      end
      it "transport_day_idが初期値では登録できない" do
        @item.transport_day_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Transport day can't be blank")
      end
      it "sale_priceが空では登録できない" do
        @item.sale_price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Sale price can't be blank", "Sale price is invalid", "Sale price is not a number")
      end
      it "sale_priceが¥300未満では登録できない" do
        @item.sale_price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Sale price must be greater than or equal to 300")
      end
      it "sale_priceが¥9,999,999を超えると登録できない" do
        @item.sale_price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Sale price must be less than or equal to 9999999")
      end
      it "sale_priceが半角数値以外では登録できない" do
        @item.sale_price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Sale price is not a number")
      end
      it "userが紐づいていないと登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
