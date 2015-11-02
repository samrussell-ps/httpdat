class Http404Response
  def initialize
  end

  def to_string
    "HTTP/1.0 404 Not Found\r\n\r\n"
  end
end
