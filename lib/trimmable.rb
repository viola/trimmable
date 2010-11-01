module Trimmable
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def trimmable_attributes *attributes_list
      before_validation do |model|
        attributes_list.each do |attribute|
          model[attribute] = model[attribute].strip if model[attribute].respond_to?(:strip)
        end
      end
    end
  end
end

class ActiveRecord::Base
  include Trimmable
end
