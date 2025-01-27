module UseCase
  extend ActiveSupport::Concern

  included do
    def self.perform(*args)
      new(*args).perform
    end
  end
end
