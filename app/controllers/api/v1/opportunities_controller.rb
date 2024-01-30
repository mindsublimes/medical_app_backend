class Api::V1::OpportunitiesController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def index
    opportunities = Opportunity.includes(:doctor, :patient).all
    doctors = Member.all_doctors
    patients = Member.all_patients
  
    render json: {
      opportunities: opportunities.as_json(include: [:doctor, :patient]),
      doctors: doctors.as_json,
      patients: patients.as_json
    }
  end

  def create
    opportunity = Opportunity.new(opportunity_params.merge(stage_history: [{ stage_name: "Lead", timestamp: Time.now }]))
    if opportunity.save
      render json: opportunity, status: :created
    else
      render json: opportunity.errors, status: :unprocessable_entity
    end
  end


  def update
    opportunity = Opportunity.find(params[:id])
    if opportunity.update(opportunity_params)
      render json: opportunity
    else
      render json: opportunity.errors, status: :unprocessable_entity
    end
  end


  def stage_history
    opportunity = Opportunity.find(params[:id])
    if opportunity.update(stage_history_params)
      render json: opportunity
    else
      render json: opportunity.errors, status: :unprocessable_entity
    end
  end
  
  private
  
  def opportunity_params
    params.require(:opportunity).permit(:procedure_name, :patient_id, :doctor_id)
  end

  def stage_history_params
    params.require(:opportunity).permit(stage_history: [:stage_name, :timestamp])
  end
end
