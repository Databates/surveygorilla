# index

get 'survey/create/answer_choices' do
  @question = Question.last
  erb :"survey_views/create_option"
end

# create

post '/survey/create/answer_choices' do
  @question = Question.last
  params.each_pair do |name, answer|
    @question.answer_choices << AnswerChoice.new(text: answer)
  end
  redirect '/surveys'
end