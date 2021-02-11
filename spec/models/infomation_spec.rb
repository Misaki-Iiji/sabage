# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Infomation, "InfomationModel", type: :model do
  before do
    @field = FactoryBot.create(:field)
    @infomation = Infomation.create(
      title: "title",
      body: "text",
      )
  end

  it "タイトル、本文、外部キーが有効な状態であること" do
    infomation = Infomation.new(
    title: "title",
    body: "text",
    field_id: 1
    )
    expect(infomation).to be_valid
  end

  it "タイトルがない場合、無効である" do
    infomation = Infomation.new(title: nil)
    infomation.valid?
  end

  it "本文がない場合、無効である"  do
    infomation = Infomation.new(body: nil)
    infomation.valid?
  end

  it "本文がない場合、無効である" do
    infomation = Infomation.new(body: nil)
    infomation.valid?
  end

end