# frozen_string_literal: true

require 'test_helper'

class Translatable::Test < ActiveSupport::TestCase
  test 'truth' do
    assert_kind_of Module, Translatable
  end

  test 'accessor should return the translated field' do
    c = Content.new header: 'hi', body: { en: 'hello', ca: 'hola' }

    I18n.locale = :ca
    assert_equal c.body, 'hola'
    I18n.locale = :en
    assert_equal c.body, 'hello'
    I18n.locale = :ca
  end

  test 'accessor find by the translated field' do
    Content.create header: 'hi',
                   body: { en: 'hello', ca: 'hola' },
                   footer: { en: 'bye', ca: 'adeu' }

    c = Content.where(body: 'hola').first
    assert_equal c.body, 'hola'

    I18n.locale = :en

    c = Content.where(body: 'hello').first
    assert_equal c.body, 'hello'
  end
end
