import Compat: ∘                # FIXME remove in v0.6
using ArgCheck
using Parameters

export crra_u, CrraUtility, crra_u′

"""
CRRA/isoelastic utility, with risk aversion parameter `σ`.
"""
@inline function crra_u(c, σ)
    omσ = one(σ) - σ
    omσ == zero(omσ) ? log(c) : (c^omσ - 1)/omσ
end

"""
CRRA/isoelastic utility, with risk aversion parameter `σ`. Returns a
function, whcih can be evaluated at `c`. See also `crra_u`.
"""
immutable CrraUtility{T}
    σ::T
end

(u::CrraUtility)(c) = crra_u(c, u.σ)

# FIXME at σ=1, the continuous extension of the derivative in σ is
# -log(c)^2/2, need to implement this, with tests

"""
Return a transformation for the marginal CRRA/isoelastic utlity, with
risk aversion parameter `σ`. Use `Base.inv` to obtain inverse.
"""
function crra_u′(σ)
    @argcheck σ ≥ 0
    Power(-σ)
end
