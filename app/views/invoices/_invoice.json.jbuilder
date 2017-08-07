json.extract! invoice, :id, :number, :amount, :to_address, :from_address, :note, :user_id, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
