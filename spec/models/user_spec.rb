require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmationと姓（漢字）名（漢字）、姓（カナ）名（カナ）、生年月日が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは、@を含んでいないと登録できない' do
        @user.email = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'aaaaa'
        @user.password_confirmation = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英数字混合でなければ登録できない' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが半角英数字混合でなければ登録できない' do
        @user.password = '1111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが違うと登録できない' do
        @user.password_confirmation = 'song@yahoo.com'
        @user.password == @user.password_confirmation
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '姓（漢字）が空では登録できない' do
        @user.familyname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Familyname kanji can't be blank")
      end
      it '名（漢字）が空では登録できない' do
        @user.firstname_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kanji can't be blank")
      end
      it '姓（漢字）が半角だと登録できない' do
        @user.familyname_kanji = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Familyname kanji is invalid')
      end
      it '名（漢字）が半角だと登録できない' do
        @user.firstname_kanji = 'ｼﾝｿﾞｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname kanji is invalid')
      end
      it '姓（フリガナ）が半角だと登録できない' do
        @user.familyname_kana = 'あべ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Familyname kana is invalid')
      end
      it '名（フリガナ）が半角だと登録できない' do
        @user.firstname_kana = 'ｼﾝｿﾞｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Firstname kana is invalid')
      end
      it '姓（カナ）が空では登録できない' do
        @user.familyname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Familyname kana can't be blank")
      end
      it '名（カナ）が空では登録できない' do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
      end
      it '生年月日が空だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
