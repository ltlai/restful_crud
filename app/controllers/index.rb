get '/' do
  @notes = Note.all
  erb :index
end

post '/' do
  new = Note.new(title: params[:title], content: params[:content])
  new.save
  redirect '/'
end

get '/:id/edit' do
  @note = Note.find(params[:id])
  erb :edit
end

put '/:id' do
  note = Note.find(params[:id])
  note.update_attributes(title: params[:title], content: params[:content])
  redirect '/'
end

get '/:id/delete' do
  @note = Note.find(params[:id])
  erb :delete
end

delete '/:id' do
  note = Note.find(params[:id])
  note.destroy
  redirect '/'
end