arrayyy = ['malakoff', 'Bourg la Reine', 'Antony', 'Chateney-Malabry', 'Chatillon', 'Clamart', 'Fontenay-aux-roses', 'le plessis-robinson', 'antony', 'montrouge', 'sceaux']

keywords = ['poubelles recyclages',
            'poubelles dechets verts',
            'poubelles dechets',
            'jour poubelle',
            'jour poubelles',
            'jour poubelle recyclage',
            'jour poubelle ordure',
            'jour poubelle normal',
            'quand sortir mes poubelle'
           ]

for k in keywords:
  for a in arrayyy:
    print(k+' '+a.lower())
