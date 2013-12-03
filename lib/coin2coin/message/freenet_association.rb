class Coin2Coin::Message::FreenetAssociation < Coin2Coin::Message::Base
  property :insert_key
  property :request_key
  
  attr_accessor :read_only_insert_key
  
  def initialize(read_only = false)
    @insert_key, @request_key = FreenetHash.new.generate_keypair
    
    if read_only
      self.read_only_insert_key = @insert_key
    else
      self.insert_key = @insert_key
    end
    self.request_key = @request_key
  end
end