class Album
  attr_accessor :id, :title, :artists, :tracks

  def initialize (id, title, artists, *tracks)
    @id = id
    @title = title
    @artists = artists
    @tracks = tracks
  end

  def compile_track_titles
    tracks.map do |track|
      track.title
    end
  end

  def summary
    summary = "Name: #{title}\n Artists: #{artists}\n Duration(min): #{album_length}\n Tracks:\n"
    compile_track_titles.each do |track|
        summary += "- #{track}\n"
      end
    summary += "\n"
    summary
  end

  def album_length
    track_lengths_ms = []
    tracks.map do |track|
      track_lengths_ms << track.duration
    end
    track_lengths_min = []
    track_lengths_ms.map do |track|
      track_time = track.to_f / 60000.0
      track_lengths_min << track_time.round(2)
    end
    length = track_lengths_min.reduce(:+).round(2).to_s
  end
end

class Track
  attr_accessor :id, :number, :duration, :title
  def initialize (id, number, duration, title)
    @id = id
    @number = number
    @duration = duration
    @title = title
  end
end
