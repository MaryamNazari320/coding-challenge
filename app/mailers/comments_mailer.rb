class CommentsMailer < ApplicationMailer

  def submitted(comment)
  	@comment = comment

    mail to: "maryamnazari.320@gmail.com", subject: 'New comment!'
  end
end
