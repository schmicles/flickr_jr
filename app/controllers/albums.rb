# ----- Create New Album -----
get '/albums/new' do
  @user = User.find_by(id: session[:user_id])
  erb :'albums/new'
end

# ----- See All of MY Albums -----
get '/albums/:id' do
  @user = User.find_by(id: session[:user_id])
  @all_albums = Album.where(user_id: @user.id)

  erb :'albums/index'
end

# ----- Create New Album -----
post '/albums' do
  @user = User.find_by(id: session[:user_id])

  @new_album = @user.albums.build(params[:post])
  if @new_album.save
    redirect "/photos/#{@new_album.id}"
  else
    erb :'photos/new'

  end
end

# ----- Delete Post -----
delete '/albums' do
  album = Album.find(params[:id])
  user = album.user
  album.destroy
  redirect "/albums/#{user.id}"
end
