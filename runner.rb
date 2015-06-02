# runner.rb
require 'pry'
require 'csv'
require_relative 'album'

albums = []

CSV.foreach('space_jams.csv', headers: true, header_converters: :symbol) do |row|
  track = row.to_hash
  album = albums.find { |a| a.id == track[:album_id] }

  # if the album hasn't been added to the albums array yet, add it
  if album.nil?
    album = Album.new(track[:album_id], track[:album_name], track[:artists])
    albums << album
  end

  # add the track to the album's @tracks instance variable
 added_track = Track.new(track[:track_id], track[:track_number], track[:duration_ms], track[:title])

 album.tracks << added_track
end

# print out the summary for each album
albums.each do |album|
  puts album.summary
end
