json.extract! payment, :id, :amount, :invoice_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
