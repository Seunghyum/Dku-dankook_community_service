class TinymceAssetsController < ApplicationController
  def create
    # Take upload from params[:file] and store it somehow...
    # Optionally also accept params[:hint] and consume if needed
    # uploader = EditorUploader.new
    # uploader.store!(params[:file])
    # uploader.retrieve_from_store!(params[:file].original_filename)
    
    render json: {
      image: {
        url: view_context.image_url("aaaaa/" + params[:file].original_filename)
      }
    }, content_type: "text/html"
  end
end
