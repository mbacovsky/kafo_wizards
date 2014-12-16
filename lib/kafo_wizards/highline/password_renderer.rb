module KafoWizards
  module HighLine

    class PasswordRenderer < StringRenderer
      def render_value(entry)
        "#{::HighLine.color("**********", :blue)}"
      end

      def render_action(entry)
        password = ask("Enter new password: ") { |q| q.echo = "*" }
        password_confirmation = ask("Re-type new password: ") { |q| q.echo = "*" }
        entry.update(:password => password, :password_confirmation => password_confirmation)
        nil
      end
    end
  end
end
