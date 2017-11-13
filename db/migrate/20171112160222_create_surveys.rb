class CreateSurveys < ActiveRecord::Migration[5.1]
  def change
    create_table :surveys do |t|
      t.string :name, null: false
      t.integer :creator_id

      t.timestamps
    end
  end
end
