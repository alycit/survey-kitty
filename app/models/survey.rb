class Survey < ApplicationRecord
  belongs_to :creator, class_name: :User
  has_many :questions

  def self.stats_for(survey_id)
    survey = Survey.find(survey_id)

    survey.questions.map do |question|
      stat = { question: question.text, labels: [], data: [] }

      question.answers.each do |answer|
        stat[:labels].push(answer.text)
        stat[:data].push(answer.choices.count)
      end
      stat
    end
  end
end
