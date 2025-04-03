# String Calculator - TDD Kata

## Overview

This project is an implementation of the **String Calculator TDD Kata** using **Ruby on Rails**. The goal is to follow strict **Test-Driven Development (TDD) principles**, ensuring each commit represents a clear TDD step.

## Features

- Supports adding numbers in a string format.
- Handles different delimiters (comma, newline, and custom delimiters).
- Raises exceptions for invalid inputs and negative numbers.
- Supports multiple custom delimiters.
- Handles consecutive delimiters correctly.

## Setup Instructions

### Prerequisites

- Install **Ruby** (version 3.x recommended).
- Install **Bundler**:  
  ```sh
  gem install bundler
  ```
- Clone the repository:  
  ```sh
  git clone https://github.com/yourusername/stringcalculator.git
  cd stringcalculator
  ```
- Install dependencies:  
  ```sh
  bundle install
  ```

### Running Tests

To run the test suite, use:  
```sh
bundle exec rspec spec/string_calculator.rb
```

## Usage

The `StringCalculator#add` method processes input strings and returns the sum of numbers.

```ruby
calculator = StringCalculator.new

puts calculator.add("")        # => 0
puts calculator.add("1")       # => 1
puts calculator.add("1,2,3")   # => 6
puts calculator.add("1\n2,3")  # => 6
puts calculator.add("//;\n1;2") # => 3
```

### Error Handling

- `calculator.add("1,-2,3")` raises: `"negative numbers not allowed: -2"`
- `calculator.add("//;\n1;;2")` raises: `"Invalid Input"`

## TDD Process

The development followed a strict **Red-Green-Refactor** cycle:

1. **Red** – Write a failing test.
2. **Green** – Implement minimal code to pass the test.
3. **Refactor** – Improve code structure while keeping tests green.

### Example Commit Messages

#### `feat` (Feature Implementation)
- `feat: Add support for custom delimiters`
- `feat: Raise exception for negative numbers`
- `feat: Handle multiple custom delimiters`

#### `test` (Adding Test Cases)
- `test: Add test for custom delimiter handling`
- `test: Verify exception for consecutive delimiters`
- `test: Add edge case test for single number`

#### `refactor` (Code Cleanup)
- `refactor: Extract delimiter validation into a separate method`
- `refactor: Improve error handling for invalid input`
- `refactor: Optimize delimiter regex for better readability`

