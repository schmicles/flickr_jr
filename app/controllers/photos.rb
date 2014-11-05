# ----- See Photo -----
get '/albums/:album_id/:photo_id' do
  @photo = Photo.find(photo_id: params[:photo_id])
  @album = Album.find(album_id: params[:album_id])
  erb :'photos/show'
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