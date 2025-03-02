import Base: convert
convert(::Type{MyType}, x) = MyType(x)

convert(::Type{T}, x::Number) where {T<:Number} = T(x)::T

convert(::Type{T}, x::T) where {T<:Number} = x

Rational(n::Integer, d::Integer) = Rational(promote(n,d)...)

import Base: promote_rule
promote_rule(::Type{Float64}, ::Type{Float32}) = Float64

import Base: promote_rule
promote_rule(::Type{Rational{T}}, ::Type{S}) where {T<:Integer,S<:Integer} = Rational{promote_type(T,S)}
promote_rule(::Type{Rational{T}}, ::Type{Rational{S}}) where {T<:Integer,S<:Integer} = Rational{promote_type(T,S)}
promote_rule(::Type{Rational{T}}, ::Type{S}) where {T<:Integer,S<:AbstractFloat} = promote_type(T,S)

julia> x = 12 
12

julia> typeof(x)
Int64

julia> xu = convert(UInt8, x)
0x0c

julia> typeof(xu)
UInt8

julia> xf = convert(AbstractFloat, x)
12.0

julia> typeof(x)
Int64

julia> a = Any[1 2 3; 4 5 6]
2×3 Matrix{Any}:
 1  2  3
 4  5  6

julia> convert(Array{Float64}, a)
2×3 Matrix{Float64}:
 1.0  2.0  3.0
 4.0  5.0  6.0

ERROR: UndefVarError: `MyType` not defined in `Main`
Suggestion: check for spelling errors or missing imports.      
Stacktrace:
 [1] top-level scope
   @ c:\Users\Dell\OneDrive\Desktop\Day5\day5.jl:2

ERROR: UndefVarError: `MyType` not defined in `Main`
Suggestion: check for spelling errors or missing imports.      
Stacktrace:
 [1] top-level scope
   @ c:\Users\Dell\OneDrive\Desktop\Day5\day5.jl:2

ERROR: UndefVarError: `MyType` not defined in `Main`
Suggestion: check for spelling errors or missing imports.      
Stacktrace:
 [1] top-level scope
   @ c:\Users\Dell\OneDrive\Desktop\Day5\day5.jl:2

julia> promote(1, 2.5)
(1.0, 2.5)

julia> promote(1, 2.5, 3)
(1.0, 2.5, 3.0)

julia> promote(2, 3//4)
(2//1, 3//4)

julia> promote(1, 2.5, 3, 3//4)
(1.0, 2.5, 3.0, 0.75)

julia> promote(1.5, im)
(1.5 + 0.0im, 0.0 + 1.0im)

julia> promote(1 + 2im, 3//4)
(1//1 + 2//1*im, 3//4 + 0//1*im)

ERROR: UndefVarError: `MyType` not defined in `Main`
Suggestion: check for spelling errors or missing imports.      
Stacktrace:
 [1] top-level scope
   @ c:\Users\Dell\OneDrive\Desktop\Day5\day5.jl:2

julia> x = Rational(Int8(15), Int32(-5))
-3//1

julia> typeof(x)
Rational{Int32}

ERROR: UndefVarError: `MyType` not defined in `Main`
Suggestion: check for spelling errors or missing imports.
Stacktrace:
 [1] top-level scope
   @ c:\Users\Dell\OneDrive\Desktop\Day5\day5.jl:2

julia> promote_type(Int8, Int64)
Int64
