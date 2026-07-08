return {
  "keaising/im-select.nvim",
  vscode = true, -- LazyVim이 VS Code 안에서도 이 플러그인을 로드하게 함
  config = function()
    require("im_select").setup({
      default_im_select = "com.apple.keylayout.ABC",
      default_command = "/opt/homebrew/bin/im-select", -- 전체 경로
    })
  end,
}
