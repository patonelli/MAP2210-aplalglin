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

# ╔═╡ 1a7ef810-90ae-11eb-26c8-85338b656c57
begin
	using LinearAlgebra
	using Random
	using Plots
	using PlutoUI
	using Latexify
	using LaTeXStrings
end

# ╔═╡ c15a139e-90ad-11eb-3057-63118a44a0e3
md""" ## Exemplo para a decomposição LU 
Em primeiro lugar vamos achar as Matrizes $L_i$
 e 
$P_i$ 
de cada passo 
"""

# ╔═╡ a34699da-4e7a-4225-b9ad-580f5e665c6a
function mktexarray(x)
	lstr=latexify(x)
	return latexstring(lstr)
end

# ╔═╡ 6df11f00-90ae-11eb-3460-417f49c6b429
lista = range(3,10,step=1)

# ╔═╡ 2c5391f0-918e-11eb-24dd-b337a20b3175
html" Vamos escolher um número entre 3 e 8"

# ╔═╡ afe91750-90ae-11eb-1968-89f3d125f58c
@bind n html"<input type=range min=3 max=8>"

# ╔═╡ 821ec410-918e-11eb-1282-e92c3b2ac310
md" Com n = $(n) podemos gerar uma matriz aleatoriamente"

# ╔═╡ cf4818d0-90ae-11eb-1ce1-4d1d1cd2d604
begin
	M = ceil.(20*rand(n,n)-10*ones(n,n));
	md" M = $(mktexarray(M))"
end

# ╔═╡ e6c7ac0b-5af7-4769-b3cf-a8dd5e2b3170
round(4.54657777,digits=3)


# ╔═╡ 2010e457-d176-41e8-a840-86b3835089eb
rd(x)=round(x,digits=5)

# ╔═╡ dd6a5090-90b3-11eb-382a-8d25382ad3f7
function passo(k, X)
	
	
	l=length(X[1,:])
	P=Diagonal(ones(l))+zeros(l,l)
	L=Diagonal(ones(l))+zeros(l,l)
	 #permutação primeiro
	i=k
	while X[i,k]==0 && i<=l
		i = i+1
	end
	if i>l 
		return [L,P,X]
	end
	a = P[k,:] 
	P[k,:] = P[i,:]
	P[i,:] = a
	# permutação pronta agora L
	A=P*X
	for i in range(k+1,l,step=1)
		L[i,k]=round(-A[i,k]/A[k,k],digits=5)
	end 
	return [rd.(L) , P, rd.(L*P*X)]
end
	
		
		

# ╔═╡ d519180b-7ccd-4984-b553-3cdbabcd0a71
function mostra(n,M)
	k=1;
	X=M;
	while k<= n 
		L,P,A = passo(k,X);
		md" L$k= $(mktexarray(L)) P$k = $(mktexarray(P)$ M$k =$(mktexarray(A))"
		X=A;
		k=k+1;
	end
end
	

# ╔═╡ e0fa1279-e558-451c-a179-d7225a508c61
begin 
	k=1;
	X=M;
	L,P,A = passo(k,X);
	st1=String("L$(k) = $(mktexarray(L))")
	st2=String("A$(k) = $(mktexarray(A))")
	md""" $(st1*st2)"""
end


# ╔═╡ be5d67e7-4f57-47c7-a350-7f3e4ffeeb76
rd(π)

# ╔═╡ 45786167-186a-44b6-a446-0edf3ec3ff8e
rd.([π,√2])

# ╔═╡ 82448aff-174f-406a-a2fd-c8574486597f
rd.(A)

# ╔═╡ Cell order:
# ╟─c15a139e-90ad-11eb-3057-63118a44a0e3
# ╟─a34699da-4e7a-4225-b9ad-580f5e665c6a
# ╟─1a7ef810-90ae-11eb-26c8-85338b656c57
# ╟─6df11f00-90ae-11eb-3460-417f49c6b429
# ╟─2c5391f0-918e-11eb-24dd-b337a20b3175
# ╟─afe91750-90ae-11eb-1968-89f3d125f58c
# ╟─821ec410-918e-11eb-1282-e92c3b2ac310
# ╟─cf4818d0-90ae-11eb-1ce1-4d1d1cd2d604
# ╟─dd6a5090-90b3-11eb-382a-8d25382ad3f7
# ╟─d519180b-7ccd-4984-b553-3cdbabcd0a71
# ╟─e0fa1279-e558-451c-a179-d7225a508c61
# ╟─e6c7ac0b-5af7-4769-b3cf-a8dd5e2b3170
# ╠═2010e457-d176-41e8-a840-86b3835089eb
# ╟─be5d67e7-4f57-47c7-a350-7f3e4ffeeb76
# ╟─45786167-186a-44b6-a446-0edf3ec3ff8e
# ╟─82448aff-174f-406a-a2fd-c8574486597f
