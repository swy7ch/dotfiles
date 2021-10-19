-- Author       : swytch
-- Created      : Monday Oct. 04, 2021 16:09:13 CET
-- License      : GPLv3
-- Description  : tex fietype config


--  Caps
utils.map("i", "AA", "À")
utils.map("i", "CC", "Ç")
utils.map("i", "EE", "É")

-- Unbreakable spaces
utils.map("i", "<Space>etc", "\\,etc.")
utils.map("i", "<Space>:", "\\,:")

-- Centered point
utils.map("i", ";.", "\\textperiodcentered")
-- Italics
utils.map("i", "II", "\\textit{}<Esc>i")
-- Bold
utils.map("i", "BB", "\\textbf{}<Esc>i")
-- Bold + Italics
utils.map("i", "BI", "\\textit{\\textbf{}}<Esc>hi")
-- Smallcaps
utils.map("i", "SC", "\\fsc{}<Esc>i")
