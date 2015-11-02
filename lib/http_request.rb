class HttpRequest
  attr_reader :verb
  attr_reader :uri

  def initialize(verb, uri)
    @verb = verb
    @uri = uri
  end

  def self.from_string(input_string)
    first_line = input_string.split("\r\n")[0]
    verb, uri, http_version = first_line.split(' ')
    new(verb, uri)
  end
end
