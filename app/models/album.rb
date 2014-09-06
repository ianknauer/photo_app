 class Album <  ActiveRecord::Base
  belongs_to :customer
  has_many :pictures

  before_save :generate_slug
  
  accepts_nested_attributes_for :pictures

  validates :name, presence: true

  def to_param
    self.slug
  end

  def generate_slug
    self.slug = self.name.gsub(' ', '-').downcase
  end

  def previews
    pictures.first(4)
  end
end