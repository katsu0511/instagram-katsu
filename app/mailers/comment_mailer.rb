class CommentMailer < ApplicationMailer
  def new_comment(user)
    @user = user
    mail to: user.email, subject: '【お知らせ】コメントを追加しました'
  end
end
