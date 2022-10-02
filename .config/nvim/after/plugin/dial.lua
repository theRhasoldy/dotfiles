local augend = require("dial.augend")
require("dial.config").augends:register_group({
	default = {
		augend.integer.alias.decimal,
		augend.integer.alias.hex,
		augend.date.alias["%Y/%m/%d"],
		augend.constant.new({
			elements = { "and", "or" },
			word = true, -- if false, "sand" is incremented into "sor", "doctor" into "doctand", etc.
			cyclic = true, -- "or" is incremented into "and".
		}),
		augend.constant.new({
			elements = { "&&", "||" },
			word = false,
			cyclic = true,
		}),
		augend.constant.new({
			elements = { "true", "false" },
			word = true,
			cyclic = true,
		}),
		augend.hexcolor.new({
			case = "lower",
		}),
	},
	visual = {
		augend.integer.alias.decimal,
		augend.integer.alias.hex,
		augend.date.alias["%Y/%m/%d"],
		augend.constant.alias.alpha,
		augend.constant.alias.Alpha,
	},
})
