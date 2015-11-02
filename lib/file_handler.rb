class FileHandler
  def initialize(directory)
    @directory = directory
  end

  def read_file(uri)
    File.read(@directory+uri)
  end
end
