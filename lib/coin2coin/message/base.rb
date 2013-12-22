class Coin2Coin::Message::Base < Hashie::Dash
  include ActiveModel::Model
  
  class << self
    def build
      new
    end

    def add_properties(*properties)
      properties.each { |prop| property(prop) }
    end

    def from_json(json, attributes = {})
      hash = JSON.parse(json) rescue nil
      return nil unless hash.is_a?(Hash)

      return nil unless self.properties.collect(&:to_s).sort == self.properties

      message = self.new
      hash.each do |key, value|
        message.send("#{key}=", value)
      end

      return nil unless message.valid?

      message
    end
  end
end
