class Photo

  attr_accessor :id, :title, :body, :image

  def save
    conn = Photo.open_connection
    if(self.id)
      sql = "UPDATE animals SET title='#{self.title}', body='#{self.body}', image='#{self.image}' WHERE id = #{self.id}"
    else
      sql = "INSERT INTO animals (title, body, image) VALUES ('#{self.title}', '#{self.body}', '#{self.image}')"
    end
    conn.exec(sql)
  end

  def self.open_connection
    conn = PG.connect(dbname: "animals")
  end

  def self.all
    conn = self.open_connection
    sql = "SELECT id,title,body,image FROM animals ORDER BY id DESC"
    results = conn.exec(sql)
    photos = results.map do |photo|
      self.hydrate(photo)
    end
  end

  def self.find(id)
    conn = self.open_connection
    sql = "SELECT * FROM animals WHERE id =#{id} LIMIT 1"
    photos = conn.exec(sql)
    photo = self.hydrate(photos[0])
    photo
  end

  def self.destroy(id)
    conn = self.open_connection
    sql = "DELETE FROM animals WHERE id = #{id}"
    conn.exec(sql)
  end

  def self.hydrate(photo_data)
    photo = Photo.new
    photo.id = photo_data['id']
    photo.title = photo_data['title']
    photo.body = photo_data['body']
    photo.image = photo_data['image']
    photo
  end
end
