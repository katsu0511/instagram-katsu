require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  let!(:user) { create(:user) }
  let!(:posts) { create_list(:post, 3, user: user) }

  context 'ログインしている場合' do
    before do
      sign_in user
    end

    it '記事一覧が表示される' do
      visit profile_path

      expect(page).to have_content(posts.first.content)
    end
  end
end
