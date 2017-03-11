class ApplicationService
  attr_reader :user, :errors

  def self.call(*arguments)
    new(*arguments).tap(&:perform)
  end

  def initialize(*_arguments)
    @errors = ErrorsService.new
  end

  def perform
    ActiveRecord::Base.transaction do
      return true if executing

      errors[:service] << 'unknown error' if errors.empty?
      raise ActiveRecord::Rollback
    end

    failure_callback
    # some logging could be here
    false
  end

  def success?
    errors.empty?
  end

  private

  def executing
    raise 'not implemented'
  end

  def failure_callbck
  end
end
