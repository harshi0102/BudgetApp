class Users::SessionsController < Devise::SessionsController
  before_action :authenticate_user!

  # GET /resource/sign_in
  def new
    self.resource = User.new # Initialize the resource here
    # ... other code
  end

  # ... other actions

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
