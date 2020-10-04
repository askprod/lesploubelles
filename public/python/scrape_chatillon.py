import json
from chatillon_input import data

def clean_nb(s):
  s = s.replace('n¡', '')
  s = s.replace('n¡ ', '')
  s = s.replace('  ', ' ')
  return s

def clean_trash(s):
  # print(s)
  jours = ['lundi', 'mardi', 'mercredi', 'jeudi', 'vendredi']
  s = clean_nb(s).lower().strip()

  clean_s = []
  for j in jours:
    if j in s:
      if 'soir' in s:
        clean_s.append((j + ' soir').capitalize())
      elif 'matin' in s:
        clean_s.append((j + ' matin').capitalize())
  if '+ pav' in s:
    clean_s.append(('pav' + s.split('+ pav')[1]).capitalize())
  if 'pav' in s and '+' not in s:
    clean_s.append(s.capitalize())

  return clean_s

# To Clean
# i = 1
# for d in data:
#   print(i)
#   if (len(d) < 5):
#     print(json.dumps(d, indent=2))
#   i = i + 1

# print(json.dumps(data, indent=2, ensure_ascii=False))

form_ = {"villes":[
            {
              "nom": "chatillon".capitalize(),
              "secteurs": [
                {
                  "numero": "1",
                  "debarras": "3eme mardi du mois",
                  "rues": []
                },
                {
                  "numero": "2",
                  "debarras": "3eme mercredi lundi du mois",
                  "rues": []
                },
                {
                  "numero": "3",
                  "debarras": "3eme jeudi du mois",
                  "rues": []
                },
                {
                  "numero": "4",
                  "debarras": "3eme vendredi du mois",
                  "rues": []
                }
              ]
            }
          ]
        }

print(form_)
# Json Example:
# "villes": [
#       {
#         "nom": "Bourg-La-Reine",
#         "secteurs": [
#             {
#               "numero": "0",
#               "debarras": "1er Mercredi du Mois",
#               "rues": [
#                 {
#                     "nom": "25 Août 1944 (rue du)",
#                     "dechets": ["Mardi", "Samedi"],
#                     "emballage-et-papier" : ["Jeudi"],
#                     "vegetaux": ["Vendredi"]

#                 },
#                 {
#                     "nom": "8 Mai 1945 du n°6 au 8 (rue du)",
#                     "dechets": ["Lundi", "Mercredi", "Vendredi"],
#                     "emballage-et-papier" : ["Jeudi"],
#                     "vegetaux": ["Vendredi"]

#                 },
#                 {
#                     "nom": "Albert Camus (rue)",
#                     "dechets": ["Lundi", "Mercredi", "Vendredi"],
#                     "emballage-et-papier" : ["Jeudi"],
#                     "vegetaux": ["Vendredi"]
#                 }
#               ]
#             }
#         ]
#       },

all_data = []

for d in data:
  _rue = d[0].strip()
  _dechets = d[1].strip()
  _recyclage = d[2].strip()
  _vegetaux = d[3].strip()
  _secteur = d[5].strip()

  # Reformate Rue
  if "(" in _rue:
    r_rue_0 = _rue[_rue.find("(")+1:_rue.find(")")]
  else:
    r_rue_0 = ""
  r_rue_1 = _rue.replace(("("+_rue[_rue.find("(")+1:_rue.find(")")]+")"), '')

  # Clean Rue data:
  r_rue_1 = r_rue_1.replace('n¡', '')
  r_rue_1 = r_rue_1.replace('n¡ ', '')
  r_rue_1 = r_rue_1.replace('  ', ' ')

  if r_rue_0[-1:] == '\'':
    done_rue = (r_rue_0.strip() + r_rue_1)
  else:
    done_rue = (r_rue_0 + ' ' + r_rue_1).strip()
  # print(done_rue)
  done_rue = done_rue.replace('l’ ', 'l’')

  # Dechets:
  done_dechets = clean_trash(_dechets)
  # print(done_dechets)

  # print(done_recycle)
  done_recycle = clean_trash(_recyclage)
  # print(done_recycle)

  # vegetaux
  done_vegetaux = clean_trash(_vegetaux)
  # print(done_vegetaux)

  done_secteur = _secteur.split("Secteur")[1].strip()

  # only for Malakoff atm
  if done_secteur == "1":
    done_debarras = "2eme Vendredi du Mois"
  elif done_secteur == "2":
    done_debarras = "4eme Lundi du Mois"
  done_debarras = ""

  done_data = [done_rue.lower(), done_secteur, done_debarras, done_dechets, done_recycle, done_vegetaux]
  all_data.append(done_data)

# print(form_['villes'][0]['secteurs'])

for f in form_['villes'][0]['secteurs']:
  for d in all_data:
    # d[done_secteur]
    if f['numero'] == d[1]:
      f['rues'].append({
        'nom': d[0].capitalize(),
        'dechets': d[3],
        "emballage-et-papier": d[4],
        "vegetaux": d[4]
        })

print(json.dumps(form_, indent=2, ensure_ascii=False))
  # print(f)

#   if d[done_secteur] == "1"
# ref_for_json = {
#                 "numero": done_data[done_secteur],
#                 "debarras": done_data[done_debarras],
#                 "rues":
#                }
# ex_f = {
#       "nom": "",
#         "secteurs": [{
#           "numero": "",
#           "debarras": "",
#           "rues": [
#           {
#             "nom": "",
#             "dechets": [],
#             "emballage-et-papier": [],
#             "vegetaux": [],
#           }]
#         }]
#     }

# form_['villes'].append(ex_f)

# print(json.dumps(form_, indent=2, ensure_ascii=False))
