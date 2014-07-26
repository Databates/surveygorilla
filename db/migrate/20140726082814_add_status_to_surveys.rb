class AddStatusToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :status, :string, default: 'draft'
  end
end
