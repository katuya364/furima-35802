require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @shipping_address = FactoryBot.build(:order_shipping_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品の購入' do
    context '商品を購入できる場合' do
      it '必須項目が入力されていれば購入できる' do
        expect(@shipping_address).to be_valid
      end
      it '建物名が空でも購入できる' do
        @shipping_address.building_name = ''
        expect(@shipping_address).to be_valid
      end
      context '商品が出品できない場合' do
        it '郵便番号が入力できていないとき' do
          @shipping_address.postal_code = ''
          @shipping_address.valid?
          expect(@shipping_address.errors.full_messages).to include "Postal code can't be blank"
        end
        it '郵便番号に-が入っていないとき' do
          @shipping_address.postal_code = '1234567'
          @shipping_address.valid?
          expect(@shipping_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
        end
        it '都道府県が未選択のとき' do
          @shipping_address.prefecture_id = 1
          @shipping_address.valid?
          expect(@shipping_address.errors.full_messages).to include "Prefecture must be other than 1"
        end
        it '都道府県が空では登録できない' do
          @shipping_address.address = nil
          @shipping_address.valid?
          expect(@shipping_address.errors.full_messages).to include "Address can't be blank"
        end
        it '市区町村が空のとき' do
          @shipping_address.municipality = ''
          @shipping_address.valid?
          expect(@shipping_address.errors.full_messages).to include "Municipality can't be blank"
        end
        it '番地が空のとき' do
          @shipping_address.address = ''
          @shipping_address.valid?
          expect(@shipping_address.errors.full_messages).to include "Address can't be blank"
        end
        it '電話番号が空のとき' do
          @shipping_address.phone_number = nil
          @shipping_address.valid?
          expect(@shipping_address.errors.full_messages).to include "Phone number can't be blank"
        end
        it '電話番号が10桁未満のとき' do
          @shipping_address.phone_number = '123'
          @shipping_address.valid?
          expect(@shipping_address.errors.full_messages).to include "Phone number is invalid"
        end
        it '電話番号が11桁を超えたとき' do
          @shipping_address.phone_number = '111111111111'
          @shipping_address.valid?
          expect(@shipping_address.errors.full_messages).to include "Phone number is invalid"
        end
        it '電話番号に数字以外が含まれているとき' do
          @shipping_address.phone_number = 'あああ'
          @shipping_address.valid?
          expect(@shipping_address.errors.full_messages).to include "Phone number is invalid"
        end
        it 'tokenがからのとき' do
          @shipping_address.token = nil
          @shipping_address.valid?
          expect(@shipping_address.errors.full_messages).to include "Token can't be blank"
        end
        it 'user_idが空のとき' do
          @shipping_address.user_id = nil
          @shipping_address.valid?
          expect(@shipping_address.errors.full_messages).to include "User can't be blank"
        end
        it 'item_idが空のとき' do
        @shipping_address.item_id = nil
        @shipping_address.valid?
        expect(@shipping_address.errors.full_messages).to include "Item can't be blank"
        end
      end
    end 
  end
end
