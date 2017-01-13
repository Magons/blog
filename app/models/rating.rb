class Rating < ApplicationRecord
  AVALIABLE_VOTE_VALUES = [1, 2, 3, 4, 5]
  belongs_to :post

  validates :value, inclusion: { in: AVALIABLE_VOTE_VALUES }
end
