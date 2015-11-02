class FileNotFoundException < StandardError
end

class FileHandler
  def initialize(directory)
    @directory = directory
  end

  def read_file(uri)
    full_file_path = @directory+uri

    if File.exists?(full_file_path)
      File.read(full_file_path)
    else
      raise FileNotFoundException
    end
  end
end
