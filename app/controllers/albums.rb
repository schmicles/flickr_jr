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

# Delete Post
# delete '/posts' do
#   Post.find(params[:id]).destroy
#   redirect '/posts'
# end

get '/album/:id' do
  @user = User.find_by(id: session[:user_id])
  @album = Album.where(id: params[:id])
  @photos = Photo.where(album_id: @album.id)

  erb :'albums/show'
end