get '/user/signup' do
  redirect to('/') if current_user?
  erb :"user_views/new"
end

get '/user/signin' do
  erb :"user_views/signin"
end

get '/user/signout' do
  session[:user_id] = nil
  redirect to('/')
end

get '/user/delete' do
  user = User.find(session[:user_id])
  session.clear
  user.destroy
  redirect to('/')
end

get '/user/edit/:id' do
  redirect to("/") if current_user.id != params[:id].to_i
  erb :"user_views/edit"
end

get '/user/:id' do
  @user = User.find(session[:user_id])
  redirect to("/") if @user.id != params[:id].to_i
  erb :"user_views/show"
end

post '/user/new' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect to("/user/#{user.id}")
  else
    @errors = user.errors.messages
    erb :"user_views/new"
  end
end

post '/user/signin' do
  user = User.find_by_email(params[:email])

  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect to("/user/#{user.id}")
  else
    @errors = {:Invalid=>["Incorrect Login"]}
    erb :"user_views/sign_in"
  end
end

post '/user/edit' do
  @user = User.find(session[:user_id])

  if @user && @user.authenticate(params[:current_password])
    @user.update(params[:user])
    if @user.save
      redirect to("/user/#{@user.id}")
    else
      @errors = @user.errors.messages
      erb :"user_views/edit"
    end
  else
    @errors = {:Invalid=>["Incorrect Information"]}
    erb :"user_views/edit"
  end
end

