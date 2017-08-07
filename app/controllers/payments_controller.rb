class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  def index
    if params[:invoice_id].blank?
      @payments = Payment.all
    else
      @payments = Payment.where(invoice_id: params[:invoice_id])
    end
  end

  def show
  end

  def new
    @invoice = Invoice.find_by(id: params[:invoice_id])
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)

    respond_to do |format|
      if @payment.save
        format.html { redirect_to invoices_path, notice: 'Payment was successfully created.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:amount, :invoice_id)
    end
end
