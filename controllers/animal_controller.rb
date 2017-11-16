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
       img: "https://data.whicdn.com/images/230929611/superthumb.jpg"
    },
    {
        id: 1,
        title: "Tigers",
        img: "http://makemypromotion.com/demos/courses/wp-content/uploads/2017/04/tiger1-300x250.jpg"
    },
    {
        id: 2,
        title: "Bears",
        img: "http://www.fun-facts.org.uk/images/bear.gif"
    }];

  #Homepage
  get "/" do
    @title = "Photo Homepage"
    erb :'photos/home'
  end

  # #Index Page
  get "/photos" do
    @title = "Photos"
    @photos =$photos
    erb :'photos/index'
  end

  #New photo page
  get "/photos/new" do
    @photo = $photos
    erb :'photos/new'
  end

  #Show photos page
  get "/photos/0" do
    id = params[0].to_i
    @photo1 = $photos[0]
    erb :'photos/lion'
  end

  get "/photos/1" do
    id = params[1].to_i
    @photo2 = $photos[1]
    erb :'photos/tigers'
  end

  get "/photos/2" do
    id = params[2].to_i
    @photo3 = $photos[2]
    erb :'photos/bears'
  end

  #Edit page
  get "/photos/:id/edit" do
    @photo = $photos
    erb :'photos/edit'
  end

end
