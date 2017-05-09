require('spec_helper')

describe(Survey) do
  it("capitalize first letter of the survey title") do
    survey = Survey.create({:name => "your opinion"})
    expect(survey.name()).to(eq("Your opinion"))
  end

  describe("#questions") do
    it("survey has many questions") do
      survey = Survey.create({:name => "your opinion"})
      question1 = Question.create({:description => "Whats your name?", :survey_id => survey.id()})
      question2 = Question.create({:description => "How do you feel about ...?", :survey_id => survey.id()})
      expect(survey.questions()).to(eq([question1, question2]))
    end
  end
end
