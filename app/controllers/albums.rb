# ----- Create New Album -----
get '/albums/new' do
  @user = User.find_by(id: session[:user_id])
  erb :'albums/new'
end

# ----- See Album -----
get '/albums/:id' do
  @album = Album.find_by(id: params[:id])
  @photos = Photo.where(id: params[:id])
  erb :'albums/show'
end

# ----- Create New Album -----
post '/albums' do
  @user = User.find_by(id: session[:user_id])

  @new_album = @user.albums.build(params[:post])
  if @new_album.save
    redirect "/albums/#{@new_album.id}/upload"
  else
    erb :'albums/new'
  end
end

# ----- Delete Album -----
delete '/albums' do
  album = Album.find(params[:id])
  user = album.user
  album.destroy
  redirect "/users/#{user.id}"
end
