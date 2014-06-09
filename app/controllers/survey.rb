#----Landing Page After Login/Signup:  Show ALL User Surveys ---------

get '/surveys' do
@surveys = Survey.all
erb :"survey_views/display_survey"
end

#---Create a Survey Routes--------------------------------------------

#Unless someone wants the GET survey/new route, let's delete it:
get '/survey/new' do
  erb :"survey_views/create_survey"
end

post '/survey/create' do
  survey = Survey.create(params[:survey])
  session[:current_survey] = survey.id
  # create survey session and set it equal to the new survey id
  redirect '/survey/create/question'
end

#------Create a Question Route----------------------------------------

get '/survey/create/question' do
  erb :"survey_views/create_question"
end

post '/survey/create/question' do
  puts "LOG #{params.inspect}"
  @survey = Survey.find(session[:current_survey])
  @survey.questions << Question.new(params[:question])
  @question = Question.last
  erb :"survey_views/create_option"
end


#--------- Create AnswerChoices (Options) Routes ---------------------

get 'survey/create/answer_choices' do
  @question = Question.last
  erb :"survey_views/create_option"
end

post '/survey/create/answer_choices' do
  @question = Question.last
  params.each_pair do |name, answer|
    @question.answer_choices << AnswerChoice.new(text: answer)
  end
  redirect '/surveys'
end

#----------Display an individual Survey to the User ------------------

get '/survey/:survey_id/individual' do
  @survey = Survey.find_by_id(params[:survey_id])
  @questions = @survey.questions

  erb :"survey_views/display_one"
end

#------------Take a Survey Route--------------------------------------

get '/survey/:survey_id' do
  @survey = Survey.find(params[:survey_id])
  erb :"survey_views/take_survey"
end

post '/survey/take' do
  @survey = Survey.find_by_id(params[:survey_id])
  @questions = @survey.questions

  params['answers'].each do |key,value|
    Response.create(
      user: User.find(session[:user_id]),
      question: Question.find(key.to_i),
      answer_choice: AnswerChoice.find(value.to_i)
    );
  end
  redirect to "/survey/#{@survey.id}/results"
end

get '/confirmation' do
  erb :"survey_views/completed_survey"
end

#--------------View a list of YOUR Surveys ---------------------------

get '/view_your_surveys' do
  @surveys = User.find(session[:user_id]).surveys
  erb :"survey_views/list_user_surveys"
end

#-----------View the RESULTS of your Surveys--------------------------

get '/survey/:survey_id/results' do
  @survey = Survey.find_by_id(params[:survey_id])
  if @survey == nil
    @error = true
  end

  erb :"survey_views/results"
end

# ----------Delete----------------------------------------------------

delete '/surveys/:id' do
  survey = Survey.find(params[:id])
  survey.delete
end

#---------------------------------------------------------------------


