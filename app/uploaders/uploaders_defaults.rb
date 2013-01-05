require 'digest/sha2'

module UploadersDefaults
  def store_path(for_file = filename)
    ext = for_file.split('.').last
    base_name = "#{hash(full_filename(for_file))}.#{ext}" 
    File.join([store_dir, base_name].compact)
  end

  private 
    def hash(name)
      Digest::SHA384.hexdigest(SALT[:files] + name)
    end
end
