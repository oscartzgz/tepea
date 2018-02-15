# Required for image processing
require 'mini_magick'

class PhotoUploader < Shrine
  include ImageProcessing::MiniMagick
  plugin :validation_helpers
  plugin :determine_mime_type
  plugin :processing
  plugin :versions   # enable Shrine to handle a hash of files
  plugin :delete_raw # delete processed files after uploading

  Attacher.validate do
    validate_max_size 10*1024*1024 # 10 MB
    # validate_extension_inclusion %w[jpg jpeg png gif]
    validate_mime_type_inclusion %w[image/jpg image/jpeg image/png image/gif]
  end

  process(:store) do |io, context|
    original = io.download

    large = resize_to_limit!(original, 1000, 860) { |cmd| cmd.auto_orient } # orient rotated images
    medium = resize_to_limit(large,  800, 640)
    small = resize_to_limit(medium,  350, 280)

    {large: large, medium: medium, small: small}
  end
end