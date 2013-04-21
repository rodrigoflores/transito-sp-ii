class TrafficController < ApplicationController
  def index
    @overall_traffic = Traffic::Scraper.overall_traffic
    @per_zone_traffic = Traffic::Scraper.zone_traffic
  end
end