class Post < ActiveRecord::Base
  belongs_to :admin
  has_many :comments

  validates :title, presence: true
  validates :body, presence: true

  default_scope -> { order(created_at: :desc) }
end
