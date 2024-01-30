class OpportunitySerializer < ActiveModel::Serializer
  attributes :id, :procedure_name, :stage_history, :created_at, :updated_at

  belongs_to :doctor
  belongs_to :patient
end
