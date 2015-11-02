class HttpResponse
  def initialize(file_data, verb)
    @file_data = file_data
    @verb = verb
  end

  def to_string
    if @verb == 'GET'
      "HTTP/1.0 200 OK\r\nContent-Type: text-html\r\nContent-Length: #{@file_data.length}\r\n\r\n" + @file_data
    elsif @verb == 'HEAD'
      "HTTP/1.0 200 OK\r\nContent-Type: text-html\r\nContent-Length: #{@file_data.length}\r\n\r\n"
    end
  end
end
