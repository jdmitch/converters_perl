This repository holds character encoding converters to covert ASCII characters in legacy fonts into Unicode Coptic characters and a processing perl script to convert a diplomatic, Coptic text transcription into SGML.
________________________________________
Simple Perl Converter:
recode_coptic.pl Version 1.1.0

This assumes a UTF-8 file in one word per line format and automatically converts Coptic encodings

Usage:

    recode_coptic.pl file

Read a file in Coptic font encoding and output standard Unicode as UTF-8

    recode_coptic.pl in_Coptic.txt > out_utf8.txt

See help (-h) for options

Specify the input format (-f): Default is Coptic font, other options are "CopticLS", "CMCL", "avva_shenouda", "low" (converts all upper case utf8 Coptic to all lower case).  E.g., to convert a text in the CopticLS font:

    recode_coptic.pl -f CopticLS in_Coptic.txt > out_utf8.txt

Copyright 2013-15 Amir Zeldes, Caroline T. Schroeder. The perl program is free software. You may copy or redistribute the script under the same terms as Perl itself.
_________________________________________
About CopticVDWtoUTFConverter

The contents of the CopticVDWtoUTFConverter zip file will convert a file keyed in the ASCII Coptic font created by Dirk Van Damme and Gregor Wurst into Unicode UTF-8 encoding for Coptic (and for use with such fonts as Antinoou).

Licensing

This software was created in 2012-13 by Eric E. Johnson in consultation with Stephen Emmel for the Coptic SCRIPtorIuM project directed by Caroline T. Schroeder and Amir Zeldes.  

Copyright 2013 by Eric E. Johnson

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
 
This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details. 

See the GNU General Public License at <http://www.gnu.org/licenses/>.

How To Use

These instructions assume some familiarity with the terminal and command line operations.

Before using, be sure your input file (ASCII Coptic file) is in LibreOffice format: .odt.  LibreOffice is a free download at http://www.libreoffice.org/download/

Unzip the files in this download.

Open the Terminal or command line interface, change to the the directory containing the unzipped files.  (Usually in the Terminal key in cd followed by the path, e.g.:  >cd /Users/yourname/CopticVDWtoUTFConverter )  For ease of use, put your input file into the directory with the converter.

To run the converter from the command line:

> python converter.py name_of_input_odf_file.odt name_of_output_markdown_file.md

________________________________________
SGML processor process_dipl.pl

version 1.0.0

converts SCRIPTORIUM transcription format to CWB/TreeTagger SGML

Copyright 2013-15 Amir Zeldes. The perl program is free software. You may copy or redistribute the script under the same terms as Perl itself.

________________________________________
copticizer.rb

version 1.0.0

converts ASCII characterset for the texts on the St Shenouda Society CD to the Coptic Unicode characterset. The Ruby program is free software. You can download from here: <https://www.ruby-lang.org/en/>

Copyright 2015 So Miyagawa, 12 June 2015  This is free software, and you are welcome to modify and redistribute it under the GPL v3 license.

This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.



_________________________________________
SGML Excel Add-in for Mac (sgml_io_Mac_0.9.3.xla)

An add-in for Microsoft Excel that converts SGML annotated text into multiple columns of data (SGML tag names = column names).  For use with the NLP pipeline output.  (See https://corpling.uis.georgetown.edu/coptic-nlp/ and code at https://github.com/CopticScriptorium/coptic-nlp)  Install add-inn.  Copy SGML-encoded text, paste into cell A1 of an Excel spreadsheet, then run the add-in.


