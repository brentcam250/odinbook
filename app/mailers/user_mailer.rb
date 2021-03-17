class UserMailer < ApplicationMailer
    default from: 'Brizzy@odinbook.com'
    layout 'mailer'

    def welcome_email 
        @user = params[:user]
        @url = 'http://example.com/login'
        mail(to: @user.email, subject: 'Welcome to my Awesome Site')
    end
end
