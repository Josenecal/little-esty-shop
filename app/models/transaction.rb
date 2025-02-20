class Transaction < ApplicationRecord
  validates_presence_of :credit_card_number
  validates_presence_of :result
  validates_presence_of :invoice_id

  belongs_to :invoice
  has_many :customers, through: :invoices
  has_many :items, through: :invoices
end
