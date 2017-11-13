get '/surveys' do
  @surveys = Survey.order(created_at: :desc)
  erb :"surveys/index"
end

get '/surveys/:id' do
  authenticate!
  @survey = Survey.includes(questions: [:answers]).find_by(id: params[:id])
  erb :"surveys/show"
end
