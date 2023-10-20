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
        if User.find_by(uid: params[:uid]) 
             require 'bcrypt'
             @user.pass = BCrypt::Password.create("sanriko")
            
        
            if BCrypt::Password.new(@user.pass) == params[:pass]
            #if User.find_by(pass: params[:pass] )
                session[:login_uid]=params[:uid]
                redirect_to top_main_path
            else
                render "flogin"
            end
        else
            render "e"
        end
    end
    def top_logout_path
        session.delete(:login_uid)
        redirect_to top_main_path
    end
end
