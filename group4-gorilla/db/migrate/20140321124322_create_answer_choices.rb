class CreateAnswerChoices < ActiveRecord::Migration
  def change
    create_table :answer_choices do |t|
      t.belongs_to :question
      t.string     :text
      t.timestamps
    end
  end
end
