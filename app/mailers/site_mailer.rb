class SiteMailer < ActionMailer::Base
  from_address = Mail::Address.new "natalie.griner30@gmail.com"
  from_address.display_name = "A2 Kids"
  default from: from_address.format

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.site_mailer.recap.subject
  #
  def recap(to, email)
    @message = email.content
    @subject = email.subject

    mail({
      :to => to,
      :subject => @subject
    })
  end
end
