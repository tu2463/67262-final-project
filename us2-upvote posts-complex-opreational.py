from common import *

us='''
* Complex operational US 2

   As a:  Reader
 I want:  To upvote on posts that I like
So That:  I can show my appreciation to the poster and recommend this post to more users
'''

print(us)

def upvote_posts(p_postID, p_userID):
    tmpl =  f'''
INSERT INTO Interactions(type, postID, done_by_userID)
VALUES('upvote', %s, %s);
'''
    cmd = cur.mogrify(tmpl, (p_postID, p_userID, ))
    print_cmd(cmd)
    cur.execute(cmd)

upvote_posts(6, 1)    