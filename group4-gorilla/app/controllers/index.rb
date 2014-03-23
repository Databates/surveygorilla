get '/' do
  @user = User.find(session[:user_id])
  if session[:user_id]
    redirect to("/user/#{@user.id}")
  else
    @surveys = Survey.all
    erb :index
  end
end

# not_found do
#   erb:
# end


