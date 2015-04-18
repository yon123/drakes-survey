class AnsweredQuestions < ActiveRecord::Migration
  def change
    create_table :answered_questions do |t|
      t.references :response
      t.references :answer
      t.timestamps
    end
  end
end
