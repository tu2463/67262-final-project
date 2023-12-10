from common import *
import time

us='''
* Simple operational US 8

   As a:  Advertiser
 I want:  To be able to easily create and launch a sponsored post that promotes my product or service
So That:  I can reach a wide audience that will be likely to visit my website
'''

print(us)

def create_sponsored_post(p_accountID, p_transactionID,
                          p_IP,p_timestamp,p_title,p_content,
                          p_original_content_tag,p_spoiler_tag,p_NSFW_tag,p_subredID,
                          p_postID, p_ad_materialID,
                          p_destination_url, p_call_to_action, p_allow_comments,
                          p_target_type, p_locations, p_daily_budget):
    tmpl =  f'''
INSERT INTO AdvertisingMaterials(status,impressions,eCPM,click,CPC,CTR,accountID,transactionID)
VALUES (active, 0, 0, 0, 0, 0, %s, %s);

INSERT INTO Posts(IP,timestamp,title,content,original_content_tag,spoiler_tag,NSFW_tag,subredID)
VALUES (%s %s %s %s %s %s %s %s);

INSERT INTO Campaigns(postID, ad_materialID,
                      destination_url, call_to_action, allow_comments,
                      target_type, locations, daily_budget)
VALUES (%s %s %s %s %s %s %s %s)
'''
    cmd = cur.mogrify(tmpl, (p_accountID, p_transactionID,
                          p_IP,p_timestamp,p_title,p_content,
                          p_original_content_tag,p_spoiler_tag,p_NSFW_tag,p_subredID,
                          p_postID, p_ad_materialID,
                          p_destination_url, p_call_to_action, p_allow_comments,
                          p_target_type, p_locations, p_daily_budget,))
    print_cmd(cmd)
    cur.execute(cmd)

# adv materials attributes
accountID,transactionID = 5, 18

# post attributes 
# how to create a timestamp with correct syntax?
IP,timestamp,title,content = '33.124.14', time.time(), 'XX Association Final Event is coming soon!', 'Join us in front of the square!'
original_content_tag,spoiler_tag,NSFW_tag, subredID= True, False, False, 3

# campaign attributes
postID, ad_materialID = 22, 18 # these are hardcoded. how can i get these newly added FK when they are serialzied?
destination_url, call_to_action, allow_comments = "xxassociation.com", "Sign up", True 
target_type, locations, daily_budget = "Broad", "Virginia", 50.00

create_sponsored_post(accountID,transactionID,
                      IP,timestamp,title,content,
                      original_content_tag,spoiler_tag,NSFW_tag,subredID,
                      postID, ad_materialID,
                      destination_url, call_to_action, allow_comments,
                      target_type, locations, daily_budget)    