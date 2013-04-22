class TrafficController < ApplicationController
  respond_to :html, :json

  def index
    traffic = TrafficData.new
    @overall_traffic = traffic.overall_traffic
    @per_zone_traffic = traffic.traffic_per_zone

    respond_to do |format|
      format.html
      format.json { render json: translate_hash }
    end
  end

  private

  def translate_hash
    {
      zonas: {
        norte: @per_zone_traffic['north'],
        sul: @per_zone_traffic['south'],
        leste: @per_zone_traffic['east'],
        oeste: @per_zone_traffic['west'],
        centro: @per_zone_traffic['downtown']
      },
      total: @overall_traffic
    }
  end
end