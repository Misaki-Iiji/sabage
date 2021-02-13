require 'rails_helper'

RSpec.describe InfomationCommentsController, type: :controller do
  describe 'コメントが' do
    context '認証済みユーザーとして' do
      before do
        @user = FactoryBot.create(:user)
        @field = FactoryBot.create(:field)
        @infomation = FactoryBot.create(:infomation, field: @field)
      end

      it '投稿できること' do
        infomation_comment_params = FactoryBot.attributes_for(:infomation_comment)
        sign_in @user
        expect do
          post infomation_infomation_comments_path(infomation_id: @infomation.id),
               params: { infomation_comment: infomation_comment_params }
        end.to change(@user.infomation_comments, :count).by(1)
      end

      it '削除できること' do
        sign_in @user
        expect do
          delete :destroy, params: { id: @infomation_comment.id }
        end.to change(@user.infomation_comments, :count).by(-1)
      end
    end

    context '未承認ユーザーとして' do
      before do
        @user = FactoryBot.create(:user)
        other_user = FactoryBot.create(:user)
        @infomation_comment = FactoryBot.create(:infomation_comment, user: other_user)
      end
      
      it '投稿できないこと' do
        infomation_comment_params = FactoryBot.attributes_for(:infomation_comment)
        sign_in @user
        expect do
          post infomation_infomation_comments_path(infomation_id: @infomation.id),
               params: { infomation_comment: infomation_comment_params }
        end.to_not change(InfomationComment, :count)
      end

      it '削除できないこと' do
        sign_in @user
        expect do
          delete :destroy, params: { id: @infomation_comment.id }
        end.to_not change(InfomationComment, :count)
      end
    end
  end
end
