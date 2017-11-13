class Choice < ApplicationRecord
  belongs_to :taker, class_name: :User
  belongs_to :answer

  validates :answer_id, presence: {message: "All fields are required"}
end
