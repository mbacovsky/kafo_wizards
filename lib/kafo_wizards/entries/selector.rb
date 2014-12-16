module KafoWizards::Entries

  class SelectorEntry < StringEntry
    attr_accessor :options
    def initialize(name, options={})
      super(name, options)
      @options = options.fetch(:options, {})
    end

    def validate(value)
      raise KafoWizards::ValidationError.new("#{value} is not a valid option") unless options.include?(value)
      value
    end
  end

end
