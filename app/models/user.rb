class User < ApplicationRecord
  # Include default devise modules.
  #devise :database_authenticatable, :registerable,
#          :recoverable, :rememberable, :trackable, :validatable,
          #:confirmable, #:omniauthable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :registerable and :omniauthable
  devise :database_authenticatable,
        :recoverable,
        :rememberable,
        :trackable,
        :validatable
  include DeviseTokenAuth::Concerns::User

end
