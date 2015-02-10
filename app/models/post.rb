class Post < ActiveRecord::Base
  belongs_to :user

  markdownize! :body

  validates :title, presence: true

  def author
    user
  end
end
