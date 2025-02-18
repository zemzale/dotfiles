return {
    "mfussenegger/nvim-dap",
    ft = "go",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
    },
    config = function ()
        require("zemzale.dap")
    end
}
