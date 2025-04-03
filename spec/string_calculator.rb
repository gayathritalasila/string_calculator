require_relative "../lib/string_calculator"

RSpec.describe StringCalculator do
  describe "#add" do
    it "returns 0 for an empty string" do
      calculator = StringCalculator.new
      expect(calculator.add("")).to eq(0)
    end
    it "returns the number itself for a single number" do
        calculator = StringCalculator.new
        expect(calculator.add("1")).to eq(1)
        expect(calculator.add("5")).to eq(5)
    end
    it "returns the sum of two numbers" do
        calculator = StringCalculator.new
        expect(calculator.add("1,2")).to eq(3)
        expect(calculator.add("4,5")).to eq(9)
    end
    it "handles new lines as delimiters" do
      calculator = StringCalculator.new
      expect(calculator.add("1\n2,3")).to eq(6)
      expect(calculator.add("4\n5,6")).to eq(15)
    end
  end
end
