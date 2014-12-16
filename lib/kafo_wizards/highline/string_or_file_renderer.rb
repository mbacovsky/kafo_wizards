module KafoWizards
  module HighLine

    class StringOrFileRenderer < StringRenderer
      def render_value(entry)
        value = entry.value.to_s
        if value.length > 40
          value = entry.value[0..37]+'...'
        end
        "'#{::HighLine.color(value, :blue)}' (#{entry.value.to_s.length} bytes)"
      end

      def render_action(entry)
        say entry.description if entry.description
        key = ask("file path or key")
        key = File.read(key) if File.exists?(key)
        entry.update(key.chomp)
        nil
      end
    end
  end
end
