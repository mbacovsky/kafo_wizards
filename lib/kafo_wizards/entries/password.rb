module KafoWizards::Entries

  class PasswordEntry < StringEntry

    def validate(value)
      if value.length < 8
        raise KafoWizards::ValidationError.new("Password must be at least 8 characters long")
      end
      value
    end

    def update(value)
      if value[:password] != value[:password_confirmation]
        raise KafoWizards::ValidationError.new("Password and confirmation do not match")
      end
      @value = validate(value[:password])
    end

  end
end
