# frozen_string_literal: true

module HexletCode
  module Inputs
    class Text
      def self.build(name, value, attrs = {})
        label = Tag.build('label', for: name) { name.capitalize }
        input = Tag.build('textarea', name:, cols: attrs[:cols] || '20', rows: attrs[:rows] || '40', **attrs) { value }
        [label, input].join
      end
    end
  end
end
