class User < ApplicationRecord
  belongs_to :shipping_company
  
  # Validate email and merge User with ShippingCompany before validates.
  before_validation :user_and_shipping_company_merge
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # Validate email
  def email_validate(email)
    if ((email =~ URI::MailTo::EMAIL_REGEXP) == 0)
      return true
    else
      return false
    end
  end

  # Merge User with ShippingCompany
  def user_and_shipping_company_merge
    if email_validate(self.email) == true
      @email_domain = self.email.split("@").last
      @shipping_company = ShippingCompany.find_by(domain: @email_domain)
      if @shipping_company.present?
        self.shipping_company_id = @shipping_company.id
      else
        self.errors.add :email, "deve ter o domínio igual ao domínio de uma transportadora previamente cadastrada."
      end
    else
      self.errors.add :email, "inválido."
    end
  end
  

end
