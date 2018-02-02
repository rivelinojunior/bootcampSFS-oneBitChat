class Hashtag < ActiveRecord::Base
  validates_presence_of :name
  
  has_many :faq_hashtags, dependent: :destroy
  has_many :faqs, through: :faq_hashtags

  belongs_to :company
end