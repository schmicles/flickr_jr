post '/comments' do
  post = Post.find(params[:post_id])

  post.comments.build(user_id: session[:user_id], content: params[:comment])
  post.save
  redirect "/posts/#{params[:post_id]}"
end

# ----- See Photo -----
get '/albums/:id' do
  @album = Album.find(params[:id])
  erb :'albums/show'
end

# ----- Show the upload form -----
get '/photos/:id' do
  @new_album = Album.find_by( id: params[:id])
  @user = User.find_by(id: session[:user_id])
  erb :'/photos/new'
end

# ----- Receive and save the uploaded file -----
post '/photos' do
  photo = Photo.new(file_name: params[:post][:file_name][:filename], caption: params[:post][:caption], album_id: params[:post][:album_id])
  photo.save
  File.open('public/images/' + params[:post][:file_name][:filename], "w") do |f|
    f.write(params[:post][:file_name][:tempfile].read)
  end
  redirect "/albums/#{params[:post][:album_id]}/#{photo.id}"
end

# ----- Delete Photo -----
delete '/photos' do
  Photo.find(params[:id]).destroy
  redirect '/photos'
end