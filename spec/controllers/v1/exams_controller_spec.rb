require 'rails_helper'

RSpec.describe V1::ExamsController, type: :controller do
  describe "GET #index" do
    before do
      @exam1 = Exam.create!(title: 'ENEM 2023', year: 2023)
      @exam2 = Exam.create!(title: 'ENEM 2022', year: 2022)
    end

    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end

    it "returns all exams" do
      get :index
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe "GET #show" do
    before do
      @exam = Exam.create!(title: 'ENEM 2023', year: 2023)
    end

    it "returns a success response" do
      get :show, params: { year: @exam.year }
      expect(response).to be_successful
    end

    it "returns the correct exam" do
      get :show, params: { year: @exam.year }
      json_response = JSON.parse(response.body)
      expect(json_response['year']).to eq(@exam.year.to_s)
    end

    it "returns a not found response for invalid year" do
      get :show, params: { year: 9999 }
      expect(response).to have_http_status(:not_found)
    end
  end
end
