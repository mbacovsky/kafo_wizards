module KafoWizards
  module HighLine
    class ButtonRenderer < AbstractRenderer
      def render_entry(entry)
        color = entry.default? ? :green : :red
        "#{::HighLine.color(entry.label, color)}"
      end

      def render_action(entry)
        entry.name
      end
    end
  end
end
