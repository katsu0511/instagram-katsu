class CommentMailer < ApplicationMailer
  def new_comment(user, post)
    @user = user
    @post = post
    mail to: user.email, subject: '【お知らせ】コメントを追加しました'
  end
end
