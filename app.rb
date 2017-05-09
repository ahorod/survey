require('sinatra')
require('sinatra/reloader')
require("sinatra/activerecord")
require('./lib/survey')
require('./lib/question')
require('./lib/answer')
also_reload('lib/**/*.rb')
require("pg")


get('/') do
  erb(:index )
end

get('/designer') do
  @surveys = Survey.all()
  erb(:designer)
end

post('/surveys') do
  name = params.fetch('name')
  survey = Survey.create({:name => name})
  @surveys = Survey.all()
  erb(:designer)
end

get('/surveys/:id') do
  @survey = Survey.find(params.fetch('id').to_i())
  erb(:survey)
end

#add questions to survey
post('/questions') do
  description = params.fetch('description')
  survey_id = params.fetch('survey_id').to_i()
  question = Question.create({:description => description, :survey_id => survey_id})
  @survey = Survey.find(survey_id)
  @questions = Question.all()
  erb(:survey)
end

#Edit survey info
get('/surveys/:id/edit') do
  @survey = Survey.find(params.fetch('id').to_i())
  erb(:survey_edit_form)
end

#update survey
patch('/surveys/:id') do
  @survey = Survey.find(params.fetch('id').to_i())
  new_name = params.fetch('name')
  @survey.update({:name => new_name})
  erb(:survey)
end

#delete survey
delete('/surveys/:id') do
  @survey = Survey.find(params.fetch('id').to_i())
  @survey.delete()
  Question.where(survey_id: @survey.id()).destroy_all()
  @surveys = Survey.all()
  erb(:designer)
end

#view individual question_id
get('/questions/:id') do
  @question = Question.find(params.fetch('id').to_i())
  erb(:question)
end

#add answers to questions
post('/answers') do
  option = params.fetch('option')
  question_id = params.fetch('question_id').to_i()
  option = Answer.create({:option => option, :question_id => question_id})
  @question = Question.find(question_id)
  erb(:question)
end

###### SURVEY TAKER ##########

get('/user') do
  @surveys = Survey.all()
  erb(:surveys_user)
end

get('/user/surveys/:id') do
  @survey = Survey.find(params.fetch('id').to_i())
  erb(:survey_user)
end
