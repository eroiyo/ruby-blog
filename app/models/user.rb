# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes

  before_save :set_default

  def set_default
    self.posts_counter = 0 unless posts_counter
  end

  def recent_posts(limit = 3)
    posts.includes(:comments).order('created_at').last(limit)
  end

  def as_json(options = {})
    {:id => self.id, :name => self.name, :bio => self.bio, :photo => self.photo, :postsCounter => self.posts.size, :created_at => self.created_at, :update_at => self.updated_at}
  end
end
