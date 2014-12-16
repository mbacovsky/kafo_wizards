module KafoWizards::Entries

  class BooleanEntry < AbstractEntry

    def initialize(name, options={})
      super(name, options)
      @value = @default_value ? true : false
    end

  end
end
