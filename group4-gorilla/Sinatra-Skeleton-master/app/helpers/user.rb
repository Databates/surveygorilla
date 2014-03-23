def current_user?
  session[:user_id]
end

def current_user
  User.find(session[:user_id])
end