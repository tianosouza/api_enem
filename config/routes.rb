Rails.application.routes.draw do
  namespace :v1 do
    resources :questions
    resources :exams
    resources :years
  end
end
