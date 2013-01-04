class User < ActiveRecord::Base
  has_secure_password

  scope :enabled, lambda { where(:state => :enabled) }

  state_machine :state, :initial => :disabled do
    state :enabled do
      validates :login, :presence => true
      validates :password_digest, :presence => true
    end

    event :enable do
      transition :disabled => :enabled
    end

    event :disable do
      transition :enabled => :disabled
    end
  end
end
