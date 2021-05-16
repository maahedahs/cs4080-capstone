class HomeController < ApplicationController
  def index
  	require 'net/http'
  	require 'json'

    # latitude and longitude for Pomona
    @latitude = "34.05434193913132"
    @longitude = "-117.74848495107845"

  	@url = "https://api.openweathermap.org/data/2.5/onecall?lat=#{@latitude}&lon=#{@longitude}&exclude=minutely,alerts&units=imperial&appid=13f713d7a3c11fced5d5ebbe7d46b876"
  	@uri = URI(@url)
  	@response = Net::HTTP.get(@uri)
  	@output = JSON.parse(@response)

  	@today = @output['daily'][0]

    # Current weather data for today
    @currentTemp = @output.dig('current', 'temp') 
    @feelsLikeTemp = @output.dig('current', 'feels_like')
    @currentTime = @today['dt']
    @sunrise = @today['sunrise']
    @sunset = @today['sunset']
    @pressure = @today['pressure']
    @humidity = @today['humidity']
    @dewPoint = @today['dew_point']
    @uvIndex = @today['uvi']
    @clouds = @today['clouds']
    @visibility = @today['visibility']
    @windSpeed = @today['wind_speed']
    @windDirection = @today['wind_deg']
    @chanceOfPrecipitation = @today['pop']

    # Temperatures for today
  	@lowTemp = @today.dig('temp', 'min')
  	@highTemp = @today.dig('temp', 'max')
    @dayTemp = @today.dig('temp', 'day')
    @nightTemp = @today.dig('temp', 'night')
    @eveningTemp = @today.dig('temp', 'eve')
    @morningTemp = @today.dig('temp', 'morn')

    # Feels-like temperatures for today
    @feelsLikeDay = @today.dig('feels_like', 'day')
    @feelsLikeNight = @today.dig('feels_like', 'night')
    @feelsLikeEvening = @today.dig('feels_like', 'evening')
    @feelsLikeMorning = @today.dig('feels_like', 'morning')

    # Arrays with daily weather forecast info starting from index 1 to 7
    @dailyLowTemp = Array.new(8)
    for i in 1..7
      @dailyLowTemp[i] = @output['daily'][i].dig('temp','min')
    end
    
    @dailyHighTemp = Array.new(8)
    for i in 1..7
      @dailyHighTemp[i] = @output['daily'][i].dig('temp','max')
    end

    @dailyDayTemp = Array.new(8)
    for i in 1..7
      @dailyDayTemp[i] = @output['daily'][i].dig('temp','day')
    end

    @dailyNightTemp = Array.new(8)
    for i in 1..7
      @dailyNightTemp[i] = @output['daily'][i].dig('temp','night')
    end

    @dailyEveningTemp = Array.new(8)
    for i in 1..7
      @dailyEveningTemp[i] = @output['daily'][i].dig('temp','eve')
    end

    @dailyMorningTemp = Array.new(8)
    for i in 1..7
      @dailyMorningTemp[i] = @output['daily'][i].dig('temp','morn')
    end

    @feelsLikeDailyDay = Array.new(8)
    for i in 1..7
      @feelsLikeDailyDay[i] = @output['daily'][i].dig('feels_like','day')
    end

    @feelsLikeDailyEvening = Array.new(8)
    for i in 1..7
      @feelsLikeDailyEvening[i] = @output['daily'][i].dig('feels_like','eve')
    end

    @feelsLikeDailyNight = Array.new(8)
    for i in 1..7
      @feelsLikeDailyNight[i] = @output['daily'][i].dig('feels_like','night')
    end

    @feelsLikeDailyMorning = Array.new(8)
    for i in 1..7
      @feelsLikeDailyMorning[i] = @output['daily'][i].dig('feels_like','morning')
    end

    @dailyWeatherType = Array.new(8)
    for i in 1..7
      @tempArray = @output['daily']
      @dailyWeatherType[i] = @output['daily'][i]['weather'][0]['main']
    end

    @dailyWeatherDescription = Array.new(8)
    for i in 1..7
      @dailyWeatherDescription[i] = @output['daily'][i]['weather'][0]['description']
    end

    @dailySunrise = Array.new(8)
    for i in 1..7
      @dailySunrise[i] = @output['daily'][i]['sunrise']
    end

    @dailySunset = Array.new(8)
    for i in 1..7
      @dailySunset[i] = @output['daily'][i]['sunset']
    end

    @dailyPressure = Array.new(8)
    for i in 1..7
      @dailyPressure[i] = @output['daily'][i]['pressure']
    end

    @dailyHumidity = Array.new(8)
    for i in 1..7
      @dailyHumidity[i] = @output['daily'][i]['humidity']
    end

    @dailyDewPoint = Array.new(8)
    for i in 1..7
      @dailyDewPoint[i] = @output['daily'][i]['dew_point']
    end

    @dailyWindSpeed = Array.new(8)
    for i in 1..7
      @dailyWindSpeed[i] = @output['daily'][i]['wind_speed']
    end

    @dailyWindDirection = Array.new(8)
    for i in 1..7
      @dailyWindDirection[i] = @output['daily'][i]['wind_deg']
    end

    @dailyClouds = Array.new(8)
    for i in 1..7
      @dailyClouds[i] = @output['daily'][i]['clouds']
    end

    @dailyChanceOfPrecipitation = Array.new(8)
    for i in 1..7
      @dailyChanceOfPrecipitation[i] = @output['daily'][i]['pop']
    end

    @dailyUVIndex = Array.new(8)
    for i in 1..7
      @dailyUVIndex[i] = @output['daily'][i]['uvi']
    end

    #Arrays with hourly forecast weather info starting from index 1 to 24
    @hourly = @output['hourly']

    @hourlyTime = Array.new(25)
    for i in 1..24
      @hourlyTime[i] = @hourly[i]['dt']
    end

    @hourlyTemp = Array.new(25)
    for i in 1..24
      @hourlyTemp[i] = @hourly[i]['temp']
    end

    @hourlyFeelsLikeTemp = Array.new(25)
    for i in 1..24
      @hourlyFeelsLikeTemp[i] = @hourly[i]['dt']
    end

    @hourlyChanceOfPrecipitation = Array.new(25)
    for i in 1..24
      @hourlyChanceOfPrecipitation[i] = @hourly[i]['pop']
    end

    @hourlyWeatherType = Array.new(25)
    for i in 1..24
      @hourlyWeatherType[i] = @hourly[i]['weather'][0]['main']
    end

    @hourlyWeatherDescription = Array.new(25)
    for i in 1..24
      @hourlyWeatherDescription[i] = @hourly[i]['weather'][0]['description']
    end

  end
end
