require './lib/http_request'
require './lib/http_response'

class HttpServer
  def request(input_stream, output_stream, file_handler)
    input_string = ''
    current_line = ''
    begin
      current_line = input_stream.gets
      input_string += current_line
    end while current_line != "\r\n"

    http_request = HttpRequest.from_string(input_string)

    file_data = file_handler.read_file(http_request.uri)

    http_response = HttpResponse.new(file_data)

    output_stream.write(http_response.to_string)
  end
end
