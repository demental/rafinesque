module Rafinesque
  module I18nBackend

    def self.included(base)
      base.class_eval do
        attr_accessor :default_semantics
        alias :store_translations_without_rafinesque :store_translations
        alias :store_translations :store_translations_with_rafinesque
      end
    end

    def store_translations_with_rafinesque(locale, data, options = {})
      data = deep_map(data) { |string| fill_placeholders(string, locale) }
      store_translations_without_rafinesque(locale, data, options)
    end

    private

    def deep_map node, &block
      case node
      when String then yield(node)
      when Array
        node.each_with_index do |obj, i|
          node[i]= deep_map(obj, &block)
        end
      when Hash
        node.each_pair do |key, value|
          node[key]= deep_map(value, &block)
        end
      end
      node
    end

    def fill_placeholders(string, locale)
      semantics[locale.to_s].each_pair do |search,replace|
        string.sub!("$#{search}$", replace)
      end
      string
    end

    def semantics
      @semantics ||= Hash.new({}).merge! default_semantics
    end
  end
end

I18n.backend.extend Rafinesque::I18nBackend
