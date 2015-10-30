class WelcomeMailer < ActionMailer::Base
  default :from => 'kutudu.herokuapp.com',
          :subject => 'An email sent via SendGrid with substitutions'

  def confirmation_email
    category 'SendGridRocks'
    mail :to => 'ku.dorjee@gmail.com'
  end
end