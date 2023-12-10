from common import *

us='''
* Complex analytical US 6

   As a:  Moderator
 I want:  To know which flair is used the least by my subreddit members
So That:  I can know members' interests and delete boring flairs
'''

print(us)

def find_least_flair(p_subredID):
    cols = 'f.flairID f.name'
    tmpl =  f'''
SELECT {c(cols)}
  FROM Flairs AS f
 WHERE f.flairID = (SELECT flairID
                      FROM Posts
                     WHERE subredID = %s
                     GROUP BY flairID
                     ORDER BY COUNT(postID) DESC
                     LIMIT 1)
'''
    cmd = cur.mogrify(tmpl, (p_subredID, ))
    print_cmd(cmd)
    cur.execute(cmd)
    rows = cur.fetchall()
    # pp(rows)
    show_table( rows, cols )

find_least_flair(6)    
