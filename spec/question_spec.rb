require('spec_helper')

describe(Question) do
  describe('#answers') do
    it('each question has many answers') do
      question = Question.create({:description => "what day is today?"})
      answer1 = Answer.create({:option => 'Monday', :question_id => question.id()})
      answer2 = Answer.create({:option => 'Tuesday', :question_id => question.id()})
      expect(question.answers()).to(eq([answer1, answer2]))
    end
  end
end
