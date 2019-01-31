import sys,re

print("\input{preamble}")

headings = ["chapter", "section", "subsection", "subsubsection", "paragraph", "subparagraph"]
defs = open("defs.tex","w")
for line in sys.stdin:
    mobj = re.search(r"#\+LATEX_HEADER: (.*)", line)
    if mobj:
        defs.write(mobj.group(1) + "\n")
    if line[0] == "#": continue
    mobj = re.search("^(\*+)", line)
    if mobj:
        n = len(mobj.group(1))
        title = line[n:].strip()
        if n > len(headings) : n = len(headings) # print("too deep:", line)
        print("\\" + headings[n-1] + "{" + title + "}")
    else:
        print(line.strip())


print("\input{postamble}")    
defs.close()
