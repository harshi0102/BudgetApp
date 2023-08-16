class RegistrationsController < Devise::RegistrationsController 
  def new
    @user = User.new
    super
  end

  # def create
  #   super do |resource|
  #     # Your custom code here if needed after user creation
  #   end
  # end

  private


  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :picture)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
  end
end
