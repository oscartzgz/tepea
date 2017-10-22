# Required for image processing
require 'mini_magick'

class PhotoUploader < Shrine
  include ImageProcessing::MiniMagick
  plugin :processing
  plugin :versions   # enable Shrine to handle a hash of files
  plugin :delete_raw # delete processed files after uploading

  process(:store) do |io, context|
    original = io.download

    size_800 = resize_to_limit!(original, 800, 800) { |cmd| cmd.auto_orient } # orient rotated images
    size_500 = resize_to_limit(size_800,  500, 500)
    size_300 = resize_to_limit(size_500,  300, 300)

    {large: size_800, medium: size_500, small: size_300}
  end
end