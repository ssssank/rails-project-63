# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  class Tag
    def self.build(tag, args = {})
      attr_string = args.map { |(k, v)| " #{k}=\"#{v}\"" }.join
      if block_given?
        "<#{tag}#{attr_string}>#{yield}</#{tag}>"
      else
        "<#{tag}#{attr_string}>"
      end
    end
  end

  def self.form_for(model, attrs = {})
    @model = model
    @data = ''
    yield HexletCode if block_given?
    Tag.build('form', action: attrs[:url] || '#', method: attrs[:method] || 'post') { @data }
  end

  def self.input(field, **args)
    args[:name] = field
    if args[:as] == :text
      args.delete(:as)
      @data += Tag.build('textarea', name: field, cols: args[:cols] || '20', rows: args[:rows] || '40', **args) do
        @model.public_send field
      end
    else
      @data += Tag.build('input', **args, type: 'text', value: @model.public_send(field))
    end
  end
end
