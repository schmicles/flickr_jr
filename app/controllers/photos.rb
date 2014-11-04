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
  File.open('public/images/' + params['myfile'][:filename], "w") do |f|
    f.write(params['myfile'][:tempfile].read)
  end
  return "The file was successfully uploaded!"
  redirect '/albums/:album_id'
end
