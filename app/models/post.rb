class Post < ActiveRecord::Base
  belongs_to :user

  default_scope -> { order(created_at: :desc) }
  markdownize! :body

  validates :title, presence: true

  def author
    user
  end
end
