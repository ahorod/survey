class AddTimesAnsweredColumnToAnswersDefault < ActiveRecord::Migration[5.1]
  def change
    remove_column(:answers, :times_answered, :integer)
    add_column(:answers, :times_answered, :integer, :default => 0)
  end
end
