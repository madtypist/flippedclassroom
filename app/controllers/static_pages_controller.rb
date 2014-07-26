require 'rubygems'
require 'json'
require 'net/http'

class StaticPagesController < ApplicationController
  def home
  end

  def index
  end

  def help
  end

  def test
    response = Net::HTTP.get_response(URI.parse("https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLDOix9Bwbbictez7bLwU9CULuNAglyXNm&key=AIzaSyCPK2qXfkJ2LYAydvWgVWl3DuKosC_CjNA"))
    data = response.body
    @results = JSON.parse(data)

    plResponse = Net::HTTP.get_response(URI.parse("https://www.googleapis.com/youtube/v3/playlists?part=snippet&id=PLDOix9BwbbieH5xnN0lDTkwNVULQ14Usc&key=AIzaSyCPK2qXfkJ2LYAydvWgVWl3DuKosC_CjNA"))
    data2 = plResponse.body
    @listinfo = JSON.parse(data2)
    #TODO: Retreive playlist title
    @items = @results["items"]
  end
end
