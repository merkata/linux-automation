![LOGO](https://www.telenor.me/media/Korporativne%20stranice/Logo/telenor_horizontalni.jpg)

#### Linux Automation
<br>
<span style="color:gray">Linux Automation talk</span>
<br>
<span style="color:gray">for</span>
<br>
<span style="color:gray">TnCO X Academy</span>

---

#### Talk Outline
<br>
<span style="color:gray">Working on the CLI</span>
<br>
<span style="color:gray">Working with VIM</span>
<br>
<span style="color:gray">Working with SSH</span>
<br>
<span style="color:gray">Create and push a script to GitHub</span>

---

<span style="color: #e49436">STEP 1. Working on the CLI</span>

Learn to be fast and productive on the CLI

- for loops
- pipes
- aliases
- moving fast on the command line

---

### CLI - for loops

```
for logfile in `ls *.log` #take each log file
do
gzip -9 $logfile #zip it
scp -p ${logfile}.gz loguser@logserver:/logdir/ && \
rm -f ${logfile}.gz #copy remotely and delete locally
done
```

---

### CLI - pipes

- The UNIX pipe let's you transfer one's output into next's input

```
tail -f /var/log/messages | grep -i "panic" #look continously for PANIC
ps -efw | grep -v UID | sort  #you can chain commands until it starts making sense...
```

---

### CLI - aliases

```
alias rm="rm -i" #make remove interactive
alias l="ls -latr" #long list of files
alias space="du * | sort -rn -k1 | head -3" #top 3 largest files
alias lastdayatwork="cd / && sudo rm -rf *" #don't do this
```

---

### CLI - moving fast

- CTRL-A/CTRL-E move to beginning/end of the line
- CTRL-R to search in command history
- CTRL-P/CTRL-N to cycle back/forth in command history
- CTRL-K to delete the whole line
- ALT-B/ALT-F to move back/forth by word
- ALT-W/ALT-D to delete back/forth by word

---

<span style="color: #e49436">STEP 2. Working with VIM</span>

Be fast and feel confident inside VIM

- VIM modes
- moving around
- editing

---

### VIM - modes

VIM knows <span style="color: #e49436">command, insert, visual, ed</span> modes

- ESC puts you in (default) command mode
- i (and various others) put you in insert mode
- v (V, gv, gV) puts you in visual mode
- : puts you in ed mode

ESC:q! quits VIM (most frequent VIM advise to newcommers)

---

### VIM - moving around

- h/j/k/l for basic movement
- w/W to move by word
- {/} to move by paragraph
- * to move by current word under cursor
- / "slash" and n/N to search and move through found items
- CTRL-o/CTRL-i to move back/forth in jumps

---

### VIM - editing

- o/O opens a new line below/above current line
- a/A appends after cursor/at the end of the line
- S substitutes the whole line
- ct" is change 'til the symbol "
- ci" changes text inside "" (cit changes inside tags)
- CTRL-N in insert mode is completion

---

<span style="color: #e49436">STEP 3. Working with SSH</span>

Connect to remote hosts and execute commands

- connecting to hosts
- the .ssh directory
- connecting to hosts with keys
- sample remote automation - diff

---

### SSH - connecting to hosts

```
ssh \
-l joe #login remotely as user joe \
-p 22 #use port to connect (22 is default) \
myserver #connect to remote host "myserver" \
df #execute the command "df" on remote host and exit
```

```
ssh joe@myserver df
```

---

### SSH - the .ssh directory

.ssh/config

```
Host myserver
User joe
Host *
User root
```

.ssh/authorized_keys
```
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDG0LdQMLa+BS/OczAVs6IP+lsF7KdJ8g99GF3zsPfE1TnLo6rnb0mYiCCwTyNmcP/RnlMztfqIGZMuWYQPWSVBZFEYegU1I2B3F+Oe9pAasEEo/uDCxcziK2U33VtgoXevnuiOOVyH+KrRkGrkqNhrEPmwyc6mqpmwK43/YxFarWzqP3n/Dn4IF7Jhpq7Or8hMxyT8RIgt9HTHLEbBu/kODH1ZE7kdPrLxCJIHiGp+YBfV/7w6Uxd7Hyy65o8o89laKuih31V8Tsayzj1SWL8Hxmva8/Jpe0IBhDyRR0tlR7dgNWpQmTrqmLdNdxWlWtE9EEPIy4kNY0v7hr8/cPTR user@local-machine
```
---

### SSH - connecting to hosts with keys

```
ssh-keygen #generate RSA key for SSH v2 by default
ssh-copy-id myserver #transfer public key to myserver
ssh myserver #will connect you to myserver with a key
```

---

### SSH - sample remote automation - diff

```
diff \ #get the difference between
<(ssh server1 cat /etc/sysconfig/network) \ #remote server1's network file
<(ssh server2 cat /etc/sysconfig/network)   #and server2'2 network file
#and present them on your local machine
```
---

<span style="color: #e49436">STEP 4. Create and push a script to GitHub</span>

Track your code changes and push code to a remote repo

- creating a script locally
- testing the script remotely
- pushing to github

---

### Scripting - local script

```
#!/usr/bin/env bash
#script to automatically collect log files
#from a directory and gzip them

for logfile in `ls *.log`
do
gzip -9 $logfile
done
```
---

### Scripting - remote script

```
#!/usr/bin/env bash
#script to automatically collect log files
#from a directory and gzip them to remote server
#and deletes them afterwards

for logfile in `ls *.log`
do
gzip -9 $logfile \
&& scp -p ${logfile}.gz loguser@logserver:/logdir/ \
&& rm -f ${logfile}.gz
done
```
---

### Scripting - pushing to GitHub

```
mkdir copy-logs #create directory for your script(s)
cd copy-logs && git init . #initialize git repository
vim copy-logs.sh #create your script
git add copy-logs.sh #add it to repository
git commit -am "Initial commit - copy-logs" #commit changes
git remote add origin https://github.com/user/repo.git #add github remote
git push #push local repo to remote one
git pull #pull from remote repository
```

---

### Closing

- Q&A
- Recommendations
- Table soccer?

