# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_comments_on_post_id  (post_id)
#  index_comments_on_user_id  (user_id)
#
class Comment < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 140}}

  belongs_to :user
  belongs_to :post

  after_create :send_email

  private
  def send_email
    CommentMailer.new_comment(@comment.user).deliver.later
  end
end
