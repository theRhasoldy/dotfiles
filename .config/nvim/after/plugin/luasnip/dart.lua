local status, snip = pcall(require, "luasnip")
if not status then
	return
end

local snippetname = snip.snippet
local text = snip.text_node
local insert = snip.insert_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt

snip.add_snippets("dart", {
	snippetname(
		"stateful",
		fmt(
			[[
class {1} extends StatefulWidget {{
  const {2}({{Key? key}}) : super(key: key);

  @override
  State<{3}> createState() => _{4}State();
}}

class _{5}State extends State<{6}> {{
  @override
  Widget build(BuildContext context) {{
    return MaterialApp(
			title: "{7}",
			home: {8}
		);
  }}
}}

			]],
			{ insert(1, "name"), rep(1), rep(1), rep(1), rep(1), rep(1), insert(2, "title"), insert(3, "content") }
		)
	),
	snippetname(
		"stateless",
		fmt(
			[[
class {1} extends StatelessWidget {{
  const {2}({{Key? key}}) : super(key: key);

  @override
  Widget build(BuildContext context) {{
    return MaterialApp(
			title: "{3}",
			home: {4}
		);
  }}
}}

			]],
			{ insert(1, "name"), rep(1), insert(2, "title"), insert(3, "content") }
		)
	),
})
