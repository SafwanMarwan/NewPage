require 'grape-swagger'
class API < Grape::API
  # default_format :json

  mount ::V1::Base

end