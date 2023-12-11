from common import *

us='''
* Simple operational US 3

   As a:  Reader
 I want:  To leave comments under another comment
So That:  I can discuss with other users
'''

print(us)

def reply_to_comment(p_comID, p_content,p_reply_to_comID,p_commenter_userID, p_comID_again):
    tmpl =  f'''
INSERT INTO Comments(comID, content,reply_to_comID,commenter_userID)
VALUES(%s,%s,%s,%s);

SELECT comID, content,reply_to_comID,commenter_userID
  FROM Comments
 WHERE comID = %s
'''
    cmd = cur.mogrify(tmpl, (p_comID, p_content,p_reply_to_comID,p_commenter_userID,p_comID_again, ))
    print_cmd(cmd)
    cur.execute(cmd)

    rows = cur.fetchall()
    pp(rows)

content = "Glad to hear that my advice does work."
comID,reply_to_comID,commenter_userID = 12,9,23
reply_to_comment(comID, content, reply_to_comID, commenter_userID, comID)    
