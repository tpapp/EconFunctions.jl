import Compat: ∘                # FIXME remove in v0.6
using ArgCheck
using Parameters

export CrraUtility, crra_u′

"""
CRRA/isoelasticy utility, with risk aversion parameter `σ`.
"""
immutable CrraUtility{T}
    σ::T
end

# Could implement as the composite of a Power and an Affine transformation,
# but then would lose type stability at σ=1.

function (u::CrraUtility)(c)
    @unpack σ = u
    omσ = one(σ) - σ
    omσ == zero(omσ) ? log(c) : (c^omσ - 1)/omσ
end

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
