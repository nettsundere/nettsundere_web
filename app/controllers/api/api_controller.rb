module Api
  class ApiController < ApplicationController
    respond_to :json
    include Localization::Controller
  end
end
