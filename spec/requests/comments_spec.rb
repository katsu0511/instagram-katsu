require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  let!(:user) { create(:user) }
  let!(:post) { create(:post, user: user) }
  let!(:comments) { create_list(:comment, 3, post: post, user: user) }

  describe 'GET /comments' do
    it '200 Status' do
      get post_comments_path(post_id: post.id)
      expect(response).to have_http_status(302)
    end
  end
end
