require_relative "../../lib/album.rb"

describe Album do
  let (:choirgirl_hotel) {choirgirl_hotel = Album.new("19", "From the Choirgirl Hotel", "Tori Amos")}
  describe 'title' do
    it 'should return the title of the album' do
      choirgirl_hotel = Album.new("19", "From the Choirgirl Hotel", "Tori Amos")
      expect(choirgirl_hotel.title).to eq("From the Choirgirl Hotel")
    end
  end

  describe '#summary' do
    it 'should return the title, duration, and tracklist of the album' do
      tracks = [Track.new(1, 1, 247800, "Spark"),
                Track.new(2, 2, 244200, "Cruel"),
                Track.new(3, 3, 262800, "Black-Dove"),
                Track.new(4, 4, 214800, "Raspberry Swirl"),
                Track.new(5, 5, 240000, "Jackie's Strength"),
                Track.new(6, 6, 240000, "i i e e e", ),
                Track.new(7, 7, 360000, "Liquid Diamonds"),
                Track.new(8, 8, 180000, "She's Your Cocaine"),
                Track.new(9, 9, 240000, "Northern Lad"),
                Track.new(10, 10, 3000000, "Hotel"),
                Track.new(11, 11, 244800, "Playboy Mommy"),
                Track.new(12, 12, 267000, "Pandora's Aquarium")
                ]
      tracks.each do |track|
        choirgirl_hotel.tracks << track
      end
      choirgirl_summary = "Name: From the Choirgirl Hotel\n Artists: Tori Amos\n Duration(min): 95.69\n Tracks:\n- Spark\n- Cruel\n- Black-Dove\n- Raspberry Swirl\n- Jackie's Strength\n- i i e e e\n- Liquid Diamonds\n- She's Your Cocaine\n- Northern Lad\n- Hotel\n- Playboy Mommy\n- Pandora's Aquarium\n\n"
      expect(choirgirl_hotel.summary).to eq(choirgirl_summary)
    end
  end

  describe '#compile_track_titles' do
    it 'should return an array of the album\'s track titles' do
      tracks = [Track.new(1, 1, 247800, "Spark"),
                Track.new(2, 2, 244200, "Cruel"),
                Track.new(3, 3, 262800, "Black-Dove"),
                Track.new(4, 4, 214800, "Raspberry Swirl"),
                Track.new(5, 5, 240000, "Jackie's Strength"),
                Track.new(6, 6, 240000, "i i e e e", ),
                Track.new(7, 7, 360000, "Liquid Diamonds"),
                Track.new(8, 8, 180000, "She's Your Cocaine"),
                Track.new(9, 9, 240000, "Northern Lad"),
                Track.new(10, 10, 3000000, "Hotel"),
                Track.new(11, 11, 244800, "Playboy Mommy"),
                Track.new(12, 12, 267000, "Pandora's Aquarium")
                ]
      tracks.each do |track|
        choirgirl_hotel.tracks << track
      end

      tracks_array = ["Spark", "Cruel", "Black-Dove", "Raspberry Swirl",
        "Jackie's Strength", "i i e e e", "Liquid Diamonds", "She's Your Cocaine",
        "Northern Lad", "Hotel", "Playboy Mommy", "Pandora's Aquarium"]
      expect(choirgirl_hotel.compile_track_titles).to eq(tracks_array)
    end
  end

end
