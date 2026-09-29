do
	local function notify_build(name, result)
		if result.code == 0 then
			vim.notify(("build succeeded for %s"):format(name), vim.log.levels.INFO)

			return
		end

		local stderr = result.stderr or ""
		local stdout = result.stdout or ""

		local output =
			(stderr ~= "" and stderr) or
			(stdout ~= "" and stdout) or
			"No output from build command."

		vim.notify(("Build failed for %s:\n%s"):format(name, output), vim.log.levels.ERROR)
	end

	local function run_build(name, cmd, cwd)
		vim.system(cmd, { cwd = cwd }, function(result)
			vim.schedule(notify_build(name, result))
		end)
	end

	local pack_change_handlers = {}

	pack_change_handlers["telescope-fzf-native.nvim"] = function(ev)
		run_build(ev.data.spec.name, { "make" }, ev.data.path)
	end

	pack_change_handlers["LuaSnip"] = function(ev)
		if vim.fn.has("win32") ~= 1 and vim.fn.executable("make") == 1 then
			run_build(ev.spec.name, { "make", "install_jsregexp" }, ev.data.path)
		end
	end

	pack_change_handlers["nvim-treesitter"] = function(ev)
		if not ev.data.active then
			vim.cmd.packadd "nvim-treesitter"
		end

		vim.cmd "TSUpdate"
	end

	vim.api.nvim_create_autocmd("PackChanged", {
		callback = function(ev)
			local name = ev.data.spec.name
			local kind = ev.data.kind
			local handler = pack_change_handers[name]

			if kind ~= "install" and kind ~= "update" then return end
			if handler then hander(ev) end
		end
	})
end
