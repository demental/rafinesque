require "i18n"
require "rafinesque/i18n_backend"

module Rafinesque

  def self.setup
    I18n.backend.class.include I18nBackend
  end

end
