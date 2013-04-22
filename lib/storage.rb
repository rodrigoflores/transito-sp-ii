class Storage
  class << self
    def setup
      @redis = Redis.new(host: "127.0.0.1", port: 6379)
    end

    def set(key, value)
      @redis.set(key, value)
    end

    def get(key)
      @redis.get(key)
    end
  end
end