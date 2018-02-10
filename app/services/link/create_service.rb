module LinkModule
  class CreateService
    
    def initialize(params)
      @company = Company.last
      @url = params["url-original"]
      @subject = params["subject-original"]
    end

    def call
      begin
        Link.create! subject: @subject, url: @url, company: @company
        "Criado com sucesso"
      rescue => error
        message = error.message.split(":").last.strip if error.message
        message ||= "Problemas na criação"
      end
    end
  end
end