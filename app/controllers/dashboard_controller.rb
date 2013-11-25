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
    brewery = @brewery_db.breweries.all(name: params[:name], withLocations: params[:withLocations])
    render({:json=>brewery})
  end

  def get_brewery_using_breweries_id
    brewery = @brewery_db.breweries.all(ids: params[:ids], withLocations: params[:withLocations])
    render({:json=>brewery})
  end

  def get_categories
    categories = @brewery_db.categories.all()
    render({:json=>categories})
  end

  def get_styles
    styles = @brewery_db.styles.all()
    render({:json=>styles})
  end

  def get_beers
    beers = @brewery_db.beers.all(styleId: params[:styleId], withBreweries: 'Y', abv: params[:abv])
    render({:json=>beers})
  # //216
  end

end
