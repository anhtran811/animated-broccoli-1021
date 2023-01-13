class DoctorPatientsController < ApplicationController
  def destroy
    doctor_patient = DoctorPatient.find_by(doctor_id: params[:doctor_id], patient_id: params[:patient_id])
    doctor_patient.delete
    redirect_to "/doctors/#{params[:doctor_id]}"
  end
end