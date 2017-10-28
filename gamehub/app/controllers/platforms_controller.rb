require 'httparty'
class PlatformsController < ApplicationController
  def index
  end
    # API Call for info about platform(console)
    # 2nd API Call to get all games for matching platform(console)
    # map to separate array into string with no spaces between commas for use in URL
  def show
    url = "https://api-2445582011268.apicast.io/platforms/#{params[:id]}"
    response = HTTParty.get(url, headers: {"user-key" => Figaro.env.igdb_api_key, "Accept": "application/json"})
    @pr = response.parsed_response[0]
    games_ids = @pr['games'].map(&:inspect).join(',')
    url = "https://api-2445582011268.apicast.io/games/#{games_ids}?fields=name"
    response = HTTParty.get(url, headers: {"user-key" => Figaro.env.igdb_api_key, "Accept": "application/json"})
    @pr2 = response.parsed_response
  end
end

