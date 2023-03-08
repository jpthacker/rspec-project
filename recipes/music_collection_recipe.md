# Music Collection Recipe

## 1. The Problem

> As a user  
> So that I can keep track of my music listening  
> I want to add tracks I've listened to and see a list of them.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
# EXAMPLE

class MusicCollection
    def initialize #Doesn't take arguments
        @tracks # @tracks is an array (starts off empty)
    end

    def add(track) # track will be a string
    # add the track to the @tracks array
    end

    def tracks
        # returns the @tracks array
    end
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# EXAMPLE

music_collection = MusicCollection.new
music_collection.add("Sweet Home Alabama")
music_collection.track => ["Sweet Home Alabama"]
music_collection.add("Wonderwall")
music_collection.track => ["Sweet Home Alabama", "Wonderwall"]

_Encode each example as a test. You can add to the above list as you go._

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._