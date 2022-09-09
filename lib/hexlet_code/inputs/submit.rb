# frozen_string_literal: true

module HexletCode
  module Inputs
    class Submit
      def self.build(_name, value, _attrs = {})
        Tag.build('input', type: 'submit', value:)
      end
    end
  end
end
