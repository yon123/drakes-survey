get '/surveys' do
  if session[:user_id]
    @my_surveys = Survey.where(user_id: session[:user_id])
  end
  @surveys = Survey.all
  # p "hello #{current_user}"
  erb :'/surveys/index'
end

get '/surveys/new' do
  @user = true #current_user.id
  erb :'/surveys/index'
end

get '/surveys/:id' do
  @questions = Survey.find(params[:id]).questions
  erb :'/surveys/index'
end

post '/surveys' do
  @survey = Survey.new(title: params[:title], user_id: params[:user_id])
  @survey.save
  erb :'/surveys/index'
end

post '/questions' do
  @question = Question.create(params)
  erb :'/surveys/index'
end

post '/answers' do
  @answer1 = Answer.create(answer: params[:answer1], question_id: params[:question_id])
  @answer2 = Answer.create(answer: params[:answer2], question_id: params[:question_id])
  @answer3 = Answer.create(answer: params[:answer3], question_id: params[:question_id]) if params[:answer3]
  @answer4 = Answer.create(answer: params[:answer4], question_id: params[:question_id]) if params[:answer4]
  @answer5 = Answer.create(answer: params[:answer5], question_id: params[:question_id]) if params[:answer5]
  @answer6 = Answer.create(answer: params[:answer6], question_id: params[:question_id]) if params[:answer6]
  @question = Question.find(@answer1.question_id)
  @survey = Survey.find(@question.survey_id)
  erb :'/surveys/index'
end

get '/questions/:id' do
  question = Question.find(params[:id])
  @survey = Survey.find(question.survey_id)
  erb :'/surveys/index'
end


