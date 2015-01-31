class Api::BaseController < ActionController::Base
  def default_serializer_options
    { root: false }
  end
end