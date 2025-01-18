module Api
  module V1
    class DocumentsController < ApplicationController
      before_action :authenticate_user!
      before_action :set_document, only: [:show, :update, :destroy]
      before_action :authorize_document, only: [:update, :destroy]

      def index
        @documents = policy_scope(Document)
        render json: @documents
      end
 
      def show
        render json: @document
      end
 
      def create
        @document = current_user.documents.build(document_params)
        authorize @document
        if @document.save
          render json: @document, status: :created
        else
          render json: @document.errors, status: :unprocessable_entity
        end
      end
 
      def update
        if @document.update(document_params)
          render json: @document
        else
          render json: @document.errors, status: :unprocessable_entity
        end
      end
 
      def destroy
        @document.destroy
        head :no_content
      end
 
      private
 
      def set_document
        @document = Document.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Document not found' }, status: :not_found
      end
 
      def authorize_document
        authorize @document
      end
 
      def document_params
        params.require(:document).permit(:title, :content)
      end
    end
  end
end