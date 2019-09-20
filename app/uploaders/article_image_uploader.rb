require 'mini_magick'

class ArticleImageUploader < Shrine
  include ImageProcessing::MiniMagick
  plugin :validation_helpers
  plugin :determine_mime_type
  plugin :processing
  plugin :versions   # enable Shrine to handle a hash of files
  plugin :delete_raw # delete processed files after uploading

  Attacher.validate do
    validate_max_size 10*1024*1024 # 10 MB
    validate_extension_inclusion %w[jpg jpeg png]
    validate_mime_type_inclusion %w[image/jpeg image/png]
  end

  process(:store) do |io, context|
    original = io.download

    size_large = resize_to_fill!(original, 850, 300, gravity: 'Center') { |cmd| cmd.auto_orient } # orient rotated images
    size_normal = resize_to_fill(size_large,  425, 150, gravity: 'Center')
    size_small = resize_to_fill(size_normal, 255, 90, gravity: 'Center')

    {large: size_large, normal: size_normal, small: size_small}
  end
end