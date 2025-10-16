# AGENT.md — Agent Development Guidelines

## Behavior

Agents (human, model, or tool) contributing to `NumRuby` should follow these conventions:

1. **Namespace Discipline**

   - New ufunc modules must live under `NumRuby::UFunc`.
   - Use `Registry.register(:name, ModuleName)` for automatic registration.
   - Add a top-level `NumRuby.<name>` method in the module file.

2. **Explicitness over Magic**

   - Avoid dynamic method creation.
   - Define methods explicitly with `ModuleName.call`.

3. **Documentation**

   Every new ufunc must have a **plain-text comment block** containing:

   - Human Name
   - Description
   - Type (Unary/Binary)
   - Example usage

4. **Testing**

   - One RSpec file per ufunc under `spec/numruby/ufunc`.
   - Tests should cover:
     - Correct calculation for representative inputs.
     - Edge cases (zero, negatives, large values).
     - Correct registration in `Registry`.

5. **Code Style**

   - Follow standard Ruby conventions.
   - Use `Numo::NMath` and `Numo::NArray` where possible.
   - Keep files small: one ufunc per file.

6. **Incremental Development**

   - Develop ufuncs one at a time.
   - Test each addition before moving to the next.

7. **Collaboration**

   - Pull requests should include:
     - Updated documentation comment block
     - Corresponding spec file
     - Registry registration
     - Top-level NumRuby injection
