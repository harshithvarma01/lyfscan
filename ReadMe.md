lyf — Lightweight Bash TCP Port Scanner

lyf is a small, pure-bash TCP port scanner that uses a worker-pool to scan targets quickly with minimal process churn.
It’s designed to be easy to drop in a repo, install, and run from the command line.

Important: Only scan hosts you own or have explicit permission to test. Unauthorized scanning can be illegal.

Features

Pure Bash (uses /dev/tcp and timeout), no external scanning engine required.

Persistent worker-pool to reduce process churn and increase speed.

Scans a configurable port range (default 1-65535) with configurable timeout and concurrency.

Prints open ports live to the terminal (no output files).

Files in this repo

lyf — main scanner script (make executable: chmod +x lyf)

install.sh — optional installer that copies lyf to /usr/local/bin

.gitattributes — forces LF line endings for shell scripts (recommended)

README.md — this file

Quickstart

Clone the repository, install (optional), and run:

git clone https://github.com/harshithvarma01/lyfscan.git

cd lyfscan

bash install.sh

lyf scan https://example.com


Usage
lyf scan <url-or-host> [-t timeout] [-c concurrency] [-r range] [-h]


Options:

-t timeout — per-connection timeout in seconds (supports fractions). Default: 0.6

-c concurrency — number of persistent worker processes. Default: 400

-r range — port range to scan, format start-end. Default: 1-65535

-h — show help

Examples:

# moderate scan of most common ports
lyf scan https://example.com -t 0.6 -c 400 -r 1-1024

# faster, more aggressive (use with caution)
lyf scan example.com -t 0.4 -c 800 -r 1-65535

Recommended tuning & tips

If you see slow performance, increase concurrency (-c) and/or reduce timeout (-t), but increase gradually.

Check and raise file descriptor limit if you need higher concurrency:

ulimit -n 8192


(May require root or system config changes.)

On WSL/networked environments, very aggressive concurrency may not give expected speedups; try lower values first.

To reduce false negatives, use slightly larger timeout on high-latency links.


Port 80 / other ports seem skipped

Different DNS resolutions (CDN/load balancer) may route to IPs with different services/ports open.

Very short timeouts can cause false negatives; increase -t slightly.

Network devices (IDS/IPS/firewall) may drop or rate-limit scanning traffic.

Security & Legal

This tool is provided for legitimate security testing and educational use. You are responsible for ensuring you have permission to scan targets. The author is not responsible for misuse.
