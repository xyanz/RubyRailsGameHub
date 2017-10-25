require 'httparty'
class TimelinesController < ApplicationController
  def index
  header = {
    "user-key"  => Figaro.env.igdb_api_key,
    "Accept" => "application/json"
  }
  url = 'https://api-2445582011268.apicast.io'
  response = HTTParty.get(url, header)
  response.parsed_response
  puts "RESPONSE 111111 #{response}"
  puts "RESPONSE 111111 #{response.parsed_response}"
  end
  def show
  end
end
