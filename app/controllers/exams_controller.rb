class ExamsController < ApplicationController
  before_action :set_exam, only: %i[ show update destroy ]

  # GET /exams
  def index
    @exams = Exam.all

    render json: @exams
  end

  # GET /exams/1
  def show
    render json: @exam
  end

  # POST /exams
  def create
    @exam = Exam.new(exam_params)

    if @exam.save
      render json: @exam, status: :created, location: @exam
    else
      render json: @exam.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /exams/1
  def update
    if @exam.update(exam_params)
      render json: @exam
    else
      render json: @exam.errors, status: :unprocessable_entity
    end
  end

  # DELETE /exams/1
  def destroy
    @exam.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def exam_params
      params.expect(exam: [ :title, :year, :disciplines, :languages ])
    end
end
