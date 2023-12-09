from common import *

us='''
* Complex analytical US 7

   As a:  Moderator
 I want:  To know the users who are most active under posts with a certain flair
So That:   can gain insights about the popularity and impact that specific users are having to make under each type of post more informed content moderation decisions
'''

print(us)

def analyze_user(p_flairID):
    cols = 'i.done_by_userID COUNT(i.interactionID)'
    tmpl =  f'''
    SELECT {c(cols)}
      FROM Interactions AS i JOIN Posts AS p ON i.postID = p.postID
    WHERE p.flairID = %s
    GROUP BY i.done_by_userID
    ORDER BY count DESC
'''
    cmd = cur.mogrify(tmpl, (p_flairID, ))
    print_cmd(cmd)
    cur.execute(cmd)
    rows = cur.fetchall()
    # pp(rows)
    show_table( rows, cols )

analyze_user(13)    
