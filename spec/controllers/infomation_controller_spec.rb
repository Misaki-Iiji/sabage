require 'rails_helper'

RSpec.describe InfomationsController, type: :controller do
  describe '一覧ページが' do
    context '認証済みフィールドユーザーとして' do
      before do
        @field = FactoryBot.create(:field)
      end

      it '正常にレスポンスを返すこと' do
        sign_in @field
        get :index
        expect(response).to be_success
      end
    end

    context '未認証フィールドユーザーとして' do
      it 'サインイン画面にリダイレクトすること' do
        get :index
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe '作成ページが' do
    context '認証済みフィールドユーザーとして' do
      before do
        @field = FactoryBot.create(:field)
      end

      it '投稿できること' do
        infomation_params = FactoryBot.attributes_for(:infomation)
        sign_in @field
        expect do
          post :create, params: { infomation: infomation_params }
        end.to change(@field.infomation, :count).by(1)
      end

      context '未認証フィールドユーザーとして' do
        it 'サインイン画面にリダイレクトすること' do
          infomation_params = FactoryBot.attributes_for(:infomation)
          post :create, params: { infomation: infomation_params }
          expect(response).to redirect_to '/users/sign_in'
        end
      end
    end
  end
end
