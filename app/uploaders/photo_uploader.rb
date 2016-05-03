# encoding: utf-8

class PhotoUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  storage :fog

  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end

  def store_dir
    "uploads2/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_limit: [1000,1000]

  version :large do
  	  process resize_to_limit: [700,700]
  end

  version :medium, from_version: :large do
  	process resize_to_limit: [500,500]
  end

  version :small, from_version: :medium do
    process resize_to_limit: [250, 250]
  end

  version :square_250, from_version: :medium do
    process resize_to_fill: [250, 250]
  end

  version :square_thumb, from_version: :small do
  	process resize_to_fill: [80, 80]
	end

 # Add a white list of extensions which are allowed to be uploaded.
 # For images you might use something like this:
 def extension_white_list
   %w(jpg jpeg gif png)
 end

end
