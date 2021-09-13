class HomeController < ApplicationController
  def index
    require 'uri'
    require 'net/http'
    require 'openssl'
    require 'date'
    url = URI("https://weatherapi-com.p.rapidapi.com/forecast.json?q=London&days=3")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'weatherapi-com.p.rapidapi.com'
    request["x-rapidapi-key"] = 'e020022066msh9c203a2c76a6131p182294jsn2446e1c73111'

    response = http.request(request)
    data = response.read_body
    @output = JSON.parse(data)
  end
end