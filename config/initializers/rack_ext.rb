# Monkey patch rack in order to fix UTF-8 warnings.
# For more information regarding this issue please visit: http://github.com/rack/rack/issues#issue/41
module Rack

  module Utils

    def escape(s)
      s.to_s.gsub(/([^ a-zA-Z0-9_.-]+)/u) {
        '%'+$1.unpack('H2'*bytesize($1)).join('%').upcase
      }.tr(' ', '+')
    end

  end

end
