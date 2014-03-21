
#--- CREATE -------
get '/survey/new' do
  erb :"survey_views/create_survey"
end

get '/survey/create' do
  if session[:user_id] == nil
    redirect '/'
  end
  erb :"survey_views/create_survey"
end




post '/survey' do

  # @survey = Survey.find(params[:survey_id])

  erb :"survey_views/create_question" #take them to create a question
end

# get '/survey/create' do
#   redirect to "/" if !current_user?
#   # @survey = Survey.create(user_id: session[:user_id], title: "Title",is_public: params[:is_public], category: params[:category])
#   redirect to("/survey/edit/#{@survey.id}")
# end





post '/survey/create' do
  # survey = Survey.create(params[:survey])
  # session[:current_survey] = survey.id
  redirect '/survey/create/question'
end

# INSERT INTO "users" ("created_at", "email", "name", "password_digest", "updated_at")
# VALUES ($1, $2, $3, $4, $5) RETURNING "id"
# [["created_at", 2014-03-21 19:40:26 UTC],
# ["email", "ian@yahoo.com"],
# ["name", "ian"],
# ["password_digest", "$2a$10$f4AUdFfUItmE8/f2qNKShOz9fCfEjtDlSOWFpCeecxKL2bGyvbm6C"],
# ["updated_at", 2014-03-21 19:40:26 UTC]]


get '/survey/create/question' do
  # if session[:user_id] == nil
  #   redirect '/'
  # end
  erb :"survey_views/create_option"
end


post '/survey/create/question' do

  # @survey = Survey.find(session[:current_survey])
  # # binding.pry
  # @survey.questions << Question.new(params[:question])
  # @question = Question.last
  # @options = true
  # erb :_create_option, layout: false
end


#----------After you click Finish Survey  survey/create/confirm -------------

get '/survey/create/confirm' do
  if session[:user_id] == nil
    redirect '/'
  end

  erb :"survey_views/confirm_survey"
end








post '/survey/create/confirm' do
  # question = Question.last
  # question.options << Option.new(text: params[:option_text])

  redirect '/survey/create/confirm'
end







# ---------- Read

get '/surveys' do
@surveys = Survey.all
erb :"survey_views/display_survey"  #take them to display @ views/survey_views/display_survey.erb
end

get '/surveys/:id' do
  #assuming migration places user_id foreign key on surveys (belongs to user)
@surveys = Survey.find(params[:id])
  if @survey.user_id == session[:user_id]
    erb :"survey_views/display_survey"
  else
    redirect to "/"  #COME BACK TO
  end
end
# ---------- Update

get '/surveys/edit/:id' do
@surveys = Survey.find(params[:id])
erb :"survey_views/edit_survey"
end

put '/surveys/:id' do
  @survey = Survey.find(params[:id])
  @survey.update(params)
erb :"survey_views/display_survey"
end

# ---------- Delete

delete '/surveys/:id' do
  survey = Survey.find(params[:id])
  survey.delete
end
