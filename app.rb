require './data'
require './lib/artist'

#create a new artist instance


my_dir = Dir.new("data")

entries = Dir.entries("data").select {|f| !File.directory? f}

##FIX THIS by Monday
artist = [] #artist eo line
songs = [] #title and genre
genre = []

#i = 0
#need refactoring
entries.collect! {|get_artist| get_artist.split(/.mp3/)}
entries.collect! {|parts| parts[0].split(' [')}
entries.each {|parts| songs << parts[0].split(' - ').pop}
entries.each {|parts| genre << parts[1].split(']').pop}
entries.collect! {|parts| parts[0].split(' - ')}
entries.each {|parts| artist << parts[0]}
#entries.collect {|part1, part2| part2[0].split(' - ')}

music = Hash.new
music[:catalog] = []

i = 0
(0..100).each do |i|
music[:catalog][i] = {:artist => artist[i], :song => songs[i], :genre => genre[i]}
end

i = 0
(0..100).each do |i|
artist = Artist.new(music[:catalog][i][:artist])
artist.catalog_ID([i])
artist.add_song(music[:catalog][i][:song], music[:catalog][i][:genre])
end

puts Genres::GENRES.inspect