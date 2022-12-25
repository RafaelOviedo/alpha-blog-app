class SessionsController < ApplicationController
    def new

    end

    def create
        user = User.find_by(email: params[:session][:email])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = 'Logged successfully'
            redirect_to user
        else
            flash.now[:alert] = 'There was a problem with your login information'
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = 'Loged out!'
        redirect_to root_path
    end
end