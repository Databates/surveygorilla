
#--- CREATE -------
get '/survey/new' do
  erb :"survey_views/create_survey"
end

get '/survey/create' do
  # if session[:user_id] == nil
  #   redirect '/'
  # end
  erb :"survey_views/create_survey"
end


post '/survey' do

  @survey = Survey.find(params[:survey_id])

  erb :"survey_views/create_question"
end




post '/survey/create' do

  survey = Survey.create(params[:survey])
  session[:current_survey] = survey.id  #create survey session and set it equal to the new survey id
  redirect '/survey/create/question'
end


get '/survey/create/question' do
  # if session[:user_id] == nil  #Add this in to make sure the user is in a current session later.
  #   redirect '/'
  # end
  erb :"survey_views/create_question"
end


post '/survey/create/question' do
  puts "LOG #{params.inspect}"
  @survey = Survey.find(session[:current_survey])
  puts "LOG #{@survey}"
  @survey.questions << Question.new(params[:question])
  @question = Question.last
  puts "LOG #{@question}"
  # erb :"survey_views/create_option"
end

# LOG {"question"=>{"text"=>"What is your fav burrito?"}}


#--------- To Create Answer Choices (Options) --------------------------------------

get 'survey/create/answer_choices' do
  # if session[:user_id] == nil
  #   redirect '/'
  # end

  @question = Question.last

  erb :"survey_views/create_option"

end


post '/survey/create/answer_choices' do

# {"answer1"=>"burrito", "answer2"=>"pizza", "answer3"=>"taco "}

  @question = Question.last
  params.each_pair do |name, answer|
    @question.answer_choices << AnswerChoice.new(text: answer)
  end
  puts "[LOG THIS SHIT] #{params.inspect}"
  # redirect '/survey/create/confirm'
  redirect '/surveys'
  # erb :"survey_views/confirm_survey"
end

get '/surveys' do
@surveys = Survey.all
erb :"survey_views/display_survey"  #take them to display @ views/survey_views/display_survey.erb
end

# <li><a href="/survey/<%=survey.id%>/results"><%=survey.title%></a></li>



#----------Display an individual Survey to the User ----------
get '/survey/:survey_id/individual' do #display_survey.erb sends users to display_one.erb,

  @survey = Survey.find_by_id(params[:survey_id])
  @questions = @survey.questions # array
  # @questions.each {}
  # @answer_choices =
  # @question
  # if @survey == nil
  #   @error = true
  # end

  erb :"survey_views/display_one"
end





#----------After you click Finish Survey  survey/create/confirm -------------

get '/survey/create/confirm' do
  if session[:user_id] == nil
    redirect '/'
  end

  erb :"survey_views/confirm_survey"
end


#----------- View your Results ----------------

get '/survey/:survey_id/results' do
  @survey = Survey.find_by_id(params[:survey_id])
  if @survey == nil
    @error = true
  end

  erb :"survey_views/results"
end



# ---------- Read





  get '/survey/:survey_id' do
    @survey = Survey.find(params[:survey_id])
    # @questions = @survey.questions # array
    erb :"survey_views/take_survey"
  end


post '/survey/take' do
 # @survey = Survey.find(params[:survey_id])
 @survey = Survey.find_by_id(params[:survey_id])
  @questions = @survey.questions
  #@question = @survey.

  params['answers'].each do |key,value|
    Response.create(
      user: User.find(session[:user_id]),
      question: Question.find(key.to_i),
      answer_choice: AnswerChoice.find(value.to_i)
    )
  end
  redirect to '/confirmation'

end

get '/confirmation' do
  erb :"survey_views/completed_survey"
end


# ---------- Update

#
get '/surveys/edit/:id' do
# @surveys = Survey.find(params[:id])
# erb :"survey_views/edit_survey"
end

get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  @survey.update(params)
erb :"survey_views/display_survey"
end

# ---------- Delete

delete '/surveys/:id' do
  survey = Survey.find(params[:id])
  survey.delete
end
