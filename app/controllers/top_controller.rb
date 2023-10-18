class TopController < ApplicationController
       def main
        if session[:login_uid]!=nil
            render "main"
        else 
            render "login"
        end
    end
    
    def login
        #User.find_by(params[:uid])== 'kindai' and params[:pass] == 'sanriko'
        if  params[:uid]== 'kindai' and params[:pass] == 'sanriko'
            session[:login_uid]=params[:uid]
            redirect_to top_main_path
        else
            render "e"
        end
    end
    def logout
        session.delate(:login_uid)
        redirect_to top_main_path
    end
end
