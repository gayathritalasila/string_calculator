# String Calculator TDD Kata

This project is an implementation of the **String Calculator** kata using **Test-Driven Development (TDD)** in **Ruby** with **RSpec** for testing.

## 🚀 Project Overview

The goal of this kata is to implement a `StringCalculator` class that provides an `add` method to sum numbers from a string input while following **TDD best practices**.

### 📌 **Requirements**
- The `add` method accepts a **comma-separated** string of numbers and returns their **sum**.
- It handles **empty strings** (`"" → 0`).
- It supports **multiple numbers** (`"1,2,3" → 6`).
- It allows **newlines (`\n`) as delimiters** (`"1\n2,3" → 6`).
- It supports **custom delimiters** (`"//;\n1;2" → 3`).
- It throws an **exception** for **negative numbers** (`"-1,-2"` → `"negative numbers not allowed: -1, -2"`).

---

## ⚙️ **Project Setup**

### **Prerequisites**
Ensure you have **Ruby** and **Bundler** installed:

```sh
ruby -v     # Check Ruby version
gem install bundler
```

### **1️⃣ Clone the Repository**
```sh
git clone https://github.com/YOUR_USERNAME/stringcalculator.git
cd stringcalculator
```

### **2️⃣ Install Dependencies**
```sh
bundle install
```

### **3️⃣ Run Tests**
Run the test suite to validate your implementation:

```sh
bundle exec rspec
```

---

## 🛠 **TDD Workflow**
This project follows **TDD (Test-Driven Development)**:
1. **Write a failing test** (Red).
2. **Implement just enough code to pass** (Green).
3. **Refactor the code** (Refactor).

---

## 💜 **Example Usage**
You can use the `StringCalculator` class in an interactive Ruby session (`irb`) or in a script.

```ruby
require_relative "./lib/string_calculator"

calculator = StringCalculator.new
puts calculator.add("")       # Output: 0
puts calculator.add("1")      # Output: 1
puts calculator.add("1,2,3")  # Output: 6
puts calculator.add("1\n2,3") # Output: 6
puts calculator.add("//;\n1;2") # Output: 3
```

---

## ✅ **Test Cases**
| Input            | Expected Output |
|-----------------|---------------|
| `""`            | `0`           |
| `"1"`           | `1`           |
| `"1,2"`         | `3`           |
| `"1,2,3,4"`     | `10`          |
| `"1\n2,3"`      | `6`           |
| `"//;\n1;2"`    | `3`           |
| `"-1,-2"`       | Exception: `"negative numbers not allowed: -1, -2"` |

---

## 📌 **Commit History (Following TDD)**
Each commit represents a **TDD step**:
- ✅ **Step 1:** Create initial failing test for an empty string (`"" → 0`).
- ✅ **Step 2:** Implement `add` method to handle a single number.
- ✅ **Step 3:** Add support for multiple numbers.
- ✅ **Step 4:** Allow newline (`\n`) as a delimiter.
- ✅ **Step 5:** Support custom delimiters.
- ✅ **Step 6:** Handle negative numbers by raising an exception.

---

## 💜 **Project Structure**
```
stringcalculator/
│── lib/
│   ├── string_calculator.rb  # Implementation
│── spec/
│   ├── string_calculator_spec.rb  # RSpec Tests
│── Gemfile   # Dependencies
│── .rspec    # RSpec configuration
│── spec/spec_helper.rb  # Test setup
│── README.md  # Project documentation
```
