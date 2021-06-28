require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('/images/test_image.png')
  end

  describe '商品の出品' do
    context '商品が出品できる場合' do
      it '必須項目が入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない場合' do
      it '商品名が空であるとき' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it '商品の説明が空であるとき' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item description can't be blank"
      end
      it '商品の画像がないとき' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品のカテゴリーが未選択のとき' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category must be other than 1'
      end
      it '商品の状態が未選択のとき' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Condition must be other than 1'
      end
      it '配送料の負担が未選択のとき' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Shipping charge must be other than 1'
      end
      it '発送元の地域が未選択のとき' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Prefecture must be other than 1'
      end
      it '発送までの日数が未選択のとき' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Day must be other than 1'
      end
      it '価格が空のとき' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it '価格が300未満のとき' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Out of setting range'
      end
      it '価格が9999999以上のとき' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Out of setting range'
      end
      it '価格が全角数値のとき' do
        @item.price = ('５００')
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Input half-width characters'
      end
    end
  end
end
