class Storage
  class << self
    def setup
      uri = REDIS_URI
      @redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
    end

    def set(key, value)
      @redis.set(key, value)
    end

    def get(key)
      @redis.get(key)
    end

    def clean
      @redis.flushall
    end
  end
end