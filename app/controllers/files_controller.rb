
class FilesController < ApplicationController
    # before_action :authenticate!
    BUCKET_NAME = "test-bucket-123"
    TIME_TO_ACCESS = 30.seconds
  
    def new
      upload_url = client.put_object_url(
        BUCKET_NAME,
        params.fetch(:filename),
        TIME_TO_ACCESS.from_now.to_i
      )
  
      render json: {
        upload_url: upload_url
      }
    end
  
    def show
      download_url = client.get_object_url(
        BUCKET_NAME,
        params.fetch(:filename),
        TIME_TO_ACCESS.from_now.to_i
      )
  
      render json: {
        download_url: download_url
      }
    end
  
    private
  
    def client
    #   @client ||= Fog::Storage::AWS.new(provider: 'AWS', region: 'us-west-1')
      @client ||= Fog::AWS::Storage.new(provider: 'AWS', region: 'us-west-1', aws_access_key_id: ENV["ACCESS_KEY_ID"], aws_secret_access_key: ENV["SECRET_ACCESS_KEY"])

    end
  end