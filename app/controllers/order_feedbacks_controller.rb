class OrderFeedbacksController < ApplicationController
  before_action :set_order_feedback, only: %i[show edit update destroy]

  # GET /order_feedbacks
  # GET /order_feedbacks.json
  def index
    @order_feedbacks = current_user.order_feedbacks
  end

  # GET /order_feedbacks/1
  # GET /order_feedbacks/1.json
  def show;
  end

  # GET /order_feedbacks/new
  def new
    @order_feedback = OrderFeedback.new
  end

  # GET /order_feedbacks/1/edit
  def edit;
  end

  # POST /order_feedbacks
  # POST /order_feedbacks.json
  def create
    @order_feedback = current_user.feed_backs.build(order_feedback_params)

    respond_to do |format|
      if @order_feedback.save
        format.html {redirect_to @order_feedback, notice: 'Order feedback was successfully created.'}
        format.json {render :show, status: :created, location: @order_feedback}
      else
        format.html {render :new}
        format.json {render json: @order_feedback.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /order_feedbacks/1
  # PATCH/PUT /order_feedbacks/1.json
  def update
    respond_to do |format|
      if @order_feedback.update(order_feedback_params)
        format.html {redirect_to @order_feedback, notice: 'Order feedback was successfully updated.'}
        format.json {render :show, status: :ok, location: @order_feedback}
      else
        format.html {render :edit}
        format.json {render json: @order_feedback.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /order_feedbacks/1
  # DELETE /order_feedbacks/1.json
  def destroy
    @order_feedback.destroy
    respond_to do |format|
      format.html {redirect_to order_feedbacks_url, notice: 'Order feedback was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order_feedback
    @order_feedback = OrderFeedback.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_feedback_params
    params.fetch(:order_feedback, {})
  end
end
