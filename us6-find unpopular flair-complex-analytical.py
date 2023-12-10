from common import *

us='''
* Complex analytical US 6

   As a:  Moderator
 I want:  To know which flair is used the least by my subreddit members
So That:  I can know members' interests and delete boring flairs
'''

print(us)

def find_least_flair(p_subredID, p_subredID_again):
    cols = 'f.flairID f.name COUNT(p.postID)'
    tmpl =  f'''
SELECT {c(cols)}
  FROM Posts AS p JOIN Flairs AS f ON p.flairID = f.flairID
 WHERE p.subredID = %s 
 GROUP BY f.flairID, f.name
 HAVING COUNT(p.postID) = (SELECT COUNT(p2.postID)
                             FROM Posts AS p2
                            WHERE p2.subredID = %s
                            GROUP BY p2.flairID
                            ORDER BY COUNT(p2.postID)
                            LIMIT 1)

'''
    cmd = cur.mogrify(tmpl, (p_subredID, p_subredID_again, ))
    print_cmd(cmd)
    cur.execute(cmd)
    rows = cur.fetchall()
    # pp(rows)
    show_table( rows, cols )

subredID = 6
find_least_flair(subredID, subredID)    
