module Config
    def self.error_messages_path
        File.join(File.dirname(__FILE__),"error_messages.yaml")
    end
end
