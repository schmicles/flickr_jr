# ----- Log In Page -----
get '/login' do
  erb :'sessions/new'
end

# ----- View User Albums -----
get '/users/:user_id/albums' do
  @user = User.find(params[:user_id])

  # erb :'users/show'
  erb :index
end

# ----- See All of MY Albums -----
get '/users/:id' do
  @user = User.find_by(id: params[:id])
  @all_albums = Album.where(user_id: @user.id).order('id DESC')

  erb :'albums/index'
end

# ----- Logging In -----
post '/sessions' do
  if User.valid?(params[:username])
    new_user = User.find_by(username: params[:username])

    if new_user.authenticate(params[:password])
      session[:user_id] = new_user.id
      redirect "/"
    else
      erb :'sessions/new'
    end
  else
    erb :'sessions/new'
  end
end

# ----- Creating Users -----
post '/users' do
  @user = User.new(username: params[:username], password: params[:password])
  if @user.save
    session[:user_id] = @user.id
    redirect "/"
  else
    erb :'sessions/new'
  end
end

# ----- Log Out -----
delete '/logout' do
  session.clear
  redirect '/?logout_success'
end