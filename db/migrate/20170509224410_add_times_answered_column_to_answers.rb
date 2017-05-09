class AddTimesAnsweredColumnToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_column(:answers, :times_answered, :integer)
  end
end
