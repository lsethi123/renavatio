module Patients
  class Patient < GRAPE::API

    resource :patient do
      desc "returns patient for a given patient id"
      get "/:id" do
        patient = Patient.find(params[:id])
        present user
      end
    end

  end
end