# index
get '/surveys' do
  @surveys = Survey.all
  erb :"survey_views/index"
end

# new
get '/survey/new' do
  erb :"survey_views/create_survey"
end

# create
post '/survey/create' do
  survey = Survey.create(params[:survey])
  session[:current_survey] = survey.id
  redirect '/survey/create/question'
end

# show
get '/survey/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  erb :"survey_views/show"
end


# delete
delete '/surveys/:id' do
  survey = Survey.find(params[:id])
  survey.delete
end


