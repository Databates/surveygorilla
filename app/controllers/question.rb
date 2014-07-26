# show
get '/survey/create/question' do
  erb :"survey_views/create_question"
end

# create
post '/survey/new/question' do
  @survey = Survey.find(params[:survey])
  @survey.questions << Question.create!(params[:question])
  @questions = @survey.questions
  erb :"survey_views/create_option", layout: false
end