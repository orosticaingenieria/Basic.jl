using Documenter, Literate
using Basic

lit = joinpath(@__DIR__, "lit")
src = joinpath(@__DIR__, "src")
gen = joinpath(@__DIR__, "src/generated")

for (root, _, files) ∈ walkdir(lit), file ∈ files
    splitext(file)[2] == ".jl" || continue
    ipath = joinpath(root, file)
    opath = splitdir(replace(ipath, lit => gen))[1]
    Literate.markdown(ipath, opath)
    Literate.notebook(ipath, opath; execute = false)
end

makedocs(
    sitename = "Basic",
    format = Documenter.HTML(),
    modules = [Basic],
    pages = [
        "Home" => "index.md",
        "Literate" => joinpath("generated/", "example.md")
    ],
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
deploydocs(
    repo = "github.com:orosticaingenieria/Basic.jl.git"
)
