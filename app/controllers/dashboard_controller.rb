class DashboardController < ApplicationController
  before_filter :authenticate_user!
  before_action :create_brewery_db

  def index

  end

  def create_brewery_db
    @brewery_db = BreweryDB::Client.new do |config|
      config.api_key = 'c6d57e421f45b69379556e870eb29091'
    end
  end

  def search_breweries_by_name
    brewery = @brewery_db.breweries.all(name: params[:name])
    render({:json=>brewery})
  end

  def search_breweries_by_location
    breweries = @brewery_db.locations.all(ids: params[:ids])
    render({:json=>breweries})
  end

  def search_breweries_by_id
    # use ruby lib
    brewery = @brewery_db.brewery(id: 'DnuXce').locations
    render({:json=>brewery})
  end

end
