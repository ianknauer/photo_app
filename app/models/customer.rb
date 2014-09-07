class Customer < ActiveRecord::Base
  belongs_to :user
  has_many :albums

  before_save :generate_slug

  validates :name, presence: true, uniqueness: true
  validates :phone, presence: true
  validates :email, presence: true, uniqueness: true

  def generate_slug
    self.slug = self.name.gsub(' ', '-').downcase
  end

  def to_param
    self.slug
  end

  def orders 
    self.albums.count
  end

  def profile_image
    if self.albums.present?
      if self.albums.first.pictures.first.small_thumb.present?
        self.albums.first.pictures.first.small_thumb
      else
        "http://ianknauer.net/No-image-provided.gif"
      end
    else
      "http://ianknauer.net/No-image-provided.gif"
    end
  end

  def self.search_by_email(search_term)
    return [] if search_term.blank?
    where("email LIKE ?", "%#{search_term}%").order("updated_at DESC")
  end

end