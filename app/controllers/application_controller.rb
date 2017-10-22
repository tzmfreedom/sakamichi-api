class ApplicationController < ActionController::API

  private

  def api_version
    request.headers['X-Api-Version'] || 'v1'
  end
end
