class TopController < ApplicationController
       def main
        if session[:login_uid]!=nil
            render "main"
        else 
            render "login"
        end
    end
    
    def login
        @user = User.find(1)
        if User.find_by(uid: params[:uid]) and User.find_by(pass: params[:pass] )
            session[:login_uid]=params[:uid]
            redirect_to top_main_path
        else
            render "flogin"
        end
    end
    def top_logout_path
        session.delete(:login_uid)
        redirect_to top_main_path
    end
end
