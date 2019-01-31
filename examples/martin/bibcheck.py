import bibtexparser
from bibtexparser.bwriter import BibTexWriter
from bibtexparser.bibdatabase import BibDatabase

import re

#def myparse(s):
    

master = {}
for fname in open("sourcedirs.org"):

    with open(fname.strip()) as bibtex_file:
        bibtex_str = bibtex_file.read()

        bib_database = bibtexparser.loads(bibtex_str)
        for entry in bib_database.entries:
            if 'ID' in entry:
                if entry['ID'] == 'hmp' : print(entry)
                if entry['ID'] in master:
                    if master[entry['ID']] != entry and 'title' in entry:
                        if master[entry['ID']]['title'] != entry['title']:
                            print("******** CONFLICT *********")
                            print(entry)
                            print("---------------------------")
                            print(master[entry['ID']])
                else:
                    master[entry['ID']] = entry
                


m = open("mugglimerged.bib", "w")
writer = BibTexWriter()
db = BibDatabase()
db.entries = master.values()

m.write(writer.write(db))

#m.write(bibtexparser.dumps(master.values()))
m.close()

