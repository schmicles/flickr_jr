# Handle GET-request (Show the upload form)
get "/upload" do
  erb :upload
end

# Handle POST-request (Receive and save the uploaded file)
post "/upload" do
  byebug
  File.open('public/images/' + params['myfile'][:filename], "w") do |f|
    f.write(params['myfile'][:tempfile].read)
  end
  return "The file was successfully uploaded!"
end
