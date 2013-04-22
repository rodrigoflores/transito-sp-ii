config = YAML.load_file(Rails.root.join('config', 'redis.yml'))
REDIS_URI = URI.parse(config[Rails.env]['path'])
REDIS_URI = URI.parse(ENV['REDISTOGO_URL']) if ENV['REDISTOGO_URL']

Storage.setup