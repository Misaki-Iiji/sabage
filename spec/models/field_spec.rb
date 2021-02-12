# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Field, 'モデルに関するテスト', type: :model do
  before do
    @field = Field.create(
      name: 'sabage',
      email: 'sabage@sabage',
      password: 'password'
    )
  end

  it 'フィールド名、メール、パスワードが有効な状態であること' do
    field = Field.new(
      name: 'gun',
      email: 'gun@gun',
      password: 'password'
    )
    expect(field).to be_valid
  end

  it 'フィールド名がない場合、無効である' do
    field = Field.new(name: nil)
    field.valid?
  end

  it 'メールアドレスがない場合、無効である' do
    field = Field.new(email: nil)
    field.valid?
  end

  it '重複したメールアドレスの場合、無効である' do
    field = Field.new(email: 'sabage@sabage')
    field.valid?
  end

  it 'パスワードがない場合、無効である' do
    field = Field.new(email: nil)
    field.valid?
  end

  it 'メールアドレスの一意性の検証' do
    field = Field.create(name: 'Test', email: 'sabage@sabage')
    expect(field).to_not be_valid
  end

  describe 'フィールド名' do
    context '文字数' do
      it '20文字以下' do
        @field.name = 'a' * 20
        expect(@field).to be_valid
      end
    end
    context '文字数' do
      it '20文字以上' do
        @field.name = 'a' * 21
        expect(@field).to_not be_valid
      end
    end
  end

  describe 'イントロダクション' do
    context '文字数' do
      it '300文字以下' do
        @field.introduction = 'a' * 300
        expect(@field).to be_valid
      end
    end
    context '文字数' do
      it '300文字以上' do
        @field.introduction = 'a' * 301
        expect(@field).to_not be_valid
      end
    end
  end
end
