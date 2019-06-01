class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  validates :content, presence: true, allow_blank: false

  after_create :as_json

  def as_json(options={})
    {
      id: id,
      author: user.username,
      content: content,
      created_at: created_at,
      channel: channel.name
    }
  end
end
