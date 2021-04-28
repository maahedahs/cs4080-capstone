class HomeController < ApplicationController
  def index
  	require 'net/http'
  	require 'json'
  	@url = 'https://api.openweathermap.org/data/2.5/onecall?lat=34.05434193913132&lon=-117.74848495107845&exclude=minutely,hourly,alerts&units=imperial&appid=13f713d7a3c11fced5d5ebbe7d46b876'
  	@uri = URI(@url)
  	@response = Net::HTTP.get(@uri)
  	@output = JSON.parse(@response)

  	@currentTemp = @output.dig('current', 'temp') 
  	@feelsLikeTemp = @output.dig('current', 'feels_like')

  	@today = @output['daily'][0]
  	@lowTemp = @today.dig('temp', 'min')
  	@highTemp = @today.dig('temp', 'max')
  end
end
