require './lib/http_request'
require './lib/http_response'
require './lib/http_404_response'

class HttpServer
  def request(input_stream, output_stream, file_handler)
    input_string = header(input_stream)

    http_request = HttpRequest.from_string(input_string)
    
    begin
      file_data = file_handler.read_file(http_request.uri)

      http_response = HttpResponse.new(file_data, http_request.verb)
    rescue FileNotFoundException
      http_response = Http404Response.new
    end

    output_stream.write(http_response.to_string)
  end

  def header(input_stream)
    input_string = ''

    begin
      current_line = input_stream.gets
      input_string += current_line
    end while current_line != "\r\n"

    input_string
  end
end
