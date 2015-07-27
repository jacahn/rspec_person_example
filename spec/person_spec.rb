require_relative '../models/person'  # a reference to our code

describe Person do
  describe "Constructor" do
    before(:each) do
      @matt = Person.new("Matt")
    end

    it "should create a new instance of class Person" do
      expect(@matt).to be_an_instance_of(Person)
    end

    it "should have a name" do
      expect(@matt.name).to_not be_nil
    end

    it "should default #language to 'English'" do
      expect(@matt.language).to eq("English")
    end
  end

  describe "#greeting" do
    context "for default language (English)" do
      subject(:bob) { Person.new("Bob") }

      it "should offer a greeting in English" do
        expect(bob.greeting).to eql("Hello, my name is Bob.")
      end
    end

    context "when language is 'Italian'" do
      subject(:tony) { Person.new("Tony", "Italian") }

      it "should offer a greeting in Italian" do
        expect(tony.greeting).to eql("Ciao, mi chiamo Tony.")
      end
    end

    context "when language is 'Spanish'" do
      subject(:maria) { Person.new("Maria", "Spanish") }

      it "should offer a greeting in Spanish" do
        expect(maria.greeting).to eql("Hola me llamo Maria.")
      end
    end

    context "when the language is not supported" do
      subject(:worf) { Person.new("Worf", "Klingon") }

      it "should raise an error when the language is not supported" do
        expect{ worf.greeting }.to raise_error(ArgumentError, /not supported/)
      end

    end
  end
end
