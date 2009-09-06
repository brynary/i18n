# encoding: utf-8

require File.expand_path(File.dirname(__FILE__) + '/../../test_helper')

class I18nFastBackendLookupTest < Test::Unit::TestCase
  include Tests::Backend::Fast::Setup::Base

  # useful because this way we can use the backend with no key for interpolation/pluralization
  def test_lookup_given_nil_as_a_key_returns_nil
    assert_nil I18n.backend.send(:lookup, :en, nil)
  end

  def test_lookup_given_nested_keys_looks_up_a_nested_hash_value
    assert_equal 'bar', I18n.backend.send(:lookup, :en, :bar, [:foo])
  end

  def test_lookup_using_a_custom_separator
    assert_equal 'bar', I18n.backend.send(:lookup, :en, 'foo|bar', [], '|')
  end

  def test_default_using_a_custom_separator
    assert_equal 'bar', I18n.backend.send(:default, :en, :'does_not_exist', :'foo|bar', :separator => '|')
  end
end