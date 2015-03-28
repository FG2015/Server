class Task
  include Mongoid::Document
  include Mongoid::Timestamps
  
  validates_presence_of :name
  validates_presence_of :client
  validates_presence_of :rma
  validates_presence_of :date
  validates_presence_of :start_date
  validates_presence_of :end_date
  validates_presence_of :problem
  validates_presence_of :solution
  validates_presence_of :address

  # Fields
  field :name,        type: String
  field :client,      type: String
  field :client_phone,type: String
  field :rma,         type: String
  field :date,        type: DateTime
  field :start_date,  type: DateTime
  field :end_date,    type: DateTime
  field :problem,     type: String
  field :solution,    type: String
  field :address,     type: String
  belongs_to :user
end
