# EconFunctions

[![Project Status: WIP - Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)
[![Build Status](https://travis-ci.org/tpapp/EconFunctions.jl.svg?branch=master)](https://travis-ci.org/tpapp/EconFunctions.jl)
[![Coverage Status](https://coveralls.io/repos/tpapp/EconFunctions.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/tpapp/EconFunctions.jl?branch=master)
[![codecov.io](http://codecov.io/github/tpapp/EconFunctions.jl/coverage.svg?branch=master)](http://codecov.io/github/tpapp/EconFunctions.jl?branch=master)

Julia implementation for some commonly used functions in economics. This package aims to provide a simple, well-tested, type-stable collection of functions that works well with automatic differentiation. I wrote it because I was tired of copy-pasting these functions, or rewriting them and making trivial (and not so trivial) mistakes.

## Utility

`crra_u(c,σ)` and `crra_u′(σ)(c)` provide the CRRA/isoelastic utility function
``u(c; σ) = (c^(1-σ)-1)/(1-σ)`` and its derivative. The inverse of the derivative can be obtained with `inv(crra_u′(σ)` (hence the non-standard calling convention). `log(c)` is a special case which is obtained when `σ=1`, using a continuous extension in both arguments.

Both arguments should accept all subtypes of `Real`, including `ForwardDiff.Dual`, which allows the use of these functions with AD.

## Quadrature

`quadrature_standard_normal(N)` returns quadrature rule that evaluates an the expected value of a function under the standard normal distribution ``N(0,1)``. The resulting object is callable, just use with a closure or a function.

Similarly, `quadrature_standard_uniform(N)` evaluates under the uniform distribution on `(0,1)`.


