require 'test_helper'

class Rafinesque::SetupTest < Minitest::Test
  def test_rafinesque_backend_is_automatically_included
    assert I18n.backend.respond_to? :default_semantics
  end
end
