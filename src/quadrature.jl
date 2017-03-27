using ContinuousTransformations
using FastGaussQuadrature
using ArgCheck

export Quadrature, quadrature_standard_normal, quadrature_standard_uniform

"""
Univariate numerical quadrature. A lightweight container for the
`nodes` and the `weights`, calculated from some quadrature rule. The
`domain` is provided for information purposes.
"""
immutable Quadrature{TD <: AbstractInterval, T}
    domain::TD
    nodes::Vector{T}
    weights::Vector{T}
    function Quadrature(domain, nodes, weights)
        @argcheck length(nodes) == length(weights)
        new(domain, nodes, weights)
    end
end

function Quadrature{TD, T}(domain::TD, nodes::Vector{T}, weights::Vector{T})
    Quadrature{TD, T}(domain, nodes, weights)
end

ContinuousTransformations.domain(q::Quadrature) = q.domain

Base.length(q::Quadrature) = length(q.nodes)

function Base.show(io::IO, q::Quadrature)
    print(io, "Quadrature of $(length(q)) nodes on $(q.domain)")
end

(q::Quadrature)(f) = dot(f.(q.nodes), q.weights)

"""
Return a quadrature that integrates a function under the standard
normal distribution using `N` nodes.
"""
function quadrature_standard_normal(N::Int)
    nodes, weights = gausshermite(N)
    Quadrature(ℝ, nodes*√2, weights/√π)
end

"""
Return a quadrature that integrates a function on the unit domain
[0,1] under the standard uniform distribution using `N` nodes.
"""
function quadrature_standard_uniform(N::Int)
    nodes, weights = gausslegendre(N)
    Quadrature(𝕀, fma.(nodes, 0.5, 0.5), weights .* 0.5)
end
