require 'rails_helper'
RSpec.describe UserItem, type: :model do
  before do
    @seller = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: @seller.id)
    @buyer = FactoryBot.create(:user)
    @user_item = FactoryBot.build(:user_item, user_id: @buyer.id, item_id: @item.id)
  end

  describe '購入情報登録' do
    context '登録ができるとき' do
      it '配送先の情報に郵便番号・都道府県・市区町村・番地・電話番号・user_id・item_id・tokenがあると登録できる' do
        expect(@user_item).to be_valid
      end
      it 'buildingが空でも登録できること' do
        @user_item.building = ''
        expect(@user_item).to be_valid
      end
    end
    context '登録ができない時' do
      it 'tokenが空では登録できない' do
        @user_item.token = ''
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が入力されていない時登録できない' do
        @user_item.postcode = ''
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Postcode can't be blank")
      end
      it '郵便番号にはハイフンが無いと登録できない' do
        @user_item.postcode = '1234567'
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end
      it '都道府県が選択されていない時登録できない' do
        @user_item.prefecture = 0
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が入力されていない時登録できない' do
        @user_item.cities = ''
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Cities can't be blank")
      end
      it '番地が入力されていない時登録できない' do
        @user_item.address = ''
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が入力されていない時登録できない' do
        @user_item.tel = ''
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Tel can't be blank")
      end
      it '電話番号にハイフンがあると登録できない' do
        @user_item.tel = '090-3333-2222'
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include('Tel is invalid')
      end
      it '電話番号が12桁以上では登録できない' do
        @user_item.tel = '090999988887777'
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include('Tel is invalid')
      end
    end
  end
end
