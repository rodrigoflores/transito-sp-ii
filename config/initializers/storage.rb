if ENV["REDISTOGO_URL"]
  REDIS_URI = URI.parse(ENV["REDISTOGO_URL"])
else
  config = YAML.load_file(Rails.root.join('config', 'redis.yml'))
  REDIS_URI = URI.parse(config[Rails.env]['path'])
end

Storage.setup