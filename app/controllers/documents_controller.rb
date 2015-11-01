class DocumentsController < ApplicationController
  before_action :load_document, only: [:edit, :update]

  def index
    @documents = Document.all
  end

  def edit
  end

  def update
    @document.last_modified_user = @current_user
    @document.update!(document_params)
    head :ok
  end

private

  def document_params
    params.require(:document).permit(:content)
  end

  def load_document
    @document = Document.find(params[:id])
  end
end
