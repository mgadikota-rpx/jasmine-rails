module JasmineRails
  class FixturesController < JasmineRails::ApplicationController
    helper JasmineRails::SpecHelper rescue nil
    def show
      file_name = params[:id]
      file_paths = []
      JasmineRails.spec_dir.each do |spec_dir|
        file_path = spec_dir+"fixtures/#{file_name}.html"
        file_paths << file_path if File.exists?(file_path)
      end
      raise ActionController::RoutingError.new('Not Found') if file_paths.blank?
      respond_to do |format|
        format.html {
          render plain: File.read(file_paths.first)
        }
      end
    end
  end
end
