class PatientSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :gender, :age, :role
end
