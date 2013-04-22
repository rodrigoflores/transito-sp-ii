config = YAML.load_file(Rails.root.join('config', 'redis.yml'))
REDIS_URI = URI.parse(config[Rails.env]['path'])

Storage.setup