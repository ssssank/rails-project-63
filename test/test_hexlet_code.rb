# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_empty_form_with_default_params_is_generated
    user = User.new name: 'rob'
    form = HexletCode.form_for user
    assert { form == '<form action="#" method="post"></form>' }
  end

  def test_empty_form_is_generated
    user = User.new name: 'rob'
    form = HexletCode.form_for user, url: '/users', method: 'get'
    assert { form == '<form action="/users" method="get"></form>' }
  end

  def test_form_is_generated
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'
    form = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
    end
    assert { form == get_fixture('/fixtures/base_form.html') }
  end

  def test_form_with_attributes_is_generated
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'
    form = HexletCode.form_for user, url: '#' do |f|
      f.input :name, class: 'user-input'
      f.input :job
    end
    assert { form == get_fixture('/fixtures/form_with_attributes.html') }
  end

  def test_form_with_redefine_is_generated
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'
    form = HexletCode.form_for user, url: '#' do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end
    assert { form == get_fixture('/fixtures/form_with_redefine.html') }
  end

  def test_form_with_error_is_generated
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'
    assert_raises NoMethodError do
      HexletCode.form_for user, url: '/users' do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age
      end
    end
  end
end
