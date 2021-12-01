class Membership < ApplicationRecord
  belongs_to :client
  belongs_to :gym

  validates :client_id, uniqueness:true, {scope:gym_id}

end