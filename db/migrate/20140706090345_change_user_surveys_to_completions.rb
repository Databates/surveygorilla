class ChangeUserSurveysToCompletions < ActiveRecord::Migration
  def change
    rename_table :user_surveys, :completions
  end
end
