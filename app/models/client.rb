class Client
  include Mongoid::Document
  include Mongoid::Timestamps
  
  # Validations
  validates_presence_of :name
  validates_presence_of :phone

  # Fields
  field :name,        type: String
  field :phone,      type: String

  # Relationships
  embeds_many :tasks
end
