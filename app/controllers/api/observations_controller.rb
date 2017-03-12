module Api
  class ObservationsController < BaseController
    def index
      render json: Observation.all
    end
  end
end
