### A Pluto.jl notebook ###
# v0.14.3

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

# ╔═╡ 2d89ea8d-697c-4278-b467-d5ed7e123dd7
using Plots, Latexify, LaTeXStrings, PlutoUI

# ╔═╡ 751e5150-a132-11eb-2a66-5d81e11face8
md""" # Mínimos quadrados e ortogonalidade

Vamos ilustrar o processo algébrico da aproximação por mínimos quadrados """

# ╔═╡ 6c41c486-376e-42b1-9d0f-89178e1020a2
md" Primeiro vamos construir os vetores de dados, vamos dividir o intervalo $[0,10]$ em $n$ partes "

# ╔═╡ 3fc129c6-b277-4af5-b114-1b33a9f6ebcf
md" n = $(@bind n Slider(1:100, default=10, show_value=true))"

# ╔═╡ ec6d7196-ef3a-4c6b-a673-127c22a44aeb
x=range(0,10,step=10/n)

# ╔═╡ 0e86ddce-1b8c-4158-9713-9bc209089091
y=(10*(0.5 .- rand(n+1))) + 2*x + ones(n+1) + x.^2

# ╔═╡ d1982bed-31dc-4cbc-a11b-8bafa9295c9c


# ╔═╡ 34ed10fa-7241-475e-9611-402931dd3784
scatter(x,y, label=false)

# ╔═╡ b2e7caf3-3e6d-4fe7-a063-5820e86de6e6
md""" Agora quero saber qual é a melhor reta $y=ax+b$ que melhor se ajusta à essa massa de dados que minimiza $\sum_{i=0}^n (ax_i-b -y_i)^2= \| A\begin{bmatrix} a \\ b \end{bmatrix} - y\|^2$.

Pela teoria que acabamos de ver:
$\begin{bmatrix} a \\ b \end{bmatrix} = (A^tA)^{-1}A^ty$

"""

# ╔═╡ ce16bd9e-0753-43bd-af54-c2494b09eb46


# ╔═╡ 50886dfa-68a6-4c2a-8583-f5e6240c7364
begin
	um=ones(n+1);
	A=[x um];
	latexstring(latexify(A))
end
	

# ╔═╡ c5570f33-d189-43e2-b1af-2e892067e9d3
md"""
```math
A^tA 
=  
``` $(latexstring(latexify(A'*A)))
"""

# ╔═╡ 6566ec1b-b9b8-4210-8e43-efa816db54cc
md"""
```math 
A^ty
=  
``` $(latexstring(latexify(A'*y)))
"""

# ╔═╡ 42230d2b-cc08-414d-bf0f-610344cd4890
md""" ```math 
\begin{bmatrix} a \\ b \end{bmatrix} = 
``` $(latexstring(latexify(inv(A'*A)*(A'*y))))
"""

# ╔═╡ bd08d6d3-726d-47c5-aab4-d4a86606e99d
begin
	m=inv(A'*A)*(A'*y);
	r= m[1]*x+ m[2]*um;
end

# ╔═╡ 9b683dd1-cc8f-4129-ad44-2f94817e632e
begin
	plot(x,r,label=false)
	scatter!(x,y,label=false)
end

# ╔═╡ 82eb86ba-47aa-43bd-8b9f-7a42e0f944bf
md"""

 **y** = $(m[1])**x** + $(m[2])

é a equação da reta que melhor se ajusta aos dados
"""

# ╔═╡ 2a1ef996-4516-4fbc-8b6a-8b5fdc12f0ba
md" Para o ajuste de uma parábola: "

# ╔═╡ 30a7bba5-9105-4564-8f61-0ff49c21801e
x2=x.^2

# ╔═╡ 48382d7f-a66e-43a2-8cee-3ba1f79d2690
begin 
	A2 =[x2 x um]
	N=A2'*A2
	p=inv(N)*A2'*y
	q=p[1]*x2 + p[2]*x+p[3]*um
end

# ╔═╡ 41271278-dc7f-42ee-a565-eb48afdf3dda
begin
	plot(x,q,label=false)
	plot!(x,r,label=false)
	scatter!(x,y,label=false)
end

# ╔═╡ Cell order:
# ╟─751e5150-a132-11eb-2a66-5d81e11face8
# ╟─2d89ea8d-697c-4278-b467-d5ed7e123dd7
# ╟─6c41c486-376e-42b1-9d0f-89178e1020a2
# ╟─3fc129c6-b277-4af5-b114-1b33a9f6ebcf
# ╟─ec6d7196-ef3a-4c6b-a673-127c22a44aeb
# ╟─0e86ddce-1b8c-4158-9713-9bc209089091
# ╟─d1982bed-31dc-4cbc-a11b-8bafa9295c9c
# ╟─34ed10fa-7241-475e-9611-402931dd3784
# ╟─b2e7caf3-3e6d-4fe7-a063-5820e86de6e6
# ╠═ce16bd9e-0753-43bd-af54-c2494b09eb46
# ╟─50886dfa-68a6-4c2a-8583-f5e6240c7364
# ╟─c5570f33-d189-43e2-b1af-2e892067e9d3
# ╟─6566ec1b-b9b8-4210-8e43-efa816db54cc
# ╟─42230d2b-cc08-414d-bf0f-610344cd4890
# ╟─bd08d6d3-726d-47c5-aab4-d4a86606e99d
# ╟─9b683dd1-cc8f-4129-ad44-2f94817e632e
# ╟─82eb86ba-47aa-43bd-8b9f-7a42e0f944bf
# ╟─2a1ef996-4516-4fbc-8b6a-8b5fdc12f0ba
# ╟─30a7bba5-9105-4564-8f61-0ff49c21801e
# ╟─48382d7f-a66e-43a2-8cee-3ba1f79d2690
# ╟─41271278-dc7f-42ee-a565-eb48afdf3dda
