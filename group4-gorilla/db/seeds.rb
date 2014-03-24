ian = User.create(email: "ian@yahoo.com",name: "Ian" , password: "1234", password_confirmation: "1234")
pablo = User.create(email: "pablo@yahoo.com", name: "Pablo V", password: "1234", password_confirmation: "1234")
cameron = User.create(email: "cam@yahoo.com", name: "Cam J", password: "1234", password_confirmation: "1234")
marco = User.create(email: "marco.bbcm@gmail.com", name: "Marco M", password: "1derfly", password_confirmation: "1derfly")
dan = User.create(email: "dan@yahoo.com", name: "Dan B", password: "1234", password_confirmation: "1234")

# New survey, created by user 'a'
pizza_survey = Survey.create(title: "Pizza Poll", description: "Tell us about your favorite pizza and represent your home town", user_id: ian.id)

# Question #1
fav_style = Question.create(text: "What's your favorite style of pizza?")
fav_style1 = AnswerChoice.create(text:"Thin-Crust")
fav_style2 = AnswerChoice.create(text:"Deep-Dish")
fav_style3 = AnswerChoice.create(text:"Stuffed")
fav_style4 = AnswerChoice.create(text:"Pan")
fav_style.answer_choices << fav_style1
fav_style.answer_choices << fav_style2
fav_style.answer_choices << fav_style3
fav_style.answer_choices << fav_style4

# Question #2
best_city = Question.create(text: "What city has the best Pizza?" )
best_city1 = AnswerChoice.create(text:"New York")
best_city2 = AnswerChoice.create(text:"Chicago")
best_city3 = AnswerChoice.create(text:"Chicago")
best_city4 = AnswerChoice.create(text:"Chicago")
best_city.answer_choices << best_city1
best_city.answer_choices << best_city2
best_city.answer_choices << best_city3
best_city.answer_choices << best_city4

# Add questions to survey
pizza_survey.questions << fav_style
pizza_survey.questions << best_city

fav_style_response1 = Response.create(question: fav_style, user: ian, answer_choice: fav_style1)
fav_style_response2 = Response.create(question: fav_style, user: marco, answer_choice: fav_style1)
fav_style_response3 = Response.create(question: fav_style, user: cameron, answer_choice: fav_style2)
fav_style_response4 = Response.create(question: fav_style, user: pablo, answer_choice: fav_style2)
fav_style_response5 = Response.create(question: fav_style, user: dan, answer_choice: fav_style4)

taken_survey = UserSurvey.create(user:cameron, survey: pizza_survey)

# User table test
puts ian.email == "ian@yaoho.com" # true

# User/Survey Associations test
ian.surveys.count == 1

# Survey/Question Associations test
pizza_survey.questions.count == 2

# Question/AnswerChoice Associations test
fav_style.answer_choices.count == 4

# AnswerChoice/Response
fav_style1.responses.count == 2
