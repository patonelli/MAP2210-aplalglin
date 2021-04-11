### A Pluto.jl notebook ###
# v0.14.1

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ d2ff2918-657b-452d-84d7-c26aee730c8c
using PlutoUI, Plots, LaTeXStrings, Latexify

# ╔═╡ df54c070-9a40-11eb-3ff7-c782f6937b66
md""" 
### Polinômios de Bernstein 

Um exemplo usando os polinômios de bernstein

"""

# ╔═╡ f2819f6f-80fa-4bfc-a911-cc45160079cc
begin
	B0(t) =(1-t)^2
	B1(t) = 2(1-t)t
	B2(t) = t^2
end

# ╔═╡ 0bc5ad31-900f-4116-b1a2-e9f46b4e3615
A=[0,0];

# ╔═╡ 99460aa9-d7e5-4a3a-8f88-6c6298b8277d
@bind x1 Slider(0:5; default = 0, show_value=true )

# ╔═╡ 1d3b3ce0-b629-4307-a400-5efed3b529aa
@bind y1 Slider(0:5; default = 1, show_value=true )

# ╔═╡ fb369ea9-90ea-43b2-9d13-b52f72f98557
B=[x1,y1]

# ╔═╡ 13b439a5-8cf6-415a-af86-0fefaad292d9
md" Agora o ponto de controle"

# ╔═╡ 7ddb0fa7-19c7-47f8-af6e-eeac257f2051
md"""
Xc= $(@bind xc Slider(0:5; default = 1, show_value=true ))

Yc= $(@bind yc Slider(0:5; default = 1, show_value=true ))
"""

# ╔═╡ 66a4c751-7fc6-4c1e-8384-d5621e8d99b2
C =[xc,yc]

# ╔═╡ dc41d708-5404-4059-9f18-c5caebeec10a
Γ1(t)= B0(t)*A[1] + B1(t)*C[1] +B2(t)*B[1]

# ╔═╡ cc2b7839-06a3-47a7-98a3-b1f7ed2f6911
Γ2(t) = B0(t)*A[2] + B1(t)*C[2] +B2(t)*B[2]

# ╔═╡ 274c84f7-36a8-4269-b269-8d93d04da8cb
t=range(0,1,length=101)

# ╔═╡ 9e00cca8-1e8b-4ce6-9894-d35377581f4e
x=[Γ1(s) for s in t]

# ╔═╡ 98af52fe-46c3-462c-90f7-d1d0ce875fad
y=[Γ2(s) for s in t]

# ╔═╡ 613e494f-5849-4904-bf5d-0802e55f93f4
plot(x,y, aspect_ratio=:equal)

# ╔═╡ Cell order:
# ╟─df54c070-9a40-11eb-3ff7-c782f6937b66
# ╟─d2ff2918-657b-452d-84d7-c26aee730c8c
# ╟─f2819f6f-80fa-4bfc-a911-cc45160079cc
# ╠═0bc5ad31-900f-4116-b1a2-e9f46b4e3615
# ╟─99460aa9-d7e5-4a3a-8f88-6c6298b8277d
# ╟─1d3b3ce0-b629-4307-a400-5efed3b529aa
# ╠═fb369ea9-90ea-43b2-9d13-b52f72f98557
# ╟─13b439a5-8cf6-415a-af86-0fefaad292d9
# ╟─7ddb0fa7-19c7-47f8-af6e-eeac257f2051
# ╠═66a4c751-7fc6-4c1e-8384-d5621e8d99b2
# ╠═dc41d708-5404-4059-9f18-c5caebeec10a
# ╠═cc2b7839-06a3-47a7-98a3-b1f7ed2f6911
# ╠═274c84f7-36a8-4269-b269-8d93d04da8cb
# ╠═9e00cca8-1e8b-4ce6-9894-d35377581f4e
# ╠═98af52fe-46c3-462c-90f7-d1d0ce875fad
# ╠═613e494f-5849-4904-bf5d-0802e55f93f4
