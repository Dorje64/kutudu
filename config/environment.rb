# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!


ActionMailer::Base.smtp_settings = {
    :address        => "smtp.gmail.com",
    :port           => 587,
    :authentication => :login,
    :user_name      => "ku.dorjee@gmail.com",
    :password       => "gmail com",
    #:domain         => 'heroku.com',
    :enable_starttls_auto => true
}

ActionMailer::Base.delivery_method = :smtp
#ActionMailer::Base.default_url_options = { host: 'kutudu.herokuapp.com' }
ActionMailer::Base.default charset:"utf-8"
#ActionMailer::Base.default_content_type = "text/html"