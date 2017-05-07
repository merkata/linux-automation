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

- aliases
- for loops
- moving fast on the command line

---

### CLI - aliases

```
alias rm="rm -i" #make remove interactive
alias l="ls -latr" #long list of files
alias space="du * | sort -rn -k1 | head -3" #top 3 largest files
```

---

### CLI - for loops

```
for logfile in `ls *.log` #take each log file
do
gzip -9 $logfile #zip it
scp -p $logfile loguser@logserver:/logdir/ && rm -f $logfile #copy remotely and delete locally
done
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

<span style="color: #e49436">STEP 3. Working with SSH</span>

Connect to remote hosts and execute commands seamlessly

- connecting to hosts
- the .ssh directory
- connecting to hosts with keys

---

<span style="color: #e49436">STEP 4. Create and push a script to GitHub</span>

Track your code changes and push code to a remote repo

- creating a script locally
- testing the script remotely
- pushing to github

---

### Closing

- Q&A
- Recommendations

