require 'rails_helper'
RSpec.describe UserItem,type: :model do
  before do
    binding.pry
    @seller = FactoryBot.create(:user)
    @item = FactoryBot.create(:item, user_id: @seller.id)
    @buyer = FactoryBot.create(:user)
    @user_item = FactoryBot.build(:user_item, user_id: @buyer.id, item_id: @item.id)

  end

  describe '購入情報登録' do
    context '登録ができるとき' do
      it '配送先の情報に郵便番号・都道府県・市区町村・番地・電話番号があると登録できる' do

      end
      it 'buildingが空でも登録できること' do
      end
    end
    context '登録ができない時' do
      it '郵便番号が入力されていない時登録できない' do
      end
      it '郵便番号にはハイフンが無いと登録できない' do
      end
      it '都道府県が選択されていない時登録できない' do
      end
      it '市区町村が入力されていない時登録できない' do
      end
      it '番地が入力されていない時登録できない' do
      end  
      it '電話番号が入力されていない時登録できない' do
      end
      it '電話番号にハイフンがあると登録できない' do
      end
      it '電話番号が11桁以上あると登録できない' do
      end 
    end
  end
end
