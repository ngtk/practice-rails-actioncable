class Document < ActiveRecord::Base
  belongs_to :created_user, class_name: 'User'
  belongs_to :last_modified_user, class_name: 'User'

  after_commit { DocumentRelayJob.perform_later(self) }
end
