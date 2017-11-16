class AnimalController < Sinatra::Base

  set :root, File.join(File.dirname(__FILE__), "..")

  set :views, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  #Image info
  $photos = [{
    	 id: 0,
    	 title: "Photo 1",
    	 body: "Lions",
       img: "https://data.whicdn.com/images/230929611/superthumb.jpg"
    },
    {
        id: 1,
        title: "Photo 2",
        body: "Tigers",
        img: "http://makemypromotion.com/demos/courses/wp-content/uploads/2017/04/tiger1-300x250.jpg"
    },
    {
        id: 2,
        title: "Photo 3",
        body: "Bears",
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
  get "/photos/:id" do
    id = params[:id].to_i
    @photo = $photos[id]
    erb :'photos/show'
  end
  
  #Edit page
  get "/photos/:id/edit" do
    @photo = $photos
    erb :'photos/edit'
  end

end
