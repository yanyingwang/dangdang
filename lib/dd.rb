require 'faraday'
require 'digest'
require 'pry'
require 'cgi'

class Dangdang
  def initialize(option = {})
    @option = option
    @api_uri_front = "http://api.open.dangdang.com/openapi/rest?"
  end
  def sys_params
    { "app_key" => @option["app_key"],
      "format" => "xml",
      "method" => @option["method"],
      "session" => @option["session_key"],
      "sign_method" => "md5",
      "timestamp" => Time.now.strftime("%Y-%m-%d %T"),
      "v" => "1.0" }
  end

  def sys_params_to_string
    sys_params.to_a.flatten.join("")
  end
  def secret_string
    @option["app_secret"] + sys_params_to_string + @option["app_secret"]
  end
  def sign_key
    Digest::MD5.hexdigest(secret_string).upcase
  end

  def url_params
    params = sys_params
    params["timestamp"] = CGI.escape(params["timestamp"])
    params.store('osd', CGI.escape("2014-11-25 00:00:00"))
    params.store('oed', CGI.escape("2014-11-26 00:00:00"))
    params.to_a.map { |p| p.join("=")}.join("&")
  end

  def get_api_uri
    @api_uri_front + "sign=#{sign_key}&" + url_params
  end

end


