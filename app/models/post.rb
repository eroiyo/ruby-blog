# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true

  validates :title, length: { maximum: 250, too_long: 'the title must not exceed 250 characters' }
  validates :comments_counter, :likes_counter, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :user, counter_cache: :posts_counter
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def recent_comments(limit = 5)
    comments.last limit
  end

  def update_counter(value)
    user.update posts_counter: value
  end

  def liked?(id)
    users.exists? id
  end

  def as_json(options = {})
    {:id => self.id, :title => self.title, :text => self.text, :commentsCounter => self.comments.size, :likesCounter => self.likes.size, :author => self.user.name, :created_at => self.created_at, :update_at => self.updated_at}
  end
end
