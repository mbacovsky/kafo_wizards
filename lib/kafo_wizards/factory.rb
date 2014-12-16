module KafoWizards

  def self.wizard(kind, header, options={})
    HighLine::Wizard.new(header, options)
  end

  class Factory

    def initialize(wizard=nil)
      @wizard = wizard
    end

    def method_missing(meth, *args, &block)
      if @wizard
        args << {} unless args.last.class <= Hash
        args[-1][:parent] = @wizard unless args[-1].has_key?(:parent)
      end
      case meth
      when :button
        KafoWizards::Entries::ButtonEntry.new(*args)
      when :password
        KafoWizards::Entries::PasswordEntry.new(*args)
      when :boolean
        KafoWizards::Entries::BooleanEntry.new(*args)
      when :string_or_file
        KafoWizards::Entries::StringOrFileEntry.new(*args)
      when :ip_address
        KafoWizards::Entries::IPAddressEntry.new(*args)
      when :netmask
        KafoWizards::Entries::NetmaskEntry.new(*args)
      when :selector
        KafoWizards::Entries::SelectorEntry.new(*args)
      else
        KafoWizards::Entries::StringEntry.new(*args)
      end
    end
  end
end
