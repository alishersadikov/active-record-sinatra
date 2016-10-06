class FilmFile < Sinatra::Base
  get '/genres' do
    @genres = Genre.all
    erb :genres_index
  end

  get '/directors' do
    @directors = Director.all
    erb :directors_index
  end

  get '/directors/:id' do |id|
    @director = Director.find(id)
    erb :director_show
  end

  get '/films' do
    @films = Film.all
    erb :films_index
  end

  get '/films/new' do
    erb :new
  end

  get '/films/:id' do |id|
    @film = Film.find(id)
    erb :show
  end

  post '/films' do
    film = Film.create({"title"=>params[:film][:title], "year"=>params[:film][:year].to_i, "box_office_sales"=>params[:film][:box_office_sales]})
    redirect '/films'
  end

  get '/films/:id/edit' do |id|
    @film = Film.find(id)
    erb :edit
  end

  put '/films/:id' do |id|
    Film.update(id, {"title"=>params[:film][:title], "year"=>params[:film][:year].to_i, "box_office_sales"=>params[:film][:box_office_sales]})
    redirect "/films/#{id}"
  end

  delete '/films/:id' do |id|
    Film.delete(id)
    redirect '/films'
  end 
end
