class HomeController < ApplicationController
  # before you run any action, do the following (defined below)
  before_action :create_brewery_db

  def index
    @test = "test"
    if user_signed_in?

      redirect_to :controller=>'dashboard', :action =>'index'

    end
  end

  def create_brewery_db
    @brewery_db = BreweryDB::Client.new do |config|
      config.api_key = 'c6d57e421f45b69379556e870eb29091'
    end
  end

  def search_breweries_by_location
    breweries = @brewery_db.locations.all(locality: params[:locality])
    render({:json=>breweries})
  end

end
