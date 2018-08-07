Likeable.setup do |likeable|
  likeable.redis = Redis.new(host: "redis", port: 6379)
end