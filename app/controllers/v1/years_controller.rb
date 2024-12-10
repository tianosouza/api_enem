class V1::YearsController < ApplicationController
  before_action :set_year, only: %i[ show update destroy ]

  def index
    @years = Year.all

    render json: @years
  end

  def show
    render json: @year
  end

  def create
    @year = Year.new(year_params)

    if @year.save
      render json: @year, status: :created, location: @year
    else
      render json: @year.errors, status: :unprocessable_entity
    end
  end

  def update
    if @year.update(year_params)
      render json: @year
    else
      render json: @year.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @year.destroy!
  end

  private

    def set_year
      @year = Year.find(params.expect(:id))
    end


    def year_params
      params.expect(year: [ :title, :year, :diciplinas, :languagens, :questions ])
    end
end
