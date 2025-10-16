# SYSTEM.md — Architecture Design Philosophy and Approach

## Purpose

NumRuby aims to bring a Ruby-native scientific computing experience similar to Python’s NumPy.
The `UFunc` gem provides a collection of elementwise mathematical operations,
while the meta gem (`numruby`) organizes and exposes these operations in a single unified namespace.

---

## Design Principles

1. **Modular Architecture**

   - Each ufunc is implemented in its **own module** under `NumRuby::UFunc`.
   - Modules register themselves automatically with a **central `Registry`**.
   - Top-level `NumRuby` methods are injected for convenience (e.g., `NumRuby.add(x, y)`).

2. **Explicitness**

   - Avoid metaprogramming tricks like `method_missing` or dynamic `define_method`.
   - Each function is explicitly defined and documented for clarity.

3. **Separation of Concerns**

   - **UFunc modules** define computation (`.call`).
   - **Registry** handles discovery and lookup.
   - **Top-level NumRuby methods** provide ergonomic access.

4. **Self-Descriptive**

   - Each ufunc contains a **plain-text documentation comment block** with:

     - `Human Name`
     - `Description`
     - `Type` (Unary or Binary)
     - Usage example

5. **Ruby-Native Numeric**

   - Uses `Numo::NArray` and `Numo::NMath` where feasible.
   - Prefers Ruby-native operations where performance and correctness allow.

6. **Incremental Development**

   - New ufuncs can be added one module at a time.
   - No changes to core registry logic required for each addition.

---

## File Structure

```
numruby/
├── lib/
│   ├── numruby.rb      # top-level requires
│   ├── numruby/ufunc/  # all ufunc definitions
│   │   ├── add.rb
│   │   ├── sin.rb
│   │   └── ...
│   ├── numruby/ufunc/registry.rb
├── spec/
│   ├── numruby/ufunc/
│   │   ├── add_spec.rb
│   │   ├── sin_spec.rb
│   │   └── ...
```

---

## Key Patterns

### UFunc Module

```ruby
module NumRuby
  module UFunc
    module Add
      def self.call(x, y)
        x + y
      end
    end
  end
end
```

### Registry Registration

```ruby
NumRuby::UFunc::Registry.register(:add, NumRuby::UFunc::Add)
```

### NumRuby Injection

```ruby
module NumRuby
  def self.add(x, y)
    UFunc::Add.call(x, y)
  end
end
```

### Test-Driven

Each ufunc has its own spec file for **self-contained testing**.

## Diagram

```
               +-------------------+
               |     NumRuby       |  <-- Top-level namespace
               |-------------------|
               | + add(x, y)       |
               | + sin(x)          |
               | + ... (all ufuncs)|
               +---------+---------+
                         |
                         v
               +-------------------+
               | UFunc Registry    |  <-- Central registry for all ufuncs
               |-------------------|
               | :add   => Add     |
               | :sin   => Sin     |
               | ...               |
               +---------+---------+
                         |
                         v
          +--------------+--------------+
          |             UFuncs          |  <-- One module per ufunc
          |-----------------------------|
          | Add.rb       | call(x, y)   |
          | Sin.rb       | call(x)      |
          | Cos.rb       | call(x)      |
          | ...                         |
          +-----------------------------+
                         |
                         v
                  +--------------------+
                  | Numo/Numo::NMath   |
                  |--------------------|
                  | Provides low-level |
                  | numerical ops      |
                  +--------------------+
```
