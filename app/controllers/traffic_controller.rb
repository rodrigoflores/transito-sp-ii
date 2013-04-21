class TrafficController < ApplicationController
  respond_to :html, :json

  def index
    @overall_traffic = Traffic::Scraper.overall_traffic
    @per_zone_traffic = Traffic::Scraper.zone_traffic

    respond_to do |format|
      format.html
      format.json { render json: translate_hash }
    end
  end

  private

  def translate_hash
    {
      zonas: {
        norte: @per_zone_traffic[:north],
        sul: @per_zone_traffic[:south],
        leste: @per_zone_traffic[:east],
        oeste: @per_zone_traffic[:west],
        centro: @per_zone_traffic[:downtown]
      },
      total: @overall_traffic
    }
  end
end