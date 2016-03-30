class Post < ActiveRecord::Base
  belongs_to :author
  validates :title, :body, :author_id, presence: true

  def self.find(id)
    all.detect { |post| post.id == id }
  end

  def self.sorted
    all.sort_by { |post| Date.today - post.created_at.to_i }
  end

end
