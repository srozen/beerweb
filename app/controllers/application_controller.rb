class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  require 'csv'
end
