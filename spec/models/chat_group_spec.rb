# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ChatGroup, 'モデルに関するテスト', type: :model do
  before do
    @chatgroup = ChatGroup.create(
      chat_group_name: 'test',
      chat_group_description: 'text'
    )
  end

  it 'グループ名が有効な状態であること' do
    chatgroup = ChatGroup.new(
      chat_group_name: 'title',
      chat_group_description: 'body'
    )
    expect(chatgroup).to be_valid
  end

  it 'グループ名がない場合、無効である' do
    chatgroup = ChatGroup.new(chat_group_name: nil)
    chatgroup.valid?
  end

  it '説明文がない場合、無効である' do
    chatgroup = ChatGroup.new(chat_group_description: nil)
    chatgroup.valid?
  end

  describe 'フィールド名' do
    context '文字数' do
      it '20文字以下' do
        @chatgroup.chat_group_name = 'a' * 20
        expect(@chatgroup).to be_valid
      end
    end
    context '文字数' do
      it '20文字以上' do
        @chatgroup.chat_group_name = 'a' * 21
        expect(@chatgroup).to_not be_valid
      end
    end
  end

  describe '説明文' do
    context '文字数' do
      it '200文字以下' do
        @chatgroup.chat_group_description = 'a' * 200
        expect(@chatgroup).to be_valid
      end
    end
    context '文字数' do
      it '200文字以上' do
        @chatgroup.chat_group_description = 'a' * 201
        expect(@chatgroup).to_not be_valid
      end
    end
  end
end
