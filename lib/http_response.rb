class HttpResponse
  def initialize(file_data)
    @file_data = file_data
  end

  def to_string
    "HTTP/1.0 200 OK\r\nContent-Type: text-html\r\n\r\n" + @file_data
  end
end
