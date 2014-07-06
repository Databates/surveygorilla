# # Users
100.times do
  email = Faker::Internet.email
  name = Faker::Name.name
  password = Faker::Internet.password(8, 16)
  user_info = {email: email, name: name, password: password, password_confirmation: password}
  User.create(user_info)
end

marco_info = {email: "marco.bbcm@gmail.com", name: "Marco Morales", password: "1derfly", password_confirmation: "1derfly"}
marco = User.create(marco_info)

# Surveys
(1..100).to_a.each do |num|
  title = Faker::Lorem.words(rand(3..7))
  desc = Faker::Lorem.paragraph(rand(1..3))
  user = num % 12 == 0 ? marco : User.all.sample
  Survey.create(title: title.join(" "), description: desc, creator: user)
end

# Questions
surveys = Survey.all
surveys.each do |survey|
  q_count = rand(1..12)
  q_count.times do
    question = Faker::Lorem.sentence.sub(".", "?")
    survey.questions << Question.create(text: question)
  end
end

# Choices

def catch_phrase
  Faker::Company.catch_phrase
end

def product_name
  Faker::Commerce.product_name 
end

def bs
  Faker::Company.bs
end

def few_words
  Faker::Lorem.words(rand(2..6)).join(" ")
end

def generate_choice
  [catch_phrase, product_name, bs, few_words].sample
end

def choices_text(question)
  question.answer_choices.map(&:text)
end

def choices_full?(question, count)
  question.answer_choices.count == count
end

def add_choice(question, choice)
  question.answer_choices << AnswerChoice.create(text: choice)
end

surveys.each do |survey|
  questions = survey.questions
  questions.each do |question|
    choice_count = rand(2..6)
    until choices_full?(question, choice_count) do
      choice = generate_choice
      unless choices_text(question).include?(choice)
        add_choice(question, choice)
      end
    end
  end
end

# Responses
surveys.each do |survey|
  questions = survey.questions
  users = User.all
  takers = users.sample(rand(1..users.count))
  takers.each do |taker|
    questions.each do |question|
      choice = question.answer_choices.sample
      Response.create(question: question, user: taker, answer_choice: choice)
    end
    survey.completions << Completion.create(taker: taker, survey: survey)
  end
end
