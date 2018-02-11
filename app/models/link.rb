require "pg_search"
include PgSearch

class Link < ActiveRecord::Base
  
  belongs_to :company
  validates :company, presence: { message: "Obrigatória" }
  validates :url, presence: { message: "Obrigatória" }
  validates :subject, presence: { message: "Obrigatório" }

  pg_search_scope :search, :against => [:subject, :url]
end