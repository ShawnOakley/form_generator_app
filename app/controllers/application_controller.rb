class ApplicationController < ActionController::Base
  include SessionsHelper
  include FormsHelper
  include StyleHelper
  protect_from_forgery
end
