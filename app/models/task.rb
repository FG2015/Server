class Task
  include Mongoid::Document

  validates_presence_of :name
  validates_presence_of :client
  validates_presence_of :rma
  validates_presence_of :name
  validates_presence_of :name
  validates_presence_of :name
  validates_presence_of :name

  # Fields
  field :name,        type: String
  field :client,      type: String
  field :rma,         type: String
  field :date,        type: Date
  field :start_date,  type: Date
  field :end_date,    type: Date
  field :problem,     type: String
  field :solution,    type: String
  field :address,     type: String
end
