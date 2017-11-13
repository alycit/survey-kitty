get '/surveys' do
  @surveys = Survey.order(created_at: :desc)
  erb :"surveys/index"
end

get '/surveys/new' do
  authenticate!
  erb :"surveys/new"
end

get '/surveys/:id' do
  authenticate!
  @survey = Survey.includes(questions: [:answers]).find_by(id: params[:id])
  erb :"surveys/show"
end

post '/surveys' do
  authenticate!
  survey_params = params[:survey]

  survey = Survey.create(name: survey_params[:name], creator: current_user)
  survey_params.delete("name")

  survey_params.each do |question, question_params|
    question = Question.create(text: question_params[:text])
    question_params.delete("text")

    question_params.each do |answer, answer_params|
      question.answers.create(answer_params)
    end

    survey.questions << question
  end

  redirect "/surveys/#{survey.id}"
end

