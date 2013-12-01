require 'patient.rb'

module API
  class API < Grape::API
    version 'v1', using: :header, vendor: 'renavatio'
    format :json

    mount Patients::Patient
  end
end