return {
    "fredrikaverpil/godoc.nvim",
    version = "*",
    build = "go install github.com/lotusirous/gostdsym/stdsym@latest",
    cmd = { "GoDoc" },
    opts = {},
}
