class ProvidersController < ApplicationController
  def index
    providers = Provider.all
    render json: providers, :status => 200
  end
end
