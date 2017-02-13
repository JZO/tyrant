module Tyrant
    def self.error_messages_path
        file_path = File.join(File.dirname(__FILE__),"error_messages.yaml")
    end
end
