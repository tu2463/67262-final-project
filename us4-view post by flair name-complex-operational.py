from common import *

us='''
* Complex operational US 4

   As a:  Reader
 I want:  To view the posts in a subreddit that have a certain flair name
So That:  I can view the posts with an topic that I'm most interested in
'''

print(us)

def view_posts_by_flair_name(p_name):
    cols = 'p.timestamp p.title p.content p.original_content_tag p.spoiler_tag p.NSFW_tag p.poster_userID p.flairID'
    tmpl =  f'''
    SELECT {c(cols)}
      FROM Posts AS p JOIN Flairs AS f ON p.flairID = f.flairID
     WHERE f.name = %s
    '''
    cmd = cur.mogrify(tmpl, (p_name, ))
    print_cmd(cmd)
    cur.execute(cmd)
    rows = cur.fetchall()
    # pp(rows)
    show_table( rows, cols )

view_posts_by_flair_name("Bonsai-tastic Post")    
