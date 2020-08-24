class Genre
    attr_accessor :type

    @@all = []

    def initialize(type)
        @type = type 
        @@all << self
    end 
    
    def self.all
        @@all
    end 
    
    def self.clear_all
        @@all.clear
    end 
end 
         