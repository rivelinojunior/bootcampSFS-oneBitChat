class Link < ActiveRecord::Base
  
  belongs_to :company
  validates :company, presence: { message: "Obrigatória" }
  validates :url, presence: { message: "Obrigatória" }
  validates :subject, presence: { message: "Obrigatório" }
end