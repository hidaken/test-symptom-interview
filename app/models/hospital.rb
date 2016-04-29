class Hospital < ActiveRecord::Base
    validates_uniqueness_of(:login_id, :message => "既に使われているログインIDです")
    has_secure_password
    
    
    has_many :frequency_points
end
