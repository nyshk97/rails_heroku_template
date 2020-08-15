class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: 'ID', password: 'password'
end
