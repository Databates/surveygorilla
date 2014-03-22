class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.belongs_to :question
      t.belongs_to :user
      t.belongs_to :answer_choice
######################################## Added 3/22/14
      # t.belongs_to :survey

##############################################
      t.timestamps
    end
  end
end
