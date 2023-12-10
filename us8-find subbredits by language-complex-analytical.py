from common import *

us='''
* Complex analytical US 8

   As a:  Advertiser
 I want:  Find the subreddits that have more users who can speak the language my company primarily uses
So That:  I can post ads using the language of my company/product for a better targeted audience
'''

print(us)

def find_subreddits_by_language(p_lang):
    cols = 'j.subredID COUNT(j.userID)'
    tmpl =  f'''
    SELECT {c(cols)}
      FROM SubredditJoinings AS j JOIN RegisteredUsers AS r ON j.userID = r.userID
     WHERE r.display_language = %s
     GROUP BY j.subredID
     ORDER BY count DESC
'''
    cmd = cur.mogrify(tmpl, (p_lang,))
    print_cmd(cmd)
    cur.execute(cmd)
    rows = cur.fetchall()
    # pp(rows)
    show_table( rows, 'j.subredID, COUNT(j.userID)' )

find_subreddits_by_language('spanish')    
