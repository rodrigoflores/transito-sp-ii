class TrafficData
  def overall_traffic
    @overall = Storage.get("overall")
    if @overall && !expired?
      return @overall.to_i
    end

    reset_traffic_data
    Storage.get("overall").to_i
  end

  def traffic_per_zone
    @per_zone = Storage.get("per_zone")
    if @per_zone && !expired?
      return JSON.parse(@per_zone)
    end

    reset_traffic_data
    JSON.parse(Storage.get("per_zone"))
  end

  private

  def traffic_scrapper
    @scrapper ||= Traffic::Scraper
  end

  def expired?
    return true unless Storage.get("recorded_at")

    Time.parse(Storage.get("recorded_at")) < 5.minutes.ago
  end

  def reset_traffic_data
    Storage.set("per_zone", traffic_scrapper.zone_traffic.to_json)
    Storage.set("overall", traffic_scrapper.overall_traffic.to_s)
    reset_timestamp
  end

  def reset_timestamp
    Storage.set("recorded_at", Time.now.to_s)
  end
end