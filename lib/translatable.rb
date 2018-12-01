# frozen_string_literal: true

module Translatable
  extend ActiveSupport::Concern

  module ClassMethods
    def translatable(*attributes)
      @translatable = attributes
      attributes&.each do |attribute|
        define_method attribute do
          v = self[attribute]
          v[I18n.locale.to_s] if v.is_a?(Hash) && v.key?(I18n.locale.to_s)
        end
      end
    end

    def where(*args)
      if args.size == 1 && args.first.is_a?(Hash) && @translatable&.include?(args.first.keys.first)
        key = args.first.keys.first
        value = args.first[key]
        return super "#{key}->>'#{I18n.locale}' = ?", value
        # args = args&.first&.transform_keys do |key|
        #   @translatable.include?(key) ? "#{key}->'#{I18n.locale}'" : key
        # end
      end
      # raise args.inspect
      super(*args)
    end

    # if the available locales are `en` and `sv` returns something like:
    # {
    #   en: value,
    #   sv: value
    # }
    def translatable_factory(value)
      val = {}
      I18n.available_locales.each do |locale|
        val[locale.to_sym] = value
      end
      val
    end
  end
end

ActiveRecord::Base.send(:include, Translatable)
