class StudentController < ApplicationController
  def assignment
    code = params[:code]
    @classroom = Classroom.find_by_code(code)
    @youtubeid = @classroom.activePlaylistLink
    @youtubeid.slice!("https://www.youtube.com/playlist?list=")

    response = Net::HTTP.get_response(URI.parse("https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=#{@youtubeid}&key=AIzaSyCPK2qXfkJ2LYAydvWgVWl3DuKosC_CjNA"))
    data = response.body
    @results = JSON.parse(data)

    plResponse = Net::HTTP.get_response(URI.parse("https://www.googleapis.com/youtube/v3/playlists?part=snippet&id=#{@youtubeid}&key=AIzaSyCPK2qXfkJ2LYAydvWgVWl3DuKosC_CjNA"))
    data2 = plResponse.body
    @listinfo = JSON.parse(data2)
    
    @items = @results["items"]
  end
end
