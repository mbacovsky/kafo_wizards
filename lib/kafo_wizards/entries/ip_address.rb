module KafoWizards::Entries

  class IPAddressEntry < StringEntry
    def validate(value)
      if !(value =~ Resolv::IPv4::Regex)
        raise KafoWizards::ValidationError.new("#{value} is not valid IP address")
      end
      value
    end

  end
end
