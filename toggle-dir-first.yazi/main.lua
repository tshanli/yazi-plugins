local opposite = ya.sync(function()
	local is_dir_first = cx.active.pref.sort_dir_first
	return is_dir_first and "no" or "yes"
end)

return {
	entry = function(_, job)
		local opp = opposite()

		local args = {
			["dir-first"] = opp,
		}
		local args_str = ""
		for _, v in ipairs(args) do
			args_str = args_str .. v
		end
		ya.dbg("args: " .. args_str)
		ya.emit("sort", args)
	end,
}
