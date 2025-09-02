return {
  {
    "mason-org/mason.nvim",
      opts = {
	      registries = {
		      "github:mason-org/mason-registry",
		      "github:Crashdummyy/mason-registry",
	      },
       ui = {
         icons = {
         package_installed = "✓",
         package_pending = "➜",
         package_uninstalled = "✗"
           }
       },
      }
  },
    {
      "mason-org/mason-lspconfig.nvim" ,
      dependencies = {
        "mason-org/mason.nvim",
    },
    opts = {
        automatic_enable = true
    }
  }
}
