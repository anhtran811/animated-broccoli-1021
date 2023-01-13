Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/doctors/:id', to: 'doctors#show'
  delete '/doctors/:doctor_id/patients/:patient_id', to: 'doctor_patients#destroy'
end
