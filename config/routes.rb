Rails.application.routes.draw do
  namespace :v1 do
    resources :questions
    resources :exams, param: :year
    resources :years
  end
end
