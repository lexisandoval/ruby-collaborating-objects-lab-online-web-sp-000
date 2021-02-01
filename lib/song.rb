class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
       if self.find(name)
         self.find(name)
       else self.create(name)
       end
     end

      def self.create(name)
       artist = Artist.new(name)
       artist.save
       artist
     end

      def self.find(name)
       self.all.detect {|artist| artist.name == name}
     end

  def artist_name=(name)
    if (self.artist.nil?)
      self.artist = Artist.new(name)
    else
      self.artist.name = name
    end
  end

end
