from common import *

us='''
* Complex operational US 4

   As a:  Reader
 I want:  To view the latest posts in a subreddit that I’m interested in
So That:  I can engage in the most recent information and follow the trend
'''

print(us)

def view_posts(p_subredID):
    # cols = 'p.postID p.timestamp p.title p.content p.original_content_tag p.spoiler_tag p.NSFW_tag p.poster_userID p.flairID'
    cols = 'p.timestamp p.title p.content p.original_content_tag p.spoiler_tag p.NSFW_tag p.poster_userID p.flairID'
    tmpl =  f'''
    SELECT {c(cols)} AS popularity
      FROM Posts AS p
     WHERE p.subredID = %s
     ORDER BY p.timestamp DESC
'''
    cmd = cur.mogrify(tmpl, (p_subredID, ))
    print_cmd(cmd)
    cur.execute(cmd)
    rows = cur.fetchall()
    # pp(rows)
    show_table( rows, 'time title content original_content_tag spoiler_tag NSFW_tag poster_userID flairID' )
    # show_table( rows, cols )

view_posts(6)    
