class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates_presence_of :title, :body

  def self.search(search)
    where("title LIKE ? OR body LIKE ?", "%#{search}%", "%#{search}%")
  end
end
