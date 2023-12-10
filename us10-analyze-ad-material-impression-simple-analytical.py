from common import *

us='''
* Simple analytical US 10

   As a:  Advertiser
 I want:  To access the average impression for my active ad materials
So That:  I can evaluate and possibly refine my advertising strategy, optimize audience targeting, and ultimately achieve a better return on marketing efforts
'''

print(us) 


def analyze_ad_material_impression():
    tmpl =  f'''
    SELECT AVG(impressions)
      FROM AdvertisingMaterials
    WHERE status = 'active'
'''
    cmd = cur.mogrify(tmpl, ( ))
    print_cmd(cmd)
    cur.execute(cmd)
    rows = cur.fetchall()
    show_table( rows, "avg_impression" )

analyze_ad_material_impression()    
