# EconFunctions

[![Project Status: WIP - Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)
[![Build Status](https://travis-ci.org/tpapp/EconFunctions.jl.svg?branch=master)](https://travis-ci.org/tpapp/EconFunctions.jl)
[![Coverage Status](https://coveralls.io/repos/tpapp/EconFunctions.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/tpapp/EconFunctions.jl?branch=master)
[![codecov.io](http://codecov.io/github/tpapp/EconFunctions.jl/coverage.svg?branch=master)](http://codecov.io/github/tpapp/EconFunctions.jl?branch=master)

Julia implementation for some commonly used functions in Economics. This package aims to provide a simple, well-tested, type-stable collection of functions that works well with automatic differentiation.

## Utility

`crra_u`, `crra_u′`, and `crra_u′_inv` provide the CRRA/isoelastic utility function

``u(c; σ) = (c^(1-σ)-1)/(1-σ)``

its derivative, and the inverse of the derivative, respectively. $log(c)$ is a special case which is obtained when $σ=1$. The parametrication is continuous.

## Quadrature

`quadrature_unitnormal(N)` returns quadrature rule that evaluates an the expected value of a function under the unit normal distribution. The resulting object is callable, just use with a closure or a function.


