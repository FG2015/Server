class Client
  include Mongoid::Document
  include Mongoid::Timestamps

  # Validations
  validates_presence_of :name
  validates_presence_of :phone

  # Fields
  field :name,        type: String
  field :phone,       type: String
  
  # Location
  field :location, :type => Array  # [lat,lng]
  index( { location: '2d' }, { min: -180, max: 180 }) # create an special index 
  before_save :fix_location, if: :location_changed? # lat and lng must be in float format
  def fix_location
    self.location = self.location.map(&:to_f)
  end

  # Relationships
  has_many :tasks
end
