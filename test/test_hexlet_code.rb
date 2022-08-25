# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)

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
end
