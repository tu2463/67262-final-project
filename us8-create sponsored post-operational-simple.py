from common import *

us='''
* Simple operational US 8

   As a:  Moderator
 I want:  To be able to easily create and launch a sponsored post that promotes my product or service to a specific subreddit
So That:  I can reach a wide, specific audience that will be likely to visit my website
'''

print(us)

def create_sponsored_post(p_accountID, p_transactionID,
                          p_IP,p_timestamp,p_title,p_content,
                          p_original_content_tag,p_spoiler_tag,p_NSFW_tag):
    tmpl =  f'''
INSERT INTO AdvertisingMaterials(status,impressions,eCPM,click,CPC,CTR,accountID,transactionID)
VALUES (active, 0, 0, 0, 0, 0, %s, %s)

INSERT INTO Posts(IP,timestamp,title,content,original_content_tag,spoiler_tag,NSFW_tag,subredID)
VALUES (%s %s %s %s %s %s %s %s)

INSERT INTO Campaigns()
'''
    cmd = cur.mogrify(tmpl, (p_accountID, p_transactionID,))
    print_cmd(cmd)
    cur.execute(cmd)


accountID,transactionID = 5, 18

IP,timestamp,title,content = '33.124.14', '2023-10-18 9:30:55', 'XX Association Final Event is coming soon!', 'Join us in front of the square!'
original_content_tag,spoiler_tag,NSFW_tag = True, False, False
subredID = 3

postID, ad_materialID = '', ''
media, headline, destination_url, call_to_action, allow_comments, target_type, locations, daily_budget
create_sponsored_post(accountID,transactionID,
                      IP,timestamp,title,content,
                      original_content_tag,spoiler_tag,NSFW_tag,
                      subredID)    