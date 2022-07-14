using Documenter
using Basic

makedocs(
    sitename = "Basic",
    format = Documenter.HTML(),
    modules = [Basic]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
deploydocs(
    repo = "github.com:orosticaingenieria/Basic.jl.git"
)
