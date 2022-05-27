class Admin < ApplicationRecord
  validates :firstname, :lastname, presence: true
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@sistemadefrete\.com\.br\z/, message: "deve conter o domínio sistemadefrete.com.br" }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable
end
