require 'digest'
require 'cgi'
require 'eat'
require 'active_support/core_ext/hash'

class Dangdang
  def self.version
    '0.0.1'
  end
  def initialize(option = {})
    @option = option
    @api_uri_front = "http://api.open.dangdang.com/openapi/rest?"
  end
  def sys_params
    { :app_key => @option[:app_key],
      :format => "xml",
      :method => @method,
      :session => @option[:session_key],
      :sign_method => "md5",
      :timestamp => Time.now.strftime("%Y-%m-%d %T"),
      :v => "1.0" }
  end

  def sys_params_to_string
    sys_params.to_a.flatten.join("")
  end
  def secret_string
    @option[:app_secret] + sys_params_to_string + @option[:app_secret]
  end
  def sign_key
    Digest::MD5.hexdigest(secret_string).upcase
  end


  def dangdang_orders_list_get(params_app = {})
    @method = __callee__.to_s.split("_").join(".")
    params_app[:osd] = CGI.escape(params_app[:osd]) if params_app[:osd]
    params_app[:oed] = CGI.escape(params_app[:oed]) if params_app[:oed]
    @params_app = params_app
    Hash.from_xml(eat(get_api_uri))
  end
  def dangdang_order_details_get(params_app = {})
    @method = __callee__.to_s.split("_").join(".")
    @params_app = params_app
    Hash.from_xml(eat(get_api_uri))
  end

  def get_api_uri
    @api_uri_front + "sign=#{sign_key}&" + url_params
  end
  def url_params
    params = sys_params
    params.merge!(@params_app)
    params[:timestamp] = CGI.escape(params[:timestamp])
    params.to_a.map { |p| p.join("=")}.join("&")
  end

end


