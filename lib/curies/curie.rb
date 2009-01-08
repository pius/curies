class String
  def could_be_a_safe_curie?
    self[0,1] == "[" and self[length - 1, length] == "]"
  end
end

class Curie
  DEFAULT_MAPPINGS = {"cal" => "http://www.w3.org/2002/12/cal/ical#",
                      "cc" => "http://creativecommons.org/ns#",
                      "contact" => "http://www.w3.org/2001/vcard-rdf/3.0#",
                      "dc" => "http://purl.org/dc/elements/1.1/",
                      "foaf" => "http://xmlns.com/foaf/0.1/", 
                      "rdf" => "http://www.w3.org/1999/02/22-rdf-syntax-ns#",
                      "rdfs" => "http://www.w3.org/2000/01/rdf-schema#",
                      "xsd" => "http://www.w3.org/2001/XMLSchema#",
                      "http" => "http" }
  @@mappings = {}
  @@mappings.merge! DEFAULT_MAPPINGS
  
  def initialize(prefix, reference)
    @prefix, @reference = prefix, reference
  end

  def self.parse(curie_string, opts = {})
    if opts[:treat_unsafe_as_normal_strings] and not curie_string.could_be_a_safe_curie?
      a = [curie_string, :string]
      return a
    end
    if not(curie_string.index(':')) #just some random string that doesn't even have a colon!
      #strip off brackets if they exist
      curie_string = curie_string[1,curie_string.length-2] if curie_string.could_be_a_safe_curie?
      return curie_string
    elsif curie_string.could_be_a_safe_curie?
      pivot = curie_string.index(':')
      prefix = curie_string[1,pivot-1]
      reference = curie_string[pivot+1, curie_string.length].chop
    else
      pivot = curie_string.index(':')
      prefix = curie_string[0,pivot]
      reference = curie_string[pivot+1, curie_string.length]
    end
    if opts[:in_parts]
      return [qualified_uri_for(prefix), reference]
    else
      return qualified_uri_for(prefix) + reference
    end
  end
  
  def self.qualified_uri_for(prefix)
    return @@mappings[prefix] if @@mappings[prefix]
    raise "Sorry, no namespace or prefix registered for curies with the prefix #{prefix}"
  end
  
  def self.add_prefixes!(mappings)
    @@mappings.merge! mappings.stringify_keys
  end
  
  def self.remove_prefixes!(prefixes)
    prefixes = [prefixes] unless prefixes.respond_to? :each
    for prefix in prefixes
      @@mappings.delete prefix.to_s
    end
  end

  def to_s
    "[#{@prefix}:#{@reference}]"
  end
end

class Hash #nodoc
   def stringify_keys #nodoc
      inject({}) do |options, (key, value)|
          options[key.to_s] = value
      options
      end
    end
end
