if ENV["REDISTOGO_URL"]
  REDIS_URI = URI.parse(ENV["REDISTOGO_URL"])
else
  REDIS_URI = URI.parse("redis://127.0.0.1:6379/")
end

Storage.setup