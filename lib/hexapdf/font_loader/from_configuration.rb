# -*- encoding: utf-8 -*-
#
#--
# This file is part of HexaPDF.
#
# HexaPDF - A Versatile PDF Creation and Manipulation Library For Ruby
# Copyright (C) 2014-2017 Thomas Leitner
#
# HexaPDF is free software: you can redistribute it and/or modify it
# under the terms of the GNU Affero General Public License version 3 as
# published by the Free Software Foundation with the addition of the
# following permission added to Section 15 as permitted in Section 7(a):
# FOR ANY PART OF THE COVERED WORK IN WHICH THE COPYRIGHT IS OWNED BY
# THOMAS LEITNER, THOMAS LEITNER DISCLAIMS THE WARRANTY OF NON
# INFRINGEMENT OF THIRD PARTY RIGHTS.
#
# HexaPDF is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public
# License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with HexaPDF. If not, see <http://www.gnu.org/licenses/>.
#
# The interactive user interfaces in modified source and object code
# versions of HexaPDF must display Appropriate Legal Notices, as required
# under Section 5 of the GNU Affero General Public License version 3.
#
# In accordance with Section 7(b) of the GNU Affero General Public
# License, a covered work must retain the producer line in every PDF that
# is created or manipulated using HexaPDF.
#++

require 'hexapdf/font/true_type_wrapper'
require 'hexapdf/font_loader/from_file'

module HexaPDF
  module FontLoader

    # This module uses the configuration option 'font.map' for loading a font.
    module FromConfiguration

      # Loads the given font by looking up the needed file in the 'font.map' configuration option.
      #
      # The file object representing the font file is *not* closed and if needed must be closed by
      # the caller once the font is not needed anymore.
      #
      # +document+::
      #     The PDF document to associate the font object with.
      #
      # +name+::
      #     The name of the font.
      #
      # +variant+::
      #     The font variant. Normally one of :none, :bold, :italic, :bold_italic.
      #
      # +subset+::
      #     Specifies whether the font should be subset if possible.
      def self.call(document, name, variant: :none, subset: true)
        file = document.config['font.map'].dig(name, variant)
        return nil if file.nil?

        unless File.file?(file)
          raise HexaPDF::Error, "The configured font file #{file} does not exist"
        end
        FromFile.call(document, file, subset: subset)
      end

    end

  end
end
