# frozen_string_literal: true

module HexletCode
  class FormGenerator
    def initialize(model, attrs)
      @model = model
      @form_attrs = {
        action: attrs[:url] || '#',
        method: attrs[:method] || 'post'
      }
      @form_inputs = []
      @form_submit = []
    end

    attr_reader :form_attrs, :form_inputs, :form_submit

    def input(field, **args)
      @form_inputs << {
        value: @model.public_send(field),
        name: field,
        type: args.fetch(:as, 'string'),
        attrs: args.except(:as)
      }
    end

    def submit(text = 'Save')
      @form_inputs << {
        value: text,
        name: '',
        type: 'submit',
        attrs: {}
      }
    end
  end
end
