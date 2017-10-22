class ApidocsController < ActionController::Base
  include Swagger::Blocks

  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, '1.0.0'
      key :title, 'Sakamichi API'
      key :description, 'Sakamichi Group(Nogizaka46, Keyakizaka46, Hiragana-Keyakizaka46) API'
      contact do
        key :name, 'tzmfreedom'
      end
      license do
        key :name, 'MIT'
      end
    end
    key :host, 'sakamichi.freedom-man.com'
    key :basePath, '/api'
    key :consumes, ['application/json']
    key :produces, ['application/json']
  end

  # A list of all classes that have swagger_* declarations.
  SWAGGERED_CLASSES = [
      ::Api::Nogizaka::MembersController,
      ::Api::Keyakizaka::MembersController,
      ::Api::HiraganaKeyaki::MembersController,
      self,
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end