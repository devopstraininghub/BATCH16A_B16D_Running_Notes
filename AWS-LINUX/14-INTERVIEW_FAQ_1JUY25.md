#### 1. How to find files in Linux?


find /path -name "filename"
Examples:

By name: find . -name "*.log"
By size: find / -size +100M
Recently modified: find /var/log -mtime -1

#### 2. Which Linux distro did you use in your project?

Mostly Amazon Linux 2, Ubuntu, or CentOS depending on the cloud provider and application needs.

#### 3.: How can you set up password-less authentication in Linux using SSH?

1.Generate SSH key
    ssh-keygen
    
2.Copy public key to remote server:
    ssh-copy-id user@remote-server
    
3. Now you can SSH without a password:
    ssh user@remote-server

#### 4. What is the command to check memory in Linux?
free -h

#### 5. What is the command to check file size in Linux?
du -sh filename

#### 6. How can you search for a word in Linux?
grep 'word' filename
To search recursively in all files: grep -r 'word' /path/to/directory

#### 7. How do you troubleshoot if an application is running slow on Linux?
Check CPU/memory usage: top, htop, vmstat
Check disk I/O: iostat, iotop, df -h
Check network issues: netstat, ping, traceroute
Check logs: /var/log/syslog, application-specific logs
Check processes: ps aux --sort=-%mem

#### 8: Which command is used in Linux to check disk usage?

df -h           Shows disk usage in human-readable format

du -sh *        Shows folder sizes in the current directory

#### 9: How can you delete the contents of a file in Linux without deleting the file itself?

> filename           Truncates the file

: > filename         Same as above

truncate -s 0 filename  # Explicitly sets file size to 0

#### 10. How can you modify permissions in Linux?

Use chmod:
chmod 755 file.sh
Use chown to change ownership:
 chown user:group file

#### 11. What is crontab, and what are allow/deny files?

•	crontab schedules jobs.

•	/etc/cron.allow – only users in this file can use crontab.

•	/etc/cron.deny – users listed here cannot use crontab.

#### 12. How can you kill a process in Linux?

kill <PID>
kill -9 <PID>       #### force kill

#### 13. How can you check CPU utilization?

Use:
top
htop
mpstat

#### 14. How can you check if a port is open and listening?

netstat -tuln | grep 80
ss -tuln | grep 80

#### 15. How can you check if the network is working using traceroute?

traceroute google.com

It shows the path and delays to the destination.

#### 16. How can you capture last 20 lines of a file?

tail -n 20 filename.log

#### 17: Have you ever come across a situation where a process in Linux is automatically killed?

Yes, this typically happens when the system runs out of memory. The OOM Killer (Out Of Memory Killer) in Linux terminates processes to free up RAM. You can check this using:
dmesg | grep -i "killed process"

#### 18: How can you create user groups in Linux?

#### Create a group
sudo groupadd devteam

#### Add user to group
sudo usermod -aG devteam username

#### Verify
groups username

#### 19 List top 10 most commonly used linux commands?

ls -l           # Long listing of files

cd /var/log     # Navigate to /var/log directory

pwd             # Show current path

cp file1 file2  # Copy file1 to file2

mv file1 dir/   # Move file1 to directory

rm file1        # Delete file1

cat file1       # Show contents of file1

grep "text" file1  # Search for 'text' in file1

find . -name "*.log"  # Find .log files in current directory

chmod +x script.sh    # Make script executable

#### 20:Slowness is observed due to high CPU utilization. What would you do?

If I see high CPU usage causing slowness, I would:

Check which process is using the most CPU using top or htop.

Restart or fix the process if it's stuck or misbehaving.

Check logs to find errors or unusual activity.

Use monitoring tools like CloudWatch to check CPU trends.

Scale the instance (increase size) or add more instances if needed.

Optimize the application to reduce CPU usage (e.g., caching, better queries).

Sure! Here's how you can frame the interview question and answer in a clear, simple way:


#### 21:You were able to SSH into an EC2 instance earlier, but now it’s failing. What steps will you take to troubleshoot?

If SSH was working before and now it’s failing, I would:

1. Check Security Group:

   * Ensure port `22` is open and my IP is allowed.

2. Check Network ACLs:

   * Make sure NACLs allow inbound and outbound traffic on port `22`.

3. Verify Instance State:

   * Confirm the instance is running and not stopped or terminated.

4. Check Public IP or DNS:

   * Ensure the instance still has a public IP (especially if it's in a public subnet).

5. Validate Key Pair:

   * Make sure I'm using the correct `.pem` file with proper permissions (`chmod 400`).

6. Use EC2 Instance Connect or SSM:

   * Try EC2 Instance Connect or Session Manager (if configured) for deeper inspection.

7. Check CPU/Memory:

   * If CPU is 100%, SSH might hang — check CloudWatch metrics.

8. Review Logs:

   * Check system logs (`/var/log/auth.log`, `/var/log/secure`) using EC2 Connect or attaching the volume to another instance.

#### 22 Find and list log files older than seven days in /var/log directory?

Command:

```bash
find /var/log -type f -name "*.log" -mtime +7 -print
```
 Breakdown:

* `find /var/log` – Start searching in `/var/log`.
* `-type f` – Only include regular files.
* `-name "*.log"` – Limit to files ending with `.log`.
* `-mtime +7` – Files modified more than 7 days ago.
* `-print` – Display the list (avoid deleting).


#### 23 Find and remove log files older than seven days in /var/log directory.
 
```bash
find /var/log -type f -name "*.log" -mtime +7 -exec rm -f {} \;
```

#### 25 Find and remove the log files older than 30 days in a folder.

Command:

```bash
find /path/to/folder -type f -name "*.log" -mtime +30 -delete
```

* `/path/to/folder` – The directory to search in.
* `-type f` – Only regular files (not directories).
* `-name "*.log"` – Targets files ending with `.log`.
* `-mtime +30` – Files modified more than 30 days ago.
* `-delete` – Removes the matched files in one go with no external `rm` processes


#### 25 How would you write a Bash script to monitor service health?

Use a loop and tools like `systemctl` or `pgrep` to check if a service is running. If it's stopped, restart it and send an alert (e.g., email or Slack).

example:

```bash
#!/bin/bash
SERVICE="apache2"
if ! systemctl is-active --quiet "$SERVICE"; then
  systemctl restart "$SERVICE"
  echo "$(date): $SERVICE was down, restarted" | mail -s "$SERVICE restarted" mindcircuit@gmail.com 
fi
```



#### 26 How can you find and delete files larger than 100 MB?


```bash
find /target/folder -type f -size +100M -delete
```

* `-type f`: regular files
* `-size +100M`: over 100 MB
* `-delete`: remove them

#### 27 How do you list users who logged in today ?

 check `/var/log/auth.log` or `/var/log/secure`:


#### 28 A website isn't loading—how do you troubleshoot?

Investigate in this order:

1. Is it only me? I will Check in another browser/device or use "Down for Everyone…"
2. Browser/dev tools: Clear cache, disable extensions, check console & network tab errors.
3. Network check: Ping/traceroute DNS resolution, firewall rules, proxy.
4. Server-side: Ensure web server is running (e.g., `systemctl status nginx`), check server logs.
5. App & Database: Look for errors, check DB connectivity.
6. Infrastructure/TLS/CDN: Review SSL cert validity, CDN status, DNS settings.
7. Wider issues: Investigate deployment changes or scaling problems.

#### 29 Using `sed`, how do you delete the first and last line of a file?


```bash
sed -i '1d;$d' filename
```

* `1d` removes first line
* `$d` removes last line
