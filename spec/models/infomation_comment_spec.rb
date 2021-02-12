# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InfomationComment, 'モデルに関するテスト', type: :model do
  describe '実際に保存してみる' do
    it 'コメント本文が有効な状態であること' do
      expect(FactoryBot.build(:user)).to be_valid
      expect(FactoryBot.build(:infomation_comment)).to be_valid
    end
  end

  it 'コメント本文がない場合、無効である' do
    infomation_comment = InfomationComment.new(comment: nil)
    infomation_comment.valid?
  end
end
