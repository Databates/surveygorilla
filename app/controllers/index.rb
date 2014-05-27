get '/' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    redirect to("/user/#{@user.id}")
  else
    @surveys = Survey.all
    erb :index
  end
end


