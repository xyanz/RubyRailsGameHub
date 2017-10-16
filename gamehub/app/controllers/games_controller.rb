require 'httparty'
class GamesController < ApplicationController
  def index
    games_ids = @pr['games']
    url = "https://api-2445582011268.apicast.io/games/#{games_ids}?fields=*"
    response = HTTParty.get(url, headers: {"user-key" => Figaro.env.igdb_api_key, "Accept": "application/json"})
    puts response.parsed_response
  end
  def show
    # puts "PARAMSSSSS CONTROLLER #{params[:id]}"
    # url = "https://api-2445582011268.apicast.io/platforms/#{params[:id]}"
    # response = HTTParty.get(url, headers: {"user-key" => Figaro.env.igdb_api_key, "Accept": "application/json"})
    # @pr = response.parsed_response[0]
  end
end
