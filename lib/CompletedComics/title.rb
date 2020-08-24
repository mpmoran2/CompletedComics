class Title
    attr_accessor :title, :author

    @@all = []

    def initialize(title, author)
        @title = title
        @author = author
        @@all << self 
    end 
    
    def self.all
        @@all 
    end 
 
    def self.clear_all
        @@all.clear
    end 
        
end 