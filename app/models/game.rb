class Game < ApplicationRecord
  validates :player_1, :player_2, :status, presence: true
  enum status: { running: 0, finished: 1 }
end