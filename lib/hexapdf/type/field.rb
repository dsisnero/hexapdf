require 'hexapdf/dictionary'
require 'hexapdf/utils/bit_field'


module HexaPDF

  module Type

    # Represents a field of a PDF interactiver form
    class Field < Annotation

        INHERITABLE_FIELDS = [:FT, :Ff]

        define_type :Subtype,           type: Symbol, required: true, default: :Widget
        
        define_field :Kids               type: Array
        define_field :FT,                type: Symbol, required: true

        define_field :T,                 type: PDFByteString
        define_field :TU,                type: PDFByteString
        define_field :TM,                type: PDFByteString
        define_field :F,                 type: Integer, default: 0


        bit_field(:raw_flags, {readonly: 1, required: 2, no_export: 3},
          lister: "flags", getter: "flagged?", setter: "flag")

        private 

        def raw_flag 
          self[Ff]
        end

        def raw_flags=(value)
          self[:F] = value
        end

      end


    end


  end

end
       
       


