module EmailValidatable
    extend ActiveSupport::Concern
    def email_validate(email)
        if ((email =~ URI::MailTo::EMAIL_REGEXP) == 0)
            return true
        else
            return false
        end
    end
end
