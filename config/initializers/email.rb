require 'development_mail_interceptor'

ActionMailer::Base.smtp_settings = {
  :address        => ENV['SENDGRID_ADDRESS'],
  :port           => ENV['SENDGRID_PORT'],
  :authentication => :plain,
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
  :domain         => ENV['SENDGRID_DOMAIN'],
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = ENV['MAIL_HOST_URL'] || "localhost:5000"


if ENV['DEMO_STATUS'] == "TRUE"
  ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor)
else
  ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
end