# show

get '/survey/create/question' do
  erb :"survey_views/create_question"
end

# create

post '/survey/create/question' do
  puts "LOG #{params.inspect}"
  @survey = Survey.find(session[:current_survey])
  @survey.questions << Question.new(params[:question])
  @question = Question.last
  erb :"survey_views/create_option"
end