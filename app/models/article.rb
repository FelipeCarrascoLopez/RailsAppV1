class Article < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  has_one_attached :avatar
  has_rich_text :body
  has_and_belongs_to_many :categories
  has_many :comments, dependent: :destroy
  belongs_to :user

  private

  def self.add_categories(article, ids)
    ids.each { |id| article.categories << Category.find(id) }
  end

  def self.update_categories(article, ids)
    article.categories.delete_all unless article.categories.empty?
    ids.each { |id| article.categories << Category.find(id) }
  end
end
