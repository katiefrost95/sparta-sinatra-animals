class AnimalController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), "..")

  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  #Image info
  $photos = [{
    	 id: 0,
    	 title: "Lions",
       body: "This is a Lion",
       image: "https://data.whicdn.com/images/230929611/superthumb.jpg"
    },
    {
        id: 1,
        title: "Tigers",
        body: "This is a Tiger",
        image: "http://makemypromotion.com/demos/courses/wp-content/uploads/2017/04/tiger1-300x250.jpg"
    },
    {
        id: 2,
        title: "Bears",
        body: "This is a Bear",
        image: "http://www.fun-facts.org.uk/images/bear.gif"
    }];

  #Homepage
  get "/" do
    @title = "Photo Homepage"
    erb :'photos/home'
  end

  # #Index Page
  get "/photos" do
    @title = "Photos"
    @photos = Photo.all
    erb :'photos/index'
  end

  #New photo page
  get "/photos/new" do
    @photo = Photo.new
    erb :'photos/new'
  end

  #Show photos page
  get "/photos/:id" do
    id = params[:id].to_i
    @photo = Photo.find(id)
    erb :'photos/show'
  end

  #Post new
  post '/photos' do
    photo = Photo.new
    photo.title = params[:title]
    photo.body = params[:body]
    photo.image = params[:image]
    photo.save
    redirect "/photos"
  end

  #Edit
  put '/photos/:id' do
    id = params[:id].to_i
    photo = Photo.find(id)
    photo.id = params[:id]
    photo.title = params[:title]
    photo.body = params[:body]
    photo.image = params[:image]
    photo.save
    redirect '/photos'
  end

  #Delete
  delete "/photos/:id" do
    id = params[:id]
    Photo.destroy(id)
    redirect "/photos"
  end

  #Edit page
  get "/photos/:id/edit" do
    id = params[:id].to_i
    @photo = Photo.find(id)
    erb :'photos/edit'
  end

end
