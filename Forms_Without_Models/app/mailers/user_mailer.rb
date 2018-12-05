class UserMailer < ApplicationMailer


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.contact_email.subject
  #
  def contact_email
    @greeting = "Here is a contact us email"

    mail to: "pmolvik15@gmail.com", bcc: "dave.jones@scc.spokane.edu"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.restaurant_email.subject
  #
  def restaurant_email
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.thanks_email.subject
  #
  def thanks_email( user_email )
    @greeting = "Thanks for contacting us!"

    mail to: user_email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.article_email.subject
  #
  def article_email( title, author, content )
    @user_emails = []
    @users = User.all
    @users.each do |user|
      if user.newletter
        @user_emails << user.email
      end

    end

    @user_emails.each do |user_email|
      @greeting = "Newest Article: #{title}
      By: #{author},

      #{content}
      "

      mail to: user_email, bcc: "dave.jones@scc.spokane.edu", subject: title
    end

  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome_email.subject
  #
  def welcome_email
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
