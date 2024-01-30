class Member < ApplicationRecord
    has_one_attached :avatar
    has_many :treated_patients, class_name: 'Opportunity', foreign_key: 'patient_id'
    has_many :consulting_doctors, class_name: 'Opportunity', foreign_key: 'doctor_id'
    enum gender: { male: 1, female: 2 }
    enum role: { doctor: 1, patient: 2 }
    scope :all_doctors, -> { where(role: 'doctor') }
    scope :all_patients, -> { where(role: 'patient') }
end
