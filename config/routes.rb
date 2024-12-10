Rails.application.routes.draw do
  mount Rswag::Ui::Engine => "/api-docs"
  mount Rswag::Api::Engine => "/api-docs"
  namespace :v1 do
    resources :questions
    resources :exams, param: :year
    resources :years
  end
end
