class TrafficData
  def overall_traffic
    resource['overall']
  end

  def traffic_per_zone
    resource['per_zone']
  end

  private

  def resource
    return @resource if @resource

    data = get_data

    return data if data

    @resource = fetch_data
    @resource
  end

  def traffic_scrapper
    @scrapper ||= Traffic::Scraper
  end

  def expired?(date)
    Time.parse(date) < 1.minute.ago
  end

  def fetch_data
    data = traffic_data
    Storage.set("traffic_data", traffic_data.to_json)

    puts traffic_data
    traffic_data
  end

  def traffic_data
    per_zone = {}
    traffic_scrapper.zone_traffic.each_pair do |zone, value|
      per_zone[zone.to_s] = value
    end

    {
      'overall' => traffic_scrapper.overall_traffic,
      'per_zone' => per_zone,
      'recorded_at' => Time.now.to_s
    }
  end

  def get_data
    data = Storage.get('traffic_data')

    if data
      parsed_data = JSON.parse(data)

      return if expired?(parsed_data['recorded_at'])
      parsed_data
    else
      nil
    end
  end
end