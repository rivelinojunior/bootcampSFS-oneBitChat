class Link < ActiveRecord::Base
  
  belongs_to :company
  validates :company, presence: true
  validates :url, presence: true
  validates :subject, presence: true
end