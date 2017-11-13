class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.string :text, null: false
      t.integer :question_id

      t.timestamps
    end
  end
end
