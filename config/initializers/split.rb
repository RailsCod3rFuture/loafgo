Split.configure do |config|
  config.persistence = :cookie
  # config.persistence = Split::Persistence::RedisAdapter.with_config(lookup_by: ->(context) { context.manager.id })
end
