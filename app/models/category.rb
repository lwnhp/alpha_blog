class Category < ActiveRecord::Base
    
  has_many :article_categories
  has_many :articles, through: :article_categories
    
  validates :name, presence: true
  validates :name, uniqueness: true # wat ook kan: validates_uniqueness_of :name #
  validates :name, :length => { :in => 3..25 }
    
end