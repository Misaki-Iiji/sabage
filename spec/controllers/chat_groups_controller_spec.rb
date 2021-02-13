require 'rails_helper'

RSpec.describe ChatGroupsController, type: :controller do
  describe '一覧ページが' do
    context '認証済みユーザーとして' do
      before do
        @user = FactoryBot.create(:user)
      end

      it '正常にレスポンスを返すこと' do
        sign_in @user
        get :index
        expect(response).to be_success
      end
    end

    context '未認証ユーザーとして' do
      it 'サインイン画面にリダイレクトすること' do
        get :index
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe '作成ページが' do
    context '認証済みユーザーとして' do
      before do
        @user = FactoryBot.create(:user)
      end

      it 'グループ作成できること' do
        chat_group_params = FactoryBot.attributes_for(:chat_group)
        sign_in @user
        expect do
          post :create, params: { chat_group: chat_group_params }
        end.to change(@user.chat_groups, :count).by(1)
      end
    end

    context '未認証ユーザーとして' do
      it 'サインイン画面にリダイレクトすること' do
        chat_group_params = FactoryBot.attributes_for(:chat_group)
        post :create, params: { chat_group: chat_group_params }
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end
end
