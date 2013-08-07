get '/' do
  @notes = Note.all
  erb :index
end

post '/' do
  new = Note.new(title: params[:title], content: params[:content])
  new.save
  redirect '/'
end

get '/:id' do
  @note = Note.find(params[:id])
  # @title = "Edit note ##{params[:id]}"
  erb :edit
end

put '/:id' do
  note = Note.find(params[:id])
  # note.title = params[:title]
  # note.content = params[:content]
  note.update_attributes(title: params[:title], content: params[:content])
  # note.save
  redirect '/'
end

get '/:id/delete' do
  @note = Note.find(params[:id])
  @title = "Confirm deletion of note ##{params[:id]}"
  erb :delete
end

delete '/:id' do
  note = Note.find(params[:id])
  note.destroy
  redirect '/'
end