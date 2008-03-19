require File.dirname(__FILE__) + '/spec_helper.rb'
require File.dirname(__FILE__) + '/../lib/curies.rb'

describe "The Curie library" do 
  it "should be able to parse a safe curie into a fully qualified URI" do
    Curie.parse("[foaf:person]").should eql("http://xmlns.com/foaf/0.1/person")
  end
  
  it "should be able to parse a safe curie into its components, a fully qualified prefix and a reference" do
    Curie.parse("[foaf:person]", :in_parts => true).should eql(["http://xmlns.com/foaf/0.1/", "person"])
  end
  
  it "should be able to parse a standard curie into a fully qualified URI" do
    Curie.parse("foaf:person").should eql("http://xmlns.com/foaf/0.1/person")
  end
  
  it "should be able to parse a standard curie into its components, a fully qualified prefix and a reference" do
    Curie.parse("foaf:person", :in_parts => true).should eql(["http://xmlns.com/foaf/0.1/", "person"])
  end
  
  it "should raise an error when parsing a curie whose prefix has not been registed" do
    lambda { Curie.parse("foo:bar") }.should raise_error("Sorry, no namespace or prefix registered for curies with the prefix foo")
  end
  
  it "should allow users to add new prefixes when the prefix is a symbol" do
    Curie.add_prefixes! :foo => "http://foobaz.com"
    Curie.parse("foo:bar", :in_parts => true).should eql(["http://foobaz.com", "bar"])
  end
  
  it "should allow users to add new prefixes when the prefix is a string" do
    Curie.add_prefixes! "foo" => "http://foobaz.com"
    Curie.parse("foo:bar", :in_parts => true).should eql(["http://foobaz.com", "bar"])
  end
  
  it "should allow users to remove prefixes when the prefix is a string" do
    Curie.add_prefixes! "foo" => "http://foobaz.com"
    Curie.parse("foo:bar", :in_parts => true).should eql(["http://foobaz.com", "bar"])
    Curie.remove_prefixes! "foo"
    lambda { Curie.parse("foo:bar") }.should raise_error("Sorry, no namespace or prefix registered for curies with the prefix foo")
  end
  
  it "should allow users to remove prefixes when the prefix is a string" do
    Curie.add_prefixes! "foo" => "http://foobaz.com"
    Curie.parse("foo:bar", :in_parts => true).should eql(["http://foobaz.com", "bar"])
    Curie.remove_prefixes! :foo
    lambda { Curie.parse("foo:bar") }.should raise_error("Sorry, no namespace or prefix registered for curies with the prefix foo")
  end
end