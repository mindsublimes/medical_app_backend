module Api
    module V1
      class SearchController < ApplicationController
        def search
          query = params[:query]
          opportunities = Opportunity.joins("LEFT JOIN members as patients ON opportunities.patient_id = patients.id")
                           .joins("LEFT JOIN members as doctors ON opportunities.doctor_id = doctors.id")
                           .where("procedure_name LIKE :query OR 
                                   patients.first_name LIKE :query OR 
                                   patients.last_name LIKE :query OR 
                                   doctors.first_name LIKE :query OR 
                                   doctors.last_name LIKE :query", query: "%#{query}%")
          doctors = Member.all_doctors.where("first_name LIKE :query OR last_name LIKE :query", query: "%#{query}%")
          patients = Member.all_patients.where("first_name LIKE :query OR last_name LIKE :query", query: "%#{query}%")
  
          render json: {
            opportunities: opportunities.as_json(include: [:doctor, :patient]),
            doctors: doctors.as_json,
            patients: patients.as_json
          }
        end
      end
    end
end
  