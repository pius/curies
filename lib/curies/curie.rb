class Curie
  DEFAULT_MAPPINGS = {"foaf" => "http://xmlns.com/foaf/0.1/" }
  @@mappings = {}
  @@mappings.merge! DEFAULT_MAPPINGS
  
  def initialize(prefix, reference)
    @prefix, @reference = prefix, reference
  end

  def self.parse(curie_string, opts = {})
    if curie_string[0,1] == "[" and curie_string[curie_string.length - 1, curie_string.length] == "]"
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
