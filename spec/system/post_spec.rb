require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  let!(:user) { create(:user) }
  let!(:posts) { create_list(:post, 3, user: user) }

  context 'ログインしている場合' do
    before do
      sign_in user
    end

    it '記事の詳細を表示できる' do
      visit root_path
      post = posts.first
      click_on post.photos

      expect(page).to have_css('.post_author', text: post.user.account_name)
      expect(page).to have_css('.timeline_post_content', text: post.content.to_plain_text)
    end
  end
end
