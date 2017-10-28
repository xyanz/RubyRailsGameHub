require 'httparty'
class GamesController < ApplicationController
  # API Call for all games for matching platform
  # @pr passed in from platforms_controller
  # map to separate array into string with no spaces between commas for use in URL
  # Use masked API Key stored with help of Figaro gem in application.yml
  def index
    games_ids = @pr['games'].map(&:inspect).join(',')
    url = "https://api-2445582011268.apicast.io/games/#{games_ids}?fields=*"
    response = HTTParty.get(url, headers: {"user-key" => Figaro.env.igdb_api_key, "Accept": "application/json"})
    puts response.parsed_response
  end
    # API Call for single game with params ID
  def show
    # puts "PARAMSSSSS CONTROLLER #{params[:id]}"
    url = "https://api-2445582011268.apicast.io/games/#{params[:id]}"
    response = HTTParty.get(url, headers: {"user-key" => Figaro.env.igdb_api_key, "Accept": "application/json"})
    @game_response = response.parsed_response
    if logged_in?
      @post = current_user.posts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
end
