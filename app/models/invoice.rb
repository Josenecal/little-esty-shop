class Invoice < ApplicationRecord
  validates_presence_of :status
  validates_presence_of :customer_id

  belongs_to :customer
  has_many :merchants, through: :items
  has_many :transactions
  has_many :invoice_items

  enum status: {"in progress" => 0, "completed" => 1, "cancelled" => 2}

  def self.pending_invoices
    # joins(:invoice_items)
    # .where.not(status: 1)
    where(status: 0)
  end
end
