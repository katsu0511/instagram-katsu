require 'rails_helper'

RSpec.describe Post, type: :model do
  context '内容が入力されている場合' do
    let!(:user) do
      User.create!({
        email: 'test@example.com',
        password: 'password'
      })
    end

    let!(:post) do
      user.posts.build({
        content: Faker::Lorem.characters(number: 140)
      })
    end

    it '投稿を保存できる' do
      expect(post).to be_valid
    end
  end
end
