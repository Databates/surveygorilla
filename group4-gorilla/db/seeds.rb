a = User.create(email: "ian@yaoho.com",name: "Ian" , password: "1234", password_confirmation: "1234")
b = User.create(email: "pablo@yahoo.com", name: "Pablo", password: "1234", password_confirmation: "1234")
c = User.create(email: "cam@yahoo.com", name: "Cam", password: "1234", password_confirmation: "1234")
d = User.create(email: "marco@yahoo.com", name: "Marco", password: "1234", password_confirmation: "1234")
e = User.create(email: "dan@yahoo.com", name: "Dan", password: "1234", password_confirmation: "1234")

# New survey, created by user 'a'
survey = Survey.create(title: "Pizza", description: "dsjsgfkgjjnghlj", user_id: a.id)

# Question #1
q1 = Question.create(text: "Do you like pepperoni?")
answer1 = AnswerChoice.create(text:"yes")
answer2 = AnswerChoice.create(text:"no")
q1.answer_choices << answer1
q1.answer_choices << answer2

# Question #2
q2 = Question.create(text: "Deep dish or NY?" )
answer3 = AnswerChoice.create(text:"Deep Dish")
answer4 = AnswerChoice.create(text:"Dollar Slice")
q2.answer_choices << answer3
q2.answer_choices << answer4

# Add questions to survey
survey.questions << q1
survey.questions << q2

response = Response.create(question: q2, user: c, answer_choice: answer3)

taken_survey = UserSurvey.create(user:c,survey:survey)

# User table test
puts a.email == "ian@yaoho.com" # true

# User/Survey Associations test
a.surveys.count == 1

# Survey/Question Associations test
survey.questions.count == 2

# Question/AnswerChoice Associations test
q1.answer_choices.count == 2

# AnswerChoice/Response
answer1.responses.count == 1
