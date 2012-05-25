module Api::V1
  class RequestsController < ApiController
    before_filter :parse_request
    before_filter :parse_requestor
    before_filter :parse_documents
    before_filter :find_or_create_requestor

    def create
      head :created
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
      if @requestor = Requestor.find_by_email(@email)
        @requestor.name = @name
      else
        @requestor = Requestor.new(:name => @name, :email => @email)
      end

      unless @requestor.save
        render :json => @requestor.errors, :status => :unprocessable_entity
      end
    end

  end
end