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
    it "supports custom delimiters defined in the input" do
      calculator = StringCalculator.new
      expect(calculator.add("//;\n1;2")).to eq(3)
      expect(calculator.add("//|\n2|3|4")).to eq(9)
    end
    it "raises an exception for negative numbers" do
      calculator = StringCalculator.new
      expect { calculator.add("1,-2,3") }.to raise_error("negative numbers not allowed: -2")
      expect { calculator.add("//;\n4;-5;6") }.to raise_error("negative numbers not allowed: -5")
      expect { calculator.add("-1,-2,-3")}.to raise_error("negative numbers not allowed: -1, -2, -3")
    end
    it "raises an error for invalid delimiter formats" do
      calculator = StringCalculator.new
      expect { calculator.add("//{+}1+2+") }.to raise_error("Invalid Input")
      expect { calculator.add("//{1-2") }.to raise_error("Invalid Input")
    end
    it "treats //-1-2 correctly based on delimiter rule" do
      calculator = StringCalculator.new
      expect(calculator.add("//-\n1-2")).to eq(3)
      expect { calculator.add("//-1-2") }.to raise_error("Invalid Input")
    end
    it "supports + as a valid delimiter if explicitly set" do
      calculator = StringCalculator.new
      expect(calculator.add("//+\n1+2")).to eq(3)
      expect { calculator.add("1+2") }.to raise_error("Invalid Input")
    end
    it "raises an error for consecutive delimiters" do
      calculator = StringCalculator.new
      expect { calculator.add("//;\n1;;2") }.to raise_error("Invalid Input")
      expect { calculator.add("//|\n3||4") }.to raise_error("Invalid Input")
    end
  end
end
