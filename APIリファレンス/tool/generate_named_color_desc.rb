NAMECOLORS = [
  "AliceBlue",
  "AntiqueWhite",
  "Aqua",
  "Aquamarine",
  "Azure",
  "Beige",
  "Bisque",
  "Black",
  "BlanchedAlmond",
  "Blue",
  "BlueViolet",
  "Brown",
  "Burlywood",
  "CadetBlue",
  "Chartreuse",
  "Chocolate",
  "Coral",
  "CornflowerBlue",
  "Cornsilk",
  "Crimson",
  "Cyan",
  "DarkBlue",
  "DarkCyan",
  "DarkGray",
  "DarkGreen",
  "DarkGrey",
  "DarkKhaki",
  "DarkMagenta",
  "DarkOliveGreen",
  "DarkOrange",
  "DarkOrchid",
  "DarkRed",
  "DarkSalmon",
  "DarkSeaGreen",
  "DarkSlateBlue",
  "DarkSlateGray",
  "DarkSlateGrey",
  "DarkTurquoise",
  "DarkViolet",
  "DeepPink",
  "DeepSkyBlue",
  "DimGray",
  "DimGrey",
  "DodgerBlue",
  "Firebrick",
  "FloralWhite",
  "ForestGreen",
  "Fuchsia",
  "Gainsboro",
  "GhostWhite",
  "Gold",
  "Goldenrod",
  "Gray",
  "Green",
  "GreenYellow",
  "Grey",
  "Honeydew",
  "Hotpink",
  "IndianRed",
  "Indigo",
  "Ivory",
  "Khaki",
  "Lavender",
  "LavenderBlush",
  "LawnGreen",
  "LemonChiffon",
  "LightBlue",
  "LightCoral",
  "LightCyan",
  "LightGoldenrodYellow",
  "LightGray",
  "LightGreen",
  "LightGrey",
  "LightPink",
  "LightSalmon",
  "LightSeaGreen",
  "LightSkyBlue",
  "LightSlateGray",
  "LightSlateGrey",
  "LightSteelBlue",
  "LightYellow",
  "Lime",
  "LimeGreen",
  "Linen",
  "LoghtSlateGrey",
  "Magenta",
  "Maroon",
  "MediumAquamarine",
  "MediumOrchid",
  "MediumPurple",
  "MediumSeaGreen",
  "MediumSlateBlue",
  "MediumSpringGreen",
  "MediumTurquoise",
  "MediumVioletRed",
  "MidnightBlue",
  "MintCream",
  "MistyRose",
  "Moccasin",
  "NavajoWhite",
  "Navy",
  "OldLace",
  "Olive",
  "OliveDrab",
  "Orange",
  "OrangeRed",
  "Orchid",
  "PaleGoldenrod",
  "PaleGreen",
  "PaleTurquoise",
  "PaleVioletred",
  "PapayaWhip",
  "PeachPuff",
  "Peru",
  "Pink",
  "Plum",
  "PowderBlue",
  "Purple",
  "Red",
  "RosyBrown",
  "RoyalBlue",
  "SaddleBrown",
  "Salmon",
  "SandyBrown",
  "SeaGreen",
  "SeaShell",
  "Sienna",
  "Silver",
  "SkyBlue",
  "SlateBlue",
  "SlateGrey",
  "Snow",
  "SpringGreen",
  "SteelBlue",
  "Tan",
  "Teal",
  "Thistle",
  "Tomato",
  "Turquoise",
  "Violet",
  "Wheat",
  "White",
  "WhiteSmoke",
  "Yellow",
  "YellowGreen",
]

TARGET_DIR = "../M_Verse.org/M_Colors/M_NamedColors"

NAMED_COLORS_DESC_TEMPLATE = <<'EOS'
# Color presets from CSS Color Module 3 Extended color keywords

%%_COLORS_%%
EOS

NAMED_COLORS_DESC_LINE_TEMPLATE = "- <code style=\"color: %%_COLOR_%%\">%%_COLOR_%%</code>"

NAMED_COLORS_D_DESC_TEMPLATE = <<'EOS'
# この名前を指定子たときの色は、 <code style="color: %%_COLOR_%%">■</code> です

- 型
  - `color`
EOS

def main
  desc_lines = []

  NAMECOLORS.each{|color|
    desc_lines << NAMED_COLORS_DESC_LINE_TEMPLATE.gsub("%%_COLOR_%%", color)

    d_desc_text = NAMED_COLORS_D_DESC_TEMPLATE.gsub("%%_COLOR_%%", color)
    d_desc_md_path = "#{TARGET_DIR}/D_#{color}/desc.md"

    puts "Write #{d_desc_md_path} ..."

    File.open(d_desc_md_path, "w") { |f| f.write(d_desc_text) }
  }

  desc_text = NAMED_COLORS_DESC_TEMPLATE.gsub("%%_COLORS_%%", desc_lines.join("\n"))
  desc_md_path = "#{TARGET_DIR}/desc.md"

  puts "Write #{desc_md_path} ..."

  File.open(desc_md_path, "w") { |f| f.write(desc_text) }
end

main
