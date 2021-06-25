require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての要素が入力できていれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '1a1a1'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'first_name_kanjiが空では登録できない' do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kanji can't be blank"
      end
      it 'last_name_kanjiが空では登録できない' do
        @user.last_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kanji can't be blank"
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
      it 'first_name_kanjiがひらがなと漢字、カタカナ以外では登録できない' do
        @user.first_name_kanji = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kanji full-width characters'
      end
      it 'last_name_kanjiがひらがなと漢字、カタカナ以外では登録できない' do
        @user.last_name_kanji = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kanji full-width characters'
      end
      it 'first_name_kanaがカタカナ以外では登録できない' do
        @user.first_name_kana = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana full-width katakana characters'
      end
      it 'last_name_kanaがカタカナ以外では登録できない' do
        @user.last_name_kana = 'あ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana full-width katakana characters'
      end
      it 'passwordが数字だけでは登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password Include both letters and numbers'
      end
      it 'passwordが英字だけでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password Include both letters and numbers'
      end
      it 'emailに@がついていないと登録できない' do
        @user.email = 'test.test'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end
      it 'passwordが全角では登録できないこと' do
        @user.password = '１ｂ１ｂ１ｂ'
        @user.password_confirmation = '１ｂ１ｂ１ｂ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password Include both letters and numbers'
      end
      it 'first_name_kanjiが半角カタカナでは登録できない' do
        @user.first_name_kanji = 'ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kanji full-width characters"
      end
      it 'last_name_kanjiが半角カタカナでは登録できない' do
        @user.last_name_kanji = 'ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kanji full-width characters"
      end
      it 'first_name_kanaが半角カタカナでは登録できない' do
        @user.first_name_kana = 'ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana full-width katakana characters"
      end
      it 'last_name_kanaが半角カタカナでは登録できない' do
        @user.last_name_kana = 'ｱ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana full-width katakana characters"
      end
    end
  end
end
