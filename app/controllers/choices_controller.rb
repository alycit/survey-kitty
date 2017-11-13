post '/surveys/:id/choices' do
  choices = params[:choices]

  choices.each do |question_id, answer_id|
    Choice.create(taker: current_user, answer_id: answer_id)
  end

  content_type :json
  Survey.stats_for(params[:id]).to_json
end
