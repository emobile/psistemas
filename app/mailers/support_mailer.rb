class SupportMailer < ActionMailer::Base
    default from: "no-reply@emobile-demos.com.mx"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.support_mailer.new_comment.subject
  #
  

  def new_comment(comment, email)
    @comment = comment
    mail(:to => email, :subject => "El cliente #{@comment.user.fullname} ha dejado un nuevo comentario.")
  end

end
