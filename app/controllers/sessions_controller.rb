class SessionsController < ApplicationController

    def new
    end
    
    def create
        session_params = params[:session]
        user = User.find_by(username: session_params[:username].downcase)
        
        if user && user.authenticate(session_params[:password])
            session[:user_id] = user.id 
            flash[:notice] = "Logged in successfully"
            redirect_to articles_path
        else
            flash.now[:alert] = "Check your username or password" 
            render :new
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out successfully"
        redirect_to root_path
    end

end