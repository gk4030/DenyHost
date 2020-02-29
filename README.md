# DenyHost
通过监控系统日志文件（/var/log/secure），来分析是否存在对OpenSSH的暴力破解行为，如果发现暴力破解，则其从系统安全日志分析出来源IP地址，然后通过在/etc/hosts.deny文件中加入相应的条目来使TCP Warappers禁止该IP地址的后续连接尝试。
