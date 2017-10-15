class PlatformsController < ApplicationController
  def index
    render html: 'platform index'
  end
  def show
    render html: "show action"
  end
end
