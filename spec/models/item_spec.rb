require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できないとき' do
    it '商品画像が空では登録できない' do
      @item.image  = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
    it '商品名が空では出品できない' do
      @item.product = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Product can't be blank"
    end
    it '商品説明が空では出品できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Description can't be blank"
    end
    it 'カテゴリーが空では出品できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it '商品の状態が空では出品できない' do
      @item.condition_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Condition can't be blank"
    end
    it '配送料の負担が空では出品できない' do
      @item.delivery_fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Delivery fee can't be blank"
    end
    it '配送元が空では出品できない' do
      @item.source_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Source can't be blank"
    end
    it '発送までの日数が空では出品できない' do
      @item.shipping_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping can't be blank"
    end
    it '販売価格が空では出品できない' do
      @item.price_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
    it '販売価格が299以下では出品できない' do
      @item.price_id = '200'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
    end
    it '販売価格が1000000以上では出品できない' do
      @item.price_id = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
    end
  
end
end
end
