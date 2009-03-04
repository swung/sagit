module Sagit
  class App < Sinatra::Default
    set :root, File.dirname(__FILE__) + "/../.."
    set :app_file, __FILE__
    enable :sessions

    include Sagit
    include Sagit::Helpers

    not_found do
      status 404
      show :not_found, :title => "Not found!"
    end

    error do
      @error = request.env['sinatra.error']
      status 500
      show :error, :title => "Error!"
    end

#   before do
#     login_required if session[:user]
#   end

    get "/" do
      show :start, :title => "Start"
    end

    get "/result" do
      @shiphomes = Shiphome.reverse_order(:start_at).limit(10)
      show :result, :title => "Result"
    end

    get "/new" do
      @shiphome = Shiphome.new
      show :new, :title => ["Shiphomes","new shiphome"]
    end
  end
end
