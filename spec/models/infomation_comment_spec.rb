# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InfomationComment, "モデルに関するテスト", type: :model do
   before do
    @user = User.create(
      nickname: "taro",
      email: "taro@taro",
      password: "password",
      )
      
    @infomation = Infomation.create(
      title: "title",
      body: "text",
      )
 
    @infomation_comment = InfomationComment.create(
      comment: "text",
      )
  end

  it "コメント本文が有効な状態であること" do
    infomation_comment = InfomationComment.new(
    comment: "text",
    infomation_id: 1,
    user_id: 1
    )
    expect(infomation_comment).to be_valid
  end

  it "コメント本文がない場合、無効である" do
    infomation_comment = InfomationComment.new(comment: nil)
    infomation_comment.valid?
  end

end