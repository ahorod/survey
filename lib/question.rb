class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :answers
  scope :next, lambda {|id| where("id > ?",id).order("id ASC") }

  def next
    survey.questions.next(self.id).first
  end

end
