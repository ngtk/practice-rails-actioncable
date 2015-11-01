class DocumentRelayJob < ApplicationJob
  def perform(document)
    ActionCable.server.broadcast "documents:#{document.id}",
      content: document.content,
      modified_user_id: document.last_modified_user_id
  end
end
