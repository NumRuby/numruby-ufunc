# TODO.md — Proposed Roadmap

## NumRuby::UFunc Gem

**Goal:** Complete full set of NumPy-like ufuncs, improve ergonomics, and ensure test coverage.

---

## Remaining UFuncs to Implement

| Name      | Human Name         | Description                             |
| --------- | ------------------ | --------------------------------------- |
| `exp2`    | Base-2 Exponential | Computes 2^x elementwise                |
| `floor`   | Floor              | Elementwise floor of x                  |
| `hypot`   | Hypotenuse         | Elementwise sqrt(x^2 + y^2)             |
| `log`     | Natural Logarithm  | Elementwise ln(x)                       |
| `log10`   | Base-10 Logarithm  | Elementwise log10(x)                    |
| `log2`    | Base-2 Logarithm   | Elementwise log2(x)                     |
| `maximum` | Maximum            | Elementwise maximum of x and y          |
| `minimum` | Minimum            | Elementwise minimum of x and y          |
| `pow`     | Power              | Elementwise x^y                         |
| `round`   | Round              | Elementwise rounding to nearest integer |
| `sign`    | Sign               | Elementwise sign: -1,0,1                |
| `sinh`    | Hyperbolic Sine    | Elementwise sinh(x)                     |
| `sqrt`    | Square Root        | Elementwise sqrt(x)                     |
| `sub`     | Subtraction        | Elementwise x - y                       |
| `tan`     | Tangent            | Elementwise tangent of x                |
| `tanh`    | Hyperbolic Tangent | Elementwise tanh(x)                     |
| `trunc`   | Truncate           | Elementwise truncation toward zero      |

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
