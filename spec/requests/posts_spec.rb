require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:user) { create(:user) }
  let!(:posts) { create_list(:post, 3, user: user) }

  describe 'POST /posts' do
    context 'ログインしている場合' do
      before do
        sign_in user
      end

      it '記事が保存される' do
        post_params = attributes_for(:post)
        post posts_path({post: post_params})
        expect(response).to have_http_status(302)
        expect(Post.last.content).to eq(post_params[:content])
      end
    end
  end
end
