class Profile < ApplicationRecord
  validates :name, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :birth, presence: true
  validates :gender, presence: true
  validate :validate_gender
  belongs_to :user
  enum role: [:member, :admin, :superadmin]
  after_create :set_role

  private

  def validate_gender
    unless self.gender == 'Male' || self.gender == 'Female'
      errors.add(:gender, "fue especificado incorrectamente")
    end
  end

  def set_role
    self.update(role: 0)
  end
end
