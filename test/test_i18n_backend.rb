require 'test_helper'

class Rafinesque::I18nBackendTest < Minitest::Test

  def test_has_default_interpolations
    setup!
    I18n.with_locale(:wk) do
      assert_equal I18n.t('something'), 'MyBrand is for specialists'
    end
  end

  def test_still_handles_interpolations
    setup!
    I18n.with_locale(:wk) do
      assert_equal I18n.t('something_with_placeholder', name: 'John'), 'Hello John, MyBrand is for the specialist you dream to be'
    end
  end

  private

  def semantics_json
    @semantics_json ||= {'wk' => {'brand' => 'MyBrand', 'experts' => 'specialists', 'the expert' => 'the specialist'}}
  end

  def setup!
    I18n.config.enforce_available_locales = false
    I18n.backend.default_semantics = semantics_json
    I18n.backend.store_translations(:wk, 'something' => 'MyBrand is for specialists', 'something_with_placeholder' => 'Hello %{name}, $brand$ is for $the expert$ you dream to be')
  end
end
