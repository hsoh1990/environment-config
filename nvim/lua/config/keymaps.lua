-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- redo를 U로. u(undo)와 대칭이라 기억 부담 없고 Ctrl-r보다 손 이동 적음.
-- 원래 U(마지막 수정 줄 전체 취소)는 사용 빈도 낮아서 덮어써도 손해 없음.
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })

-- VS Code 안에서만 동작하는 매핑
if vim.g.vscode then
  local vscode = require("vscode")
  local map = vim.keymap.set

  -- ================ 파일/검색 ================

  -- VS Code 탐색기를 열고 포커스까지 이동. 닫혀 있으면 열고,
  -- 다른 뷰(검색 등)가 떠 있으면 탐색기로 전환.
  -- 닫기는 탐색기 포커스 상태에서 space e (keybindings.json 담당).
  map("n", "<leader>e", function()
    vscode.action("workbench.files.action.focusFilesExplorer")
  end, { desc = "탐색기 열고 포커스" })

  -- Cmd+P와 동일. 파일명 일부만 쳐서 바로 열기. 파일 이동의 90%는 이걸로.
  -- <leader><space>와 ff 둘 다 LazyVim 표준 자리라 양쪽에 배정.
  map("n", "<leader><space>", function()
    vscode.action("workbench.action.quickOpen")
  end, { desc = "파일 찾기" })
  map("n", "<leader>ff", function()
    vscode.action("workbench.action.quickOpen")
  end, { desc = "파일 찾기" })

  -- Cmd+Shift+F와 동일. 파일명이 아니라 파일 '내용'으로 검색.
  -- "이 함수 어디서 호출하지?" 할 때. s=search, g=grep.
  map("n", "<leader>sg", function()
    vscode.action("workbench.action.findInFiles")
  end, { desc = "전체 텍스트 검색 (grep)" })

  -- 지금 열려 있는 에디터들만 목록으로 띄워 전환.
  -- 파일 3~4개 오갈 때 Cmd+P보다 빠른 지름길.
  map("n", "<leader>,", function()
    vscode.action("workbench.action.showAllEditors")
  end, { desc = "열린 파일 목록" })

  -- ================ 코드 액션 (LSP) ================

  -- 커서 위치의 자동 수정 목록 (전구 메뉴). import 추가, 미사용 제거 등.
  -- 전구 표시를 꺼놨으니(lightbulb.enabled: off) 이 키가 유일한 진입로.
  map("n", "<leader>ca", function()
    vscode.action("editor.action.quickFix")
  end, { desc = "코드 액션" })

  -- 심볼 리네임. 텍스트 치환(:%s)과 달리 LSP가 참조 관계를 따라가서
  -- 동명이인 변수는 안 건드림. 리팩토링 필수 키.
  map("n", "<leader>cr", function()
    vscode.action("editor.action.rename")
  end, { desc = "이름 변경 (참조 포함)" })

  -- 현재 파일 전체를 포매터로 정리 (들여쓰기, 줄바꿈 일괄).
  map("n", "<leader>cf", function()
    vscode.action("editor.action.formatDocument")
  end, { desc = "포맷팅" })

  -- ================ 진단/문제 ================

  -- 하단에 에러/워닝 전체 목록 패널. 여러 파일에 걸친 문제 한눈에.
  -- LazyVim에서 x는 diagnostics(Trouble) 자리.
  map("n", "<leader>xx", function()
    vscode.action("workbench.actions.view.problems")
  end, { desc = "문제 목록" })

  -- 현재 파일 안에서 에러/워닝 위치로 바로 점프. 목록 없이
  -- 빨간 줄 사이를 순회하며 고치는 흐름. 리뷰할 때 최다 사용 키.
  -- Vim 관례: ]/[ 계열은 "다음/이전 무언가로 점프".
  map("n", "]d", function()
    vscode.action("editor.action.marker.next")
  end, { desc = "다음 진단" })
  map("n", "[d", function()
    vscode.action("editor.action.marker.prev")
  end, { desc = "이전 진단" })

  -- ================ 버퍼(에디터) 관리 ================

  -- 현재 에디터 닫기. Cmd+W와 같지만 손이 홈로우를 안 떠남.
  map("n", "<leader>bd", function()
    vscode.action("workbench.action.closeActiveEditor")
  end, { desc = "현재 파일 닫기" })

  -- 현재 파일만 남기고 전부 닫기. 리뷰하다 파일 10개 열렸을 때 한 방 정리.
  map("n", "<leader>bo", function()
    vscode.action("workbench.action.closeOtherEditors")
  end, { desc = "다른 파일 전부 닫기" })

  -- 열린 에디터 좌우 순회 (브라우저 탭 전환 감각).
  -- 원래 H/L(화면 최상단/최하단 이동)은 빈도 낮아 LazyVim도 버퍼 전환으로 덮어씀.
  -- 화면 상/하단 이동은 gg/G, Ctrl-u/d로 대체.
  map("n", "H", function()
    vscode.action("workbench.action.previousEditor")
  end, { desc = "이전 파일" })
  map("n", "L", function()
    vscode.action("workbench.action.nextEditor")
  end, { desc = "다음 파일" })

  -- ================ 창 분할/이동 ================

  -- 기호 모양 그대로: |는 세로선(좌우 분할), -는 가로선(상하 분할).
  -- 테스트 코드와 구현 나란히 볼 때.
  map("n", "<leader>|", function()
    vscode.action("workbench.action.splitEditorRight")
  end, { desc = "좌우 분할" })
  map("n", "<leader>-", function()
    vscode.action("workbench.action.splitEditorDown")
  end, { desc = "상하 분할" })

  -- 화면상 방향으로 포커스 이동 (에디터/사이드바/터미널 전부).
  -- tmux 패널 이동과 같은 감각. 사이드바->에디터 복귀는 keybindings.json의
  -- Ctrl+l이 담당 (사이드바 포커스 중엔 Neovim이 키를 못 받으므로).
  map("n", "<C-h>", function()
    vscode.action("workbench.action.navigateLeft")
  end, { desc = "왼쪽 창으로" })
  map("n", "<C-j>", function()
    vscode.action("workbench.action.navigateDown")
  end, { desc = "아래 창으로" })
  map("n", "<C-k>", function()
    vscode.action("workbench.action.navigateUp")
  end, { desc = "위 창으로" })
  map("n", "<C-l>", function()
    vscode.action("workbench.action.navigateRight")
  end, { desc = "오른쪽 창으로" })

  -- ================ 터미널/깃 ================

  -- 하단 터미널 토글 (Cmd+J와 동일). 가벼운 명령용 --
  -- 본격 터미널 작업은 tmux에서.
  map("n", "<leader>ft", function()
    vscode.action("workbench.action.terminal.toggleTerminal")
  end, { desc = "터미널 토글" })

  -- 소스 컨트롤 패널. 변경 목록, diff, 스테이징.
  -- 터미널 LazyVim에선 같은 키에 lazygit이 떠서 근육기억 그대로 이어짐.
  map("n", "<leader>gg", function()
    vscode.action("workbench.view.scm")
  end, { desc = "깃(소스 컨트롤)" })
end
