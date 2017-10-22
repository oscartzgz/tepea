require "shrine"
require "shrine/storage/file_system"
require "shrine/storage/s3"

# s3_options = Shrine::Storage::S3.new(
# )
s3_options = {
  access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
  region: ENV['AWS_REGION'],
  bucket: ENV['AWS_BUCKET']
}

Shrine.storages = {
  # cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"), # temporary
  # store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/store"), # permanent
  cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
  store: Shrine::Storage::S3.new(prefix: "store", **s3_options)
}

# Shrine.plugin :sequel # or :activerecord
Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data # for forms
Shrine.plugin :rack_file # for non-Rails apps
