require 'rails_helper'

RSpec.describe HomesController, type: :controller do
  describe 'トップページ' do
    it '表示される' do
      get :top
      expect(response).to be_success
    end
  end
  describe 'アバウトページ' do
    it '表示される' do
      get :about
      expect(response).to be_success
    end
  end
end
