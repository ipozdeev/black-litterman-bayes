FROM quay.io/jupyter/julia-notebook:julia-1.10.2

RUN julia -e 'using Pkg; Pkg.add(["Turing", "Distributions", "MCMCChains", "CSV", "DataFrames"])'