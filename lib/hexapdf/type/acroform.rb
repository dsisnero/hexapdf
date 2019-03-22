require 'hexapdf/dictionary'
require 'hexapdf/utils/bit_field'


module HexaPDF
    module TypeError
        
        # a special widget annotation that is the building block of PDF forms
        class Acroform < Dictionary

            extend Utils::BitField


            define_field :Fields,           type: Array,        version: '1.2'
            define_field :DR,               type: Dictionary,   version: '1.2'
            define_field :NeedApperances,   type: Boolean,      default: false
            define_field :XFA,              type: Array,        version: '1.5'
            
        end

    end
    