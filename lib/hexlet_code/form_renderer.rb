# frozen_string_literal: true

module HexletCode
  class FormRenderer
    def self.render(form)
      prepared_inputs = form.form_inputs.map do |form_input|
        render_input form_input
      end

      submit = (render_input form.form_submit if form.form_submit.any?)

      Tag.build('form', form.form_attrs) { [prepared_inputs, submit].join if prepared_inputs.any? }
    end

    def self.render_input(form_input)
      type = form_input[:type].downcase.capitalize.to_s
      input = Object.const_get("HexletCode::Inputs::#{type}")
      input.build(form_input[:name], form_input[:value], **form_input[:attrs])
    end
  end
end
