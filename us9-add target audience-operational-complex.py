from common import *

us='''
* Simple operational US 9

   As a:  Advertiser
 I want:  to show my ad only to my target audience
So That:  I can utilize the ad efficiently and receive higher returns from it
'''

print(us)
5
def add_target_audience(p_ad_materialID, p_audienceID):
    tmpl =  f'''
INSERT INTO AudienceTargetings(ad_materialID, audienceID)
VALUES (%s, %s)
'''
    cmd = cur.mogrify(tmpl, (p_ad_materialID, p_audienceID,))
    print_cmd(cmd)
    cur.execute(cmd)

add_target_audience(15, 4)    