# TODO.md — Proposed Roadmap

## NumRuby::UFunc Gem

**Goal:** Complete full set of NumPy-like ufuncs, improve ergonomics, and ensure test coverage.

---

## All UFuncs in NumPy

## NumPy Ufuncs Reference Sheet

[NumPy Universal functions (ufunc) documentation][https://numpy.org/doc/stable/reference/ufuncs.html]

### Math operations

| ✅ | Ufunc Name      | Human Name                         | Description                                                                                         |
| -- | --------------- | ---------------------------------- | --------------------------------------------------------------------------------------------------- |
| ✅ | `add`           | Addition                           | Adds corresponding elements of two arrays.                                                          |
| ⚠️ | `subtract`      | Subtraction                        | Subtracts corresponding elements of two arrays.                                                     |
| ✅ | `multiply`      | Multiplication                     | Multiplies corresponding elements of two arrays.                                                    |
| [] | `matmul`        | TODO                               | TODO                                                                                                |
| ✅ | `divide`        | Division                           | Divides corresponding elements of two arrays.                                                       |
| [] | `logaddexp`     | TODO                               | TODO                                                                                                |
| [] | `logaddexp2`    | TODO                               | TODO                                                                                                |
| [] | `true_divide`   | True Division                      | Divides corresponding elements of two arrays, returning float results.                              |
| [] | `floor_divide`  | Floor Division                     | Divides and floors the result for each element.                                                     |
| [] | `negative`      | Negation                           | Negates each element.                                                                               |
| [] | `positive`      | TODO                               | TODO                                                                                                |
| [] | `power`         | Power                              | Raises elements of one array to the powers of another array element-wise.                           |
| [] | `float_power`   | TODO                               | TODO                                                                                                |
| [] | `remainder`     | Remainder                          | Computes the remainder of division for each element.                                                |
| [] | `mod`           | Modulus                            | Computes the remainder of division for each element.                                                |
| [] | `fmod`          | TODO                               | TODO                                                                                                |
| [] | `divmod`        | TODO                               | TODO                                                                                                |
| ⚠️ | `absolute`      | Absolute Value                     | Returns the absolute value of each element.                                                         |
| [] | `fabs`          | TODO                               | TODO                                                                                                |
| ⚠️ | `rint`          | Round to Nearest Integer           | Rounds each element to the nearest integer.                                                         |
| ✅ | `sign`          | Sign Function                      | Returns -1, 0, or 1 depending on the sign of each element.                                          |
| [] | `heaviside`     | TODO                               | TODO                                                                                                |
| [] | `conj`          | Complex Conjugate                  | Returns the complex conjugate of each element.                                                      |
| [] | `conjugate`     | Complex Conjugate                  | Returns the complex conjugate of each element.                                                      |
| ✅ | `exp`           | Exponential                        | Computes the exponential (e^x) of each element.                                                     |
| ✅ | `exp2`          | Base-2 Exponential                 | Computes 2 raised to the power of each element.                                                     |
| [] | `expm1`         | Exponential Minus One              | Computes e^x - 1 for each element.                                                                  |
| ✅ | `log`           | Natural Logarithm                  | Computes the natural logarithm (base e) of each element.                                            |
| ✅ | `log2`          | Base-2 Logarithm                   | Computes the base-2 logarithm of each element.                                                      |
| ✅ | `log10`         | Base-10 Logarithm                  | Computes the base-10 logarithm of each element.                                                     |
| [] | `expm1`         | TODO                               | TODO                                                                                                |
| [] | `log1p`         | Logarithm of One Plus              | Computes log(1 + x) for each element.                                                               |
| ✅ | `sqrt`          | Square Root                        | Computes the square root of each element.                                                           |
| [] | `square`        | Square                             | Computes the square of each element.                                                                |
| [] | `cbrt`          | TODO                               | TODO                                                                                                |
| [] | `reciprocal`    | Reciprocal                         | Computes the reciprocal (1/x) of each element.                                                      |
| [] | `gcd`           | TODO                               | TODO                                                                                                |
| [] | `lcm`           | TODO                               | TODO                                                                                                |

### Trigonometric functions

| ✅ | Ufunc Name      | Human Name                         | Description                                                                                         |
| -- | --------------- | ---------------------------------- | --------------------------------------------------------------------------------------------------- |
| ✅ | `sin`           | Sine                               | Computes the sine of each element.                                                                  |
| ✅ | `cos`           | Cosine                             | Computes the cosine of each element.                                                                |
| ✅ | `tan`           | Tangent                            | Computes the tangent of each element.                                                               |
| ✅ | `arccos`        | Inverse Cosine                     | Computes the inverse cosine of each element.                                                        |
| ✅ | `arcsin`        | Inverse Sine                       | Computes the inverse sine of each element.                                                          |
| ✅ | `arctan`        | Inverse Tangent                    | Computes the inverse tangent of each element.                                                       |
| [] | `arctan2`       | TODO                               | TODO                                                                                                |
| ✅ | `hypot`         | Hypotenuse                         | Computes sqrt(x^2 + y^2) for each pair of elements.                                                 |
| ✅ | `sinh`          | Hyperbolic Sine                    | Computes the hyperbolic sine of each element.                                                       |
| ✅ | `cosh`          | Hyperbolic Cosine                  | Computes the hyperbolic cosine of each element.                                                     |
| ✅ | `tanh`          | Hyperbolic Tangent                 | Computes the hyperbolic tangent of each element.                                                    |
| [] | `arcsinh`       | Inverse Hyperbolic Sine            | Computes the inverse hyperbolic sine of each element.                                               |
| [] | `arccosh`       | Inverse Hyperbolic Cosine          | Computes the inverse hyperbolic cosine of each element.                                             |
| [] | `arctanh`       | Inverse Hyperbolic Tangent         | Computes the inverse hyperbolic tangent of each element.                                            |
| [] | `degrees`       | TODO                               | TODO                                                                                                |
| [] | `radians`       | Degrees to Radians                 | Converts angles from degrees to radians.                                                            |
| [] | `deg2rad`       | TODO                               | TODO                                                                                                |
| [] | `rad2deg`       | TODO                               | TODO                                                                                                |

### Bit-twiddling functions

| ✅ | Ufunc Name      | Human Name                         | Description                                                                                         |
| -- | --------------- | ---------------------------------- | --------------------------------------------------------------------------------------------------- |
| [] | `bitwise_and`   | Bitwise AND                        | Performs bitwise AND operation on corresponding elements.                                           |
| [] | `bitwise_or`    | Bitwise OR                         | Performs bitwise OR operation on corresponding elements.                                            |
| [] | `bitwise_xor`   | Bitwise XOR                        | Performs bitwise XOR operation on corresponding elements.                                           |
| [] | `invert`        | Bitwise NOT                        | Performs bitwise NOT operation on each element. alias: `bitwise_not`                                |
| [] | `left_shift`    | Left Shift                         | Shifts the bits of each element to the left.                                                        |
| [] | `right_shift`   | Right Shift                        | Shifts the bits of each element to the right.                                                       |

### Comparison functions

| ✅ | Ufunc Name      | Human Name                         | Description                                                                                         |
| -- | --------------- | ---------------------------------- | --------------------------------------------------------------------------------------------------- |
| [] | `greater`       | Greater Than                       | Checks if elements of one array are greater than the corresponding elements of another.             |
| [] | `greater_equal` | Greater Than or Equal              | Checks if elements of one array are greater than or equal to the corresponding elements of another. |
| [] | `less`          | Less Than                          | Checks if elements of one array are less than the corresponding elements of another.                |
| [] | `less_equal`    | Less Than or Equal                 | Checks if elements of one array are less than or equal to the corresponding elements of another.    |
| [] | `not_equal`     | Not Equal                          | Checks element-wise inequality between two arrays.                                                  |
| [] | `equal`         | Equal                              | Checks element-wise equality between two arrays.                                                    |
| [] | `logical_and`   | Logical AND                        | Performs element-wise logical AND operation.                                                        |
| [] | `logical_or`    | Logical OR                         | Performs element-wise logical OR operation.                                                         |
| [] | `logical_xor`   | Logical XOR                        | Performs element-wise logical XOR operation.                                                        |
| [] | `logical_not`   | Logical NOT                        | Performs element-wise logical NOT operation.                                                        |
| ✅ | `maximum`       | Maximum                            | Returns the maximum of two arrays element-wise.                                                     |
| ✅ | `minimum`       | Minimum                            | Returns the minimum of two arrays element-wise.                                                     |
| [] | `fmax`          | Maximum (ignoring NaNs)            | Returns the maximum of two arrays, ignoring NaNs.                                                   |
| [] | `fmin`          | Minimum (ignoring NaNs)            | Returns the minimum of two arrays, ignoring NaNs.                                                   |

### Floating functions

| [] | `isfinite`      | Finite Check                       | Checks if each element is finite (not NaN, inf, or -inf).                                           |
| [] | `isinf`         | Infinite Check                     | Checks if each element is infinite.                                                                 |
| [] | `isnan`         | NaN Check                          | Checks if each element is NaN.                                                                      |
| [] | `isnat`         | TODO                               | TODO                                                                                                |
| [] | `fabs`          | TODO also in Math Operion                               | TODO                                                                           |
| [] | `signbit`       | Sign Bit                           | Checks if the sign bit of each element is set.                                                      |
| [] | `copysign`      | Copy Sign                          | Copies the sign of one array to another.                                                            |
| [] | `nextafter`     | Next Floating Point                | Returns the next floating-point value after each element.                                           |
| [] | `spacing`       | TODO                               | TODO                                                                                                |
| [] | `modf`          | TODO                               | TODO                                                                                                |
| [] | `ldexp`         | TODO                               | TODO                                                                                                |
| [] | `frexp`         | TODO                               | TODO                                                                                                |
| [] | `frexp`         | Decompose to Mantissa and Exponent | Decomposes each element into mantissa and exponent.                                                 |
| ✅ | `floor`         | Floor                              | Returns the largest integer less than or equal to each element.                                     |
| ✅ | `ceil`          | Ceiling                            | Returns the smallest integer greater than or equal to each element.                                 |
| ✅ | `trunc`         | Truncate                           | Truncates each element to the nearest integer towards zero.                                         |


---

## Meta Gem (`numruby`)

- Integrate all sub-gems (`numruby-ufunc`, `numruby-linalg`, `numruby-stats`, etc.)
- Provide top-level namespace:

```ruby
require 'numruby'
NumRuby.add(x, y)
NumRuby.linalg.inv(matrix)
```

* Maintain clear `require` hierarchy.
* Automate auto-loading of submodules where feasible.

---

## Future Enhancements

- **Vectorized Numo wrapper functions** for binary ops.
- **Plotting integration** (`numruby-plot`) for quick visualization.
- **Statistics module** (`numruby-stats`) covering mean, median, variance, etc.
- **Linalg module** (`numruby-linalg`) for matrix operations.
- **Optional:** allow NumRuby instantiation `nr = NumRuby.new` for flexibility.
