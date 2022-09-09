# frozen_string_literal: true

module HexletCode
  class FormRenderer
    def self.render(form)
      prepared_inputs = form.form_inputs.map do |form_input|
        type = form_input[:type].downcase.capitalize.to_s
        input = Object.const_get("HexletCode::Inputs::#{type}")
        input.build(form_input[:name], form_input[:value], **form_input[:attrs])
      end

      Tag.build('form', form.form_attrs) { [prepared_inputs].join if prepared_inputs.any? }
    end
  end
end
