class Item < ApplicationRecord

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :unit_price
  validates_presence_of :merchant_id

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices

  enum status: { disabled: 0, enabled: 1 }

  def best_sales_date
    best_date = invoice_items
     .joins(invoice: :transactions)
     .where("transactions.result = 'success'")
     .select("invoice_items.quantity, invoices.created_at")
     .group("date_trunc('day', invoices.created_at)")
     .order(sum_quantity: :desc, date_trunc_day_invoices_created_at: :desc)
     .limit(1)
     .sum(:quantity)
     .keys
     .first
     .strftime("%Y.%m.%d")
  end

end
