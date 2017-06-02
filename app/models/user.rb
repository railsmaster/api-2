class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,:omniauthable

          #removed confirmable because of confirm_sucess_url required to redirect user after sucessful user sign_up
          
  include DeviseTokenAuth::Concerns::User

  has_many :post
end
