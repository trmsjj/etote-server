module Api::V1
  class RequestsController < ApiController
    before_filter :parse_request,
                  :parse_requestor,
                  :parse_documents,
                  :find_or_create_requestor,
                  :find_or_create_doc_requests,
                  :only => :create

    def create
      head :created
    end

    def index
      @requestors = Requestor.all
      render :json => @requestors
    end

    private
    def parse_request
      render_error("Missing 'request' object.") unless @request = params[:request]
    end

    def parse_requestor
      errors = []
      unless @name = @request[:name]
        errors << "Missing 'name' property in 'request' object."
      end
      unless @email = @request[:email]
        errors << "Missing 'email' property in 'request' object."
      end

      render_error(errors) unless errors.empty?
    end

    def parse_documents
      errors = []
      unless @documents = @request[:documents]
        errors << "Missing 'documents' array in 'request' object."
      end
      if @documents && !@documents.kind_of?(Array)
        errors << "The 'documents' property is not an array."
      end

      render_error(errors) unless errors.empty?
    end

    def render_error(*errors)
      render :json => { :errors => errors }, :status => :bad_request
    end

    def find_or_create_requestor
      @requestor = Requestor.where(:email => @email).first_or_initialize
      @requestor.name = @name

      unless @requestor.save
        render :json => @requestor.errors, :status => :unprocessable_entity
      end
    end

    def find_or_create_doc_requests
      @documents.each do |doc|
        DocumentRequest.where({
          :file_name => doc.to_s,
          :requestor_id => @requestor.id
        }).first_or_create
      end
    end

  end
end