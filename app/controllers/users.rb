get '/' do
  erb :"user/index"
end

get '/login' do
  erb :"user/login"
end

post '/login' do
  @user = User.where(email: params[:email]).first

  if @user && @user.password == params[:password]
    session[:user_id] = @user.id
    # redirect "/users/#{@user.id}"
    redirect "/surveys"
  else
    status 400
    @failed_login = true
    erb :"user/login"
  end

end

get '/signup' do
  @user = User.new
  erb :"user/signup"
end
#create a new user
post '/signup' do
  @user = User.new(
    name: params[:name],
    email: params[:email],
    password: params[:password],
  )
  if @user.save
    status 200
    # login ???
    session[:user_id] = @user.id
    # redirect "/users/#{@user.id}"
    redirect "/surveys"
  else
    status 400
    erb :"user/signup"
  end
end
