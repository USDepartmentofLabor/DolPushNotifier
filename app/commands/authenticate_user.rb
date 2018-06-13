class AuthenticateUser
  prepend SimpleCommand

  def initialize(params)
    @email = params[:email]
    @password = params[:password]
  end

  # Creating a JWT if a user exists
  def call
    JsonWebToken.encode(user_id: user.id, user_email: user.email) if user
  end

  private

  attr_accessor :email, :password

  # Checking if the user credentials that were sent are valid
  def user
    user = User.find_by_email(email)
    return user if user && user.valid_password?(password)
    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end
