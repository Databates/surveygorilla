# SESSION routes -----------------------------------------------

post '/user/signin' do
  user = User.find_by_email(params[:email])

  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect to("/user/#{user.id}") #get '/user/:id' route
  else
    @errors = {:Invalid=>["Incorrect Login"]}
    redirect to('/')
  end
  @message = "test"
end

get '/user/signin' do
  erb :"user_views/signin"
end

get '/user/signout' do
  session[:user_id] = nil
  redirect to('/')
end

# CREATE routes -------------------------------------------------

# SIGN UP: New User 
get '/user/signup' do
  redirect to('/') if current_user?
  erb :"user_views/new"
end

post '/user/new' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect to("/user/#{user.id}") #get '/user/:id' route
  else
    @errors = user.errors.messages
    erb :"user_views/new"
  end
end

# READ routes

# user homepage
get '/user/:id' do
  @user = User.find(session[:user_id])
  @user_my_surveys = @user.surveys
  @user_taken_surveys = @user.taken_surveys
  redirect to("/") if @user.id != params[:id].to_i
  erb :"user_views/show"
end

# UPDATE routes --------------------------------------------------

# GET Route to edit your account

get '/user/edit/:id' do
  redirect to("/") if current_user.id != params[:id].to_i
  erb :"user_views/edit"
end

# post Route to edit your account

post '/user/edit' do
  @user = User.find(session[:user_id])

  if @user && @user.authenticate(params[:current_password])
    @user.update(params[:user])
    if @user.save
      redirect to("/user/#{@user.id}") #get '/user/:id' route
    else
      @errors = @user.errors.messages
      erb :"user_views/edit"
    end
  else
    @errors = {:Invalid=>["Incorrect Information"]}
    erb :"user_views/edit"
  end
end

# DELETE routes ------------------------------------------------------

get '/user/delete' do
  user = User.find(session[:user_id])
  session.clear
  user.destroy
  redirect to('/')
end

