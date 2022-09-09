# frozen_string_literal: true

require_relative 'hexlet_code/version'
module HexletCode
  autoload(:FormGenerator, 'hexlet_code/form_generator')
  autoload(:FormRenderer, 'hexlet_code/form_renderer')
  autoload(:Tag, 'hexlet_code/tag.rb')
  autoload(:Inputs, 'hexlet_code/inputs.rb')

  def self.form_for(model, attrs = {})
    form = FormGenerator.new(model, attrs)
    yield form if block_given?
    FormRenderer.render(form)
  end
end
