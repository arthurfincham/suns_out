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
    request["x-rapidapi-key"] = ENV["RAPID_API_KEY"]

    response = http.request(request)
    data = response.read_body
    @output = JSON.parse(data)
    @forecast = @output["forecast"]["forecastday"]
  end
end