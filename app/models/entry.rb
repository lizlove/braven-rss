class Entry < ApplicationRecord
  belongs_to :channel
  validates :title, presence: true, uniqueness: { scope: :channel_id }
  validates :content, presence: true
end
