# frozen_string_literal: true

require 'rails_helper'

describe 'チャットグループ作成のテスト' do
	  let!(:chat_group) { create(:chat_group,chat_group_name:'hoge',chat_group_description:'chat_group_description') }

	  describe "一覧画面のテスト" do
	    before do
	      visit chat_groups_path
	    end
	    context '一覧の表示とリンクの確認' do
	      it "Clan一覧が表示されているか" do
	          (1..5).each do |i|
	            Chat_group.create(chat_group_name:'hoge'+i.to_s,chat_group_description:'chat_group_description'+i.to_s)
	          end
	          visit chat_groups_path
	          Chat_group.all.each_with_index do |chat_group,i|
	            j = i * 3
	            expect(page).to have_content chat_group.chat_group_name
	          end
	    end

	    context '投稿処理に関するテスト' do
	      it '投稿に成功しサクセスメッセージが表示されるか' do
	        fill_in 'chat_group[chat_group_name]', with: Faker::Lorem.characters(number:5)
	        fill_in 'chat_group[chat_group_description]', with: Faker::Lorem.characters(number:20)
	        click_button 'Create'
	        expect(page).to have_content 'Clanを作成しました'
	      end
	      it '投稿に失敗する' do
	        click_button 'Create'
	        expect(page).to have_content 'error'
	        expect(current_path).to eq('/chat_groups')
	        expect(page).to have_content 'Clan作成に失敗しました。'

	      end
	      it '投稿後のリダイレクト先は正しいか' do
	        fill_in 'chat_group[chat_group_name]', with: Faker::Lorem.characters(number:5)
	        fill_in 'chat_group[chat_group_description]', with: Faker::Lorem.characters(number:20)
	        click_button 'Create'
	        expect(page).to have_current_path chat_groups_path
	      end
	    end
	    context 'chat_group削除のテスト' do
	      it 'chat_groupの削除' do
	        expect{ chat_group.destroy }.to change{ Chat_group.count }.by(-1)
	        expect(page).to have_content 'Clan削除しました。'
	      end
	    end
	  end
	  describe '詳細画面のテスト' do
	    before do
	      visit chat_group_path(chat_group)
	    end
	    context '表示の確認' do
	      it 'クラン名と説明文が画面に表示されていること' do
	        expect(page).to have_content chat_group.chat_group_name
	        expect(page).to have_content chat_group.chat_group_description
	      end
	      it 'Editリンクが表示される' do
	        edit_link = find_all('a')[0]
	        expect(edit_link.native.inner_text).to match(/edit/i)
				end

	    end
	    context 'リンクの遷移先の確認' do
	      it 'Editの遷移先は編集画面か' do
	        edit_link = find_all('a')[0]
	        edit_link.click
	        expect(current_path).to eq('/chat_groups/' + chat_group.id.to_s + '/edit')
	      end
	    end
	  end
	  describe '編集画面のテスト' do
	    before do
	      visit edit_chat_group_path(chat_group)
	    end
	    context '表示の確認' do
	      it '編集前のクラン名とクラン説明がフォームに表示(セット)されている' do
	        expect(page).to have_field 'chat_group[chat_group_name]', with: chat_group.chat_group_name
	        expect(page).to have_field 'chat_group[chat_group_description]', with: chat_group.chat_group_description
	      end
	      it 'Update Chat_groupボタンが表示される' do
	        expect(page).to have_button 'Update Chat_group'
	      end
	    end
	    end
	    context '更新処理に関するテスト' do
	      it '更新に成功しサクセスメッセージが表示されるか' do
	        fill_in 'chat_group[chat_group_name]', with: Faker::Lorem.characters(number:5)
	        fill_in 'chat_group[chat_group_description]', with: Faker::Lorem.characters(number:20)
	        click_button 'Update Chat_group'
	        expect(page).to have_content '編集しました。'
	      end
	      it '更新に失敗しエラーメッセージが表示されるか' do
	        fill_in 'chat_group[chat_group_name]', with: ""
	        fill_in 'chat_group[chat_group_description]', with: ""
	        click_button 'Update Chat_group'
	        expect(page).to have_content '編集に失敗しました'
	      end
	      it '更新後のリダイレクト先は正しいか' do
	        fill_in 'chat_group[chat_group_name]', with: Faker::Lorem.characters(number:5)
	        fill_in 'chat_group[chat_group_description]', with: Faker::Lorem.characters(number:20)
	        click_button 'Update Chat_group'
	        expect(page).to have_current_path chat_group_path(chat_group)
	      end
	    end
	  end

  FactoryBot.define do
  factory :chat_group do
      chat_group_name { Faker::Lorem.characters(number:5) }
      chat_group_description { Faker::Lorem.characters(number:20) }
    end
  end
  
  
end