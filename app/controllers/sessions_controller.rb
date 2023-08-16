class Devise::SessionsController < DeviseController
  # Other actions and code ...

  def destroy
    sign_out(current_user)
    flash[:notice] = 'Logged out successfully.'
    redirect_to root_path
  end

  # Other actions and code ...
end
