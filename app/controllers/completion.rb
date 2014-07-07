# show

get '/user/:id/surveys' do
  @surveys = User.find(params[:id]).surveys
  erb :"survey_views/list_user_surveys"
end

# update

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