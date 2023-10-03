import csv
from rdflib import Graph

g = Graph()
g.parse("./data/entities.ttl", format="turtle")

with open("./resolved_entities.csv", mode="w", newline="") as csvfile:
    csv_writer = csv.writer(csvfile)
    
    csv_writer.writerow(["Suject", "entity"])

    for subj, _, obj in g:
        if 'purl' in subj and not 'http' in obj :
            csv_writer.writerow([str(subj), str(obj)])

print("Conversion ended. The results are saved in the file ./resolved_entities.csv .")
