class Payment < ActiveRecord::Base
	belongs_to :invoice

	validate :validate_amount
	validates :amount, presence: true
	validates :amount, numericality: true, unless: 'amount.blank?'

	def validate_amount
		errors.add(:amount, "can't be less than or equal to zero") if (amount.to_f <= 0.0)
		total_payment = Payment.where(invoice_id: invoice_id).group('invoice_id,id').select('invoice_id, sum(amount) as total').first
		errors.add(:base, "Payment amount should not exceed to it's invoice amount. Please check existing payments.") if (total_payment.try(:total).to_f + amount.to_f > invoice.amount.to_f)
	end
end
