# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Tag
    def self.build(tag, **kwargs)
      attr_string = kwargs.map { |(k, v)| " #{k}=\"#{v}\"" }.join
      if block_given?
        "<#{tag}#{attr_string}>#{yield}</#{tag}>"
      else
        "<#{tag}#{attr_string}>"
      end
    end
  end
end
