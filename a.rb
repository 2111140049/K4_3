require 'bcrypt'
#登録
signup_pasword=BCypt::Password.create('my')
puts signup_password

#ログイン画面
login_password=BCypt::Password.new(signup_password)
if login_password=="my" #params[:pass]
    puts "OK"
end