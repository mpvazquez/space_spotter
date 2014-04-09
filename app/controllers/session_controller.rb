class SessionController < ApplicationController
  def new
    render(:new)
  end

  def create
    # find if any user has that email
    user = User.find_by(email: params[:email])
    
    # if that user exists and it has a password that
    # was sent
    if user && ( user.authenticate(params[:password]) )
      
      # save the user_id in the session hash
      session[:user_id] = user.id
      @current_user = User.find_by(id: session[:user_id])

      # and redirect to that user's home page
      if current_user.role == "vendor"
        redirect_to vendor_path(@current_user)
      elsif current_user.role == "admin"
        redirect_to admin_path(@current_user)
      else
        redirect_to customer_path(@current_user)
      end
        # redirect_to( user_path(user) )
    else

      # the email/password is wrong!
      @message = "This email and password combination does not exist."
      render(:new)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
