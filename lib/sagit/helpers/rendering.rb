module Sagit
  module Helpers
    module Rendering
      def show(view, options={})
        @title = options[:title].join(" - ")
        haml view
      end
    end
  end
end
