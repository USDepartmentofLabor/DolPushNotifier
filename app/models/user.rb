class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :registerable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, uniqueness: true, presence: true
  validate :password_complexity
  audited 

  def password_complexity
    return if password.blank? || password =~ /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/

    errors.add :password, 'Password requirements not met, length should be minimum 8 charecters and include: 1 Uppercase, 1 Lowercase, 1 Digit and 1 special charecter'
  end
end
