class CallMe < ApplicationRecord
    validates :phone, presence: { message: 'Valid numbers only' },
                      numericality: true,
                      length: { minimum: 10, maximum: 15 }
  end