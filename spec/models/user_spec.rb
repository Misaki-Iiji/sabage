# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, 'UserModel', type: :model do
  before do
    @user = User.create(
      nickname: 'taro',
      email: 'taro@taro',
      password: 'password'
    )
  end

  it 'ニックネーム、メール、パスワードが有効な状態であること' do
    user = User.new(
      nickname: 'hanako',
      email: 'hanako@hanako',
      password: 'password'
    )
    expect(user).to be_valid
  end

  it 'ニックネームがない場合、無効である' do
    user = User.new(nickname: nil)
    user.valid?
  end

  it 'メールアドレスがない場合、無効である'  do
    user = User.new(email: nil)
    user.valid?
  end

  it '重複したメールアドレスの場合、無効である' do
    user = User.new(email: 'taro@taro')
    user.valid?
  end

  it 'パスワードがない場合、無効である' do
    user = User.new(email: nil)
    user.valid?
  end

  it 'メールアドレスの一意性の検証' do
    user = User.create(nickname: 'Test', email: 'taro@taro')
    expect(user).to_not be_valid
  end

  describe 'ニックネーム' do
    context '文字数' do
      it '15文字以下' do
        @user.nickname = 'a' * 15
        expect(@user).to be_valid
      end
    end
    context '文字数' do
      it '15文字以上' do
        @user.nickname = 'a' * 16
        expect(@user).to_not be_valid
      end
    end
  end

  describe 'イントロダクション' do
    context '文字数' do
      it '100文字以下' do
        @user.introduction = 'a' * 100
        expect(@user).to be_valid
      end
    end
    context '文字数' do
      it '100文字以上' do
        @user.introduction = 'a' * 101
        expect(@user).to_not be_valid
      end
    end
  end

  describe 'メインガン' do
    context '文字数' do
      it '30文字以下' do
        @user.main_gun = 'a' * 30
        expect(@user).to be_valid
      end
    end
    context '文字数' do
      it '30文字以上' do
        @user.main_gun = 'a' * 31
        expect(@user).to_not be_valid
      end
    end
  end

  describe 'サブガン' do
    context '文字数' do
      it '30文字以下' do
        @user.sub_gun = 'a' * 30
        expect(@user).to be_valid
      end
    end
    context '文字数' do
      it '30文字以上' do
        @user.sub_gun = 'a' * 31
        expect(@user).to_not be_valid
      end
    end
  end
end
