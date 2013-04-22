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

    data = restore_data

    return data if data

    reset_data
    @resource = restore_data
    @resource
  end

  def traffic_scrapper
    @scrapper ||= Traffic::Scraper
  end

  def expired?(date)
    Time.parse(date) < 1.minute.ago
  end

  def reset_data
    Storage.set("traffic_data", traffic_data.to_json)
  end

  def traffic_data
    {
      'overall' => traffic_scrapper.overall_traffic,
      'per_zone' => traffic_scrapper.zone_traffic,
      'recorded_at' => Time.now.to_s
    }
  end

  def restore_data
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