class Client
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Spacial::Document

  # Validations
  validates_presence_of :name
  validates_presence_of :phone

  # Fields
  field :name,        type: String
  field :phone,       type: String
  field :location,    type: Array,    spacial: true


  # Relationships
  has_many :tasks
end
