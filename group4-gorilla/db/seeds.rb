User.create(email: "a@a.com",name: "The Poodle" , password: "1234", password_confirmation: "1234")
User.create(email: "poodle@gmail.com", name: "George Poodle", password: "1234", password_confirmation: "1234")
User.create(email: "gopher@pain.com", name: "Some Poodle", password: "1234", password_confirmation: "1234")

Survey.create(user_id: 1, title: "Animals",is_public: true, category: "Customer Satisfaction")
Question.create(survey_id: 1, variety: "text", prompt: "Favorite Snail?")
Question.create(survey_id: 1, variety: "text", prompt: "Favorite Mammal?")

