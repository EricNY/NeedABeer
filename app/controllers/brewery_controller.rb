class BreweryController < ApplicationController
  before_action :create_brewery_db

  def create_brewery_db
    @brewery_db = BreweryDB::Client.new do |config|
      config.api_key = 'c6d57e421f45b69379556e870eb29091'
    end
  end

  def search_breweries_by_id
    @brewery = @brewery_db.breweries.all(ids: 'DnuXce', withLocations: 'Y')
    # breweries = @brewery_db.breweries.find('DnuXce')
    render({:json=>@brewery})
  end

  def show
    @id = params[:id]
    # @brewery = @brewery_db.breweries.all(ids: 'DnuXce')
    @brewery = @brewery_db.breweries.find(@id, withLocations: 'Y')
    # @brewery = Api.getBrewery(id)
  end

end

# will need a params[:id] from there I search brewery db API
