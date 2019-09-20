require 'mini_magick'

class ImageUploader < Shrine
  include ImageProcessing::MiniMagick
  plugin :validation_helpers
  plugin :determine_mime_type
  plugin :processing
  plugin :versions   # enable Shrine to handle a hash of files
  plugin :delete_raw # delete processed files after uploading

  Attacher.validate do
    validate_max_size 2*1024*1024 # 2 MB
    validate_extension_inclusion %w[jpg jpeg png gif]
    validate_mime_type_inclusion %w[image/jpeg image/png image/gif]
  end

  process(:store) do |io, context|
    original = io.download

    size_700 = resize_to_limit!(original, 700, 1400) { |cmd| cmd.auto_orient } # orient rotated images
    size_350 = resize_to_limit(size_700,  350, 700)

    {large: size_700, small: size_350}
  end
end