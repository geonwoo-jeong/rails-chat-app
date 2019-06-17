class UsersController < ApplicationController

    def new
    end

    def create
        if params[:user][:password] != params[:user][:password_confirm]  
            flash.now[:error] = "Password does not match"
            return render 'new'
        end

        user = User.find_by(username: params[:user][:username])

        if user
            flash.now[:error] = "Already exists username"
            return render 'new'
        end

        user = User.new(user_params)

        if user.save            
            flash[:success] = "You have Successfully created your account"
            return redirect_to login_path
        end

    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end