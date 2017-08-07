require 'fixer'
class Invoice < ActiveRecord::Base
	belongs_to :user

	def gbp_amount
		f = Fixer.new('GBP')
		amount.to_f * f.exchange_rates['GBP'].to_f
	end
end
