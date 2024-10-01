local palette = require('yugen.palette')

local yugen = {}

yugen.normal = {
	a = { fg = palette.color800, bg = palette.color100, gui = 'bold' },
	b = { fg = palette.color100, bg = palette.color600 },
	c = { fg = palette.color400, bg = palette.none },
}

yugen.insert = {
	a = { fg = palette.color800, bg = palette.color100, gui = 'bold' },
	b = { fg = palette.color100, bg = palette.color600 },
}

yugen.visual = {
	a = { fg = palette.color800, bg = palette.color100, gui = 'bold' },
	b = { fg = palette.color100, bg = palette.color600 },
}

yugen.replace = {
	a = { fg = palette.color800, bg = palette.color100, gui = 'bold' },
	b = { fg = palette.color100, bg = palette.color600 },
}

yugen.command = {
	a = { fg = palette.color800, bg = palette.color100, gui = 'bold' },
	b = { fg = palette.color100, bg = palette.color600 },
}

yugen.inactive = {
	a = { fg = palette.blueGray3, bg = palette.background1, gui = 'bold' },
	b = { fg = palette.blueGray3, bg = palette.background1 },
	c = { fg = palette.blueGray3, bg = palette.none },
}

return yugen
