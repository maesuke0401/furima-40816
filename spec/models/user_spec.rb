require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '指定したものすべてが存在すれば登録できる' do
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
      it 'passwordが空だと登録できない' do
        user = User.new(nickname: 'abe', email: 'kkk@gmail.com', password: '', password_confirmation: '00000000')
        user.valid?
        expect(user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
  @user.password_confirmation = @user.password
  @user.valid?
  expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
  end
  it '苗字が空では登録できない' do
    @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
  end
  it '名前が空では登録できない' do
    @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
  end
  it 'カタカナの苗字が空では登録できない' do
    @user.next_last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Next last name can't be blank"
  end
  it 'カタカナの名前が空では登録できない' do
    @user.next_first_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include "Next first name can't be blank"
  end
  it '生年月日が空では登録できない' do
    @user.birthday = ''
    @user.valid?
    expect(@user.errors.full_messages).to include "Birthday can't be blank"
  end
  it 'パスワードが半角英数字混合でなければ登録できない' do
    @user.password = 'password'
    @user.password_confirmation = 'password'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password は半角英数字混合で入力してください")
  end
  it '苗字カナが全角（カタカナ）でなければ登録できない' do
    @user.next_last_name = '111'
    @user.valid?
    expect(@user.errors.full_messages).to include("Next last name は全角カタカナのみで入力してください")
  end
  it 'お名前カナが全角（カタカナ）でなければ登録できない' do
    @user.next_first_name = '111'
    @user.valid?
    expect(@user.errors.full_messages).to include("Next first name は全角カタカナのみで入力してください")
  end

  it '苗字(全角)が全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
    @user.last_name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
  end
  it 'お名前(全角)が全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.first_name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
  end
end
end
end