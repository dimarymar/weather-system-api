module API
  class WeatherService < ApplicationService
    API_URL = 'http://api.openweathermap.org/data/2.5/weather'.freeze

    def executing
      get_current_weather && save_weather
    end

    private

    attr_reader :response

    def get_current_weather
      @response = Faraday.get do |request|
        request.url API_URL
        request.params['id'] = ENV['API_KIEV_CITY_ID']
        request.params['appid'] = ENV['APPID']
        request.params['units'] = ENV['API_UNITS']
      end
      response.success?
    end

    def save_weather
      observation = Observation.create(observation_params)
      observation.persisted?
    end

    def observation_params
      {
        temperature: data[:temp],
        pressure: data[:pressure],
        humidity: data[:humidity]
      }
    end

    def data
      @data ||= Oj.load(response.body)[:main]
    end
  end
end
