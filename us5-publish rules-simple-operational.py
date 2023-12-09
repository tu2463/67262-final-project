from common import *

us='''
* Simple operational US 5

   As a:  Moderator
 I want:  To publish rules and place them in the subreddit that I’m responsible for
So That:  I can inform and remind the members of this subreddit to follow the rules
'''

print(us)

def publish_rules(p_rules, p_subredID):
    tmpl =  f'''
UPDATE Subreddits
SET rules = %s
WHERE subredID = %s
'''
    cmd = cur.mogrify(tmpl, (p_rules, p_subredID,))
    print_cmd(cmd)
    cur.execute(cmd)

publish_rules("1: No referral links. 2: Post deals with expiration dates. 3: Be aware of potential scams", 4)    