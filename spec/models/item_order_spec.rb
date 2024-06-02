require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @item_order = FactoryBot.build(:item_order, user_id: @user.id, item_id: @item.id)
  end
  

  describe '商品購入' do
    context '購入ができるとき' do
      it '建物名以外の入力事項が、存在すれば購入できる' do
        expect(@item_order).to be_valid
      end
      it '建物名が空でも購入できる' do
        @item_order.building_name  = ''
        expect(@item_order).to be_valid
      end
    end

    context '商品が購入できないとき' do
    it 'クレカの情報が空だと買えない' do
      @item_order.token  = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include ("Token can't be blank")
    end
    it '郵便番号が空だと購入できない' do
      @item_order.post_code = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Post code can't be blank")
    end    
    it '郵便番号がハイフンがないと購入できない' do
      @item_order.post_code = '1234567'
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it '都道府県がハイフンだと購入できない' do
      @item_order.source_id = '-'
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Source can't be blank")
    end

    it '市町村がからだと購入できない' do
      @item_order. city = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("City can't be blank")
    end
    
    it '番地がからだと購入できない' do
      @item_order.house_number = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("House number can't be blank")
    end
    
    it '電話番号が空だと購入できない' do
      @item_order.phone = nil
      @item_order.valid?
      expect(@item_order.errors.full_messages).to include("Phone can't be blank")
    end
it '電話番号が9以下だと購入できない' do
  @item_order.phone  = '12345678'
  @item_order.valid?
  expect(@item_order.errors.full_messages).to include ("Phone is invalid")
end
it '電話番号が12以上だと購入できない' do
  @item_order.phone  = '1234567890123'
  @item_order.valid?
  expect(@item_order.errors.full_messages).to include ("Phone is invalid")
end
it '電話番号が半角以外だと購入できない' do
  @item_order.phone  = '１２３４５６７８９０１２'
  @item_order.valid?
  expect(@item_order.errors.full_messages).to include ("Phone is invalid")
end
it 'ユーザーが紐ずかないと購入できない' do
  @item_order.user_id  = nil
  @item_order.valid?
  expect(@item_order.errors.full_messages).to include ("User can't be blank")
end
it 'itemが紐ずかないと購入できない' do
  @item_order.item_id  = nil
  @item_order.valid?
  expect(@item_order.errors.full_messages).to include ("Item can't be blank")
end
end
end
end