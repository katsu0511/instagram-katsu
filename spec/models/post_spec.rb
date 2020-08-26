require 'rails_helper'

RSpec.describe Post, type: :model do
  context '内容が入力されている場合' do
    before do
      user = User.create!({
        email: 'test@example.com',
        password: 'password'
      })
      @post = user.posts.build({
        content: Faker::Lorem.characters(number: 140)
      })
    end

    it '投稿を保存できる' do
      expect(@post).to be_valid
    end
  end
end
