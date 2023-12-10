from common import *

us='''
* Simple operational US 9

   As a:  Advertiser
 I want:  To show my ad only to my target audience
So That:  I can utilize the ad efficiently and receive higher returns from it
'''

print(us)
5
def add_target_audience(p_ad_materialID, p_audienceID, p_ad_materialID_again):
    tmpl =  f'''
INSERT INTO AudienceTargetings(ad_materialID, audienceID)
VALUES (%s, %s);

SELECT ad_materialID, audienceID
  FROM AudienceTargetings
 WHERE ad_materialID = %s
'''
    cmd = cur.mogrify(tmpl, (p_ad_materialID, p_audienceID, p_ad_materialID_again, ))
    print_cmd(cmd)
    cur.execute(cmd)
    rows = cur.fetchall()
    pp(rows)

ad_materialID, audienceID = 15, 4
add_target_audience(ad_materialID, audienceID, ad_materialID)    