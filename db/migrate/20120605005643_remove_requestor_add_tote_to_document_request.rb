class RemoveRequestorAddToteToDocumentRequest < ActiveRecord::Migration
	def change
		change_table :document_requests do |t|
			t.remove :requestor_id
			t.belongs_to :tote
		end
	end
end
