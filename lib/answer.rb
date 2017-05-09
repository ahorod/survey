class Answer < ActiveRecord::Base
  belongs_to :question
  def times
    self.times_answered += 1
  end
end
