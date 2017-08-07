require 'fixer'
class Invoice < ActiveRecord::Base
	belongs_to :user
	has_many :payments, dependent: :destroy

	validates :amount, :number,  presence: true
	validates :amount, numericality: true, unless: 'amount.blank?'
	validate :validate_amount

	def validate_amount
		errors.add(:amount, "can't be less than or equal to zero") if (amount.to_f <= 0.0)
	end

	def gbp_amount
		fixer = Fixer.new('GBP')
		amount.to_f * fixer.exchange_rates['GBP'].to_f
	end
end
