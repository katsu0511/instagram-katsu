require 'rails_helper'

RSpec.describe Post, type: :model do
  it '内容が入力されていれば、投稿を保存できる' do
    user = User.create!({
      email: 'test@example.com',
      password: 'password'
    })
    post = user.posts.build({
      content: Faker::Lorem.characters(number: 140)
    })

    expect(post).to be_valid
  end
end
