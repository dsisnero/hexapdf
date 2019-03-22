module HexaPDF
    class Document
        
        class Form

            include Enumerable

            def initialize(document)
                @document = document
            end

            def root
                @document.catalog.form
            end

            def has_form?
                !root.nil?
            end

            def fields(&block)
            end


        end
    end
end


