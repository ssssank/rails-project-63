# frozen_string_literal: true

module HexletCode
  module Inputs
    class String
      def self.build(name, value, attrs = {})
        label = Tag.build('label', for: name) { name.capitalize }
        input = Tag.build('input', name:, type: 'text', value:, **attrs)
        [label, input].join
      end
    end
  end
end
