module Api::V1
  class TotesController < ApiController
    before_filter :parse_request,
                  :parse_requestor,
                  :parse_documents,
                  :find_or_create_requestor,
                  :create_tote,
                  :only => :create

    def create
      head :created
    end

    def index
      @totes = Tote.all
      render :json => @totes
    end

    private
    def parse_request
      render_error("Missing 'tote' object.") unless @tote = params[:tote]
    end

    def parse_requestor
      errors = []
      unless @name = @tote[:name]
        errors << "Missing 'name' property in 'request' object."
      end
      unless @email = @tote[:email]
        errors << "Missing 'email' property in 'request' object."
      end
      unless @owner = @tote[:owner]
        errors << "Missing 'owner' property in 'request' object."
      end
      unless @owner_comments = @tote[:owner_comments]
        errors << "Missing 'owner_comments' property in 'request' object."
      end
      unless @customer_comments = @tote[:customer_comments]
        errors << "Missing 'customer_comments' property in 'request' object."
      end


      render_error(errors) unless errors.empty?
    end

    def parse_documents
      errors = []
      unless @documents = @tote[:documents]
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

    def create_tote
      tote = Tote.new(
        :owner => @owner,
        :owner_comments => @owner_comments,
        :customer_comments => @customer_comments)
      @documents.each do |doc_id|
        if doc = Document.find_by_id(doc_id)
          tote.documents << doc
        end
      end
      @requestor.totes << tote
      tote.save
    end

  end
end