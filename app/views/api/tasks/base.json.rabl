node(:id) { |w| w.id.to_s }

attributes :name
attributes :rma
attributes :start_date
attributes :end_date
attributes :solution
attributes :address
node(:client_name) { |t|  t.client.name }
node(:client_phone) { |t|  t.client.phone }
node(:client_latitude) { |t|  t.client.location[0] }
node(:client_longitude) { |t|  t.client.location[1] }
