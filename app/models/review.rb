class Review < ActiveRecord::Base
  belongs_to :collection

  validates :note, presence: true,
                   numericality: true,
                   inclusion: { in: 0.0..10.0 }

  validates :comment, presence: true,
                      length: { maximum: 400 }
end
