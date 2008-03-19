= Curies

* http://curies.rubyforge.org

== DESCRIPTION:

The Curies library implements the CURIE syntax for expressing Compact URIs.  

In a nutshell, a CURIE is a compact way of representing a URI.  For example, suppose you've got an XML document in which 
you'll be writing many attributes of the form "http://www.amazon.com/?isbn=123478753".  With a CURIE, you can represent those as
"[amazon:123478753]" where "amazon" is a registered prefix in your document.

This library is small, but useful if you're writing a parser for a language that uses CURIEs.  
I wrote it because I'm implementing an RDF/JSON library and, because the RDF/JSON spec isn't 
finalized yet, I've taken the liberty of using CURIEs rather than QNAMEs.

See http://www.w3.org/TR/curie/ for more information on the CURIE specification.

== FEATURES:

== 0.5.0 2008-03-19

* Initial release:
  * Should fully implement the W3C spec [http://www.w3.org/TR/curie/]
  * Allows the creation of CURIEs
  * Allows the parsing of a string as a putative CURIE
  * Allows prefixes/namespaces to be added and removed
  * Parses both safe and unsafe CURIEs but only outputs safe CURIEs
  * Includes the FOAF namespace loaded by default

== SYNOPSIS:

<pre syntax="ruby">require 'curies'</pre>
<pre syntax="ruby">c = Curie.new("foaf", "person")</pre>

<pre syntax="ruby">c.to_s</pre>
<pre syntax="ruby">=>"[foaf:person]"</pre>

<pre syntax="ruby">Curie.parse "[foaf:name]"</pre>
<pre syntax="ruby">"http://xmlns.com/foaf/0.1/person"</pre>

<pre syntax="ruby">Curie.parse "[foo:bar]"</pre>
<pre syntax="ruby">"RuntimeError: Sorry, no namespace or prefix registered for curies with the prefix foo"</pre>
<pre syntax="ruby">Curie.add_prefixes! :foo => "http://www.example.com/ns/foo/"</pre>
<pre syntax="ruby">=> {"foo"=>"http://www.example.com/ns/foo/", "foaf"=>"http://xmlns.com/foaf/0.1/"}</pre>
<pre syntax="ruby">Curie.parse "[foo:bar]"</pre>
<pre syntax="ruby">=> "http://www.example.com/ns/foo/bar"</pre>

== INSTALL:

sudo gem install curies

== LICENSE:

(The MIT License)

Copyright (c) 2008 Pius A. Uzamere II, The Uyiosa Corporation

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
