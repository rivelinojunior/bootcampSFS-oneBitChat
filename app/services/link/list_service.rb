module LinkModule
  class ListService
  
    def initialize(params)
      @company = Company.last
      @query = params["query"]
    end

    def call
      links = []
      #search link else list all links
      unless @query.nil?
        links = Link.search(@query).where(company_id: @company.id)
      else
        links = @company.links
      end

      response = "*LINKS* \n\n"
      links.each do |l|
        response += "*#{l.id}* - *#{l.subject}*\n"
        response += ">#{l.url}\n"
        response += "\n\n"
      end
      (links.count > 0) ? response : "Nada encontrado"
    end
  end
end