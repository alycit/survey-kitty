User.destroy_all
Survey.destroy_all
Question.destroy_all
Answer.destroy_all

alyssa = User.create!(name: "Alyssa", username: "alyssa", password: "123456")
avner = User.create!(name: "Avner", username: "avner", password: "123456")
graham = User.create!(name: "Graham", username: "graham", password: "123456")
duke = User.create!(name: "Duke", username: "duke", password: "123456")

survey1 = Survey.create!(name: "Mundane Things", creator: alyssa)

question_1_1 = Question.create!(text: "What is your favorite color?", survey: survey1)

answer_1_1_1 = Answer.create!(text: "Red", question: question_1_1)
answer_1_1_2 = Answer.create!(text: "Orange", question: question_1_1)
answer_1_1_3 = Answer.create!(text: "Yellow", question: question_1_1)
answer_1_1_4 = Answer.create!(text: "Green", question: question_1_1)
answer_1_1_5 = Answer.create!(text: "Blue", question: question_1_1)
answer_1_1_6 = Answer.create!(text: "Purple", question: question_1_1)
answer_1_1_7 = Answer.create!(text: "Brown", question: question_1_1)
answer_1_1_8 = Answer.create!(text: "Black", question: question_1_1)
answer_1_1_9 = Answer.create!(text: "White", question: question_1_1)

question_1_2 = Question.create!(text: "Which movie do you like best?", survey: survey1)

answer_1_2_1 = Answer.create!(text: "The Matrix", question: question_1_2)
answer_1_2_2 = Answer.create!(text: "Equilibrium", question: question_1_2)
answer_1_2_3 = Answer.create!(text: "Kill Bill", question: question_1_2)
answer_1_2_4 = Answer.create!(text: "Gattaca", question: question_1_2)

