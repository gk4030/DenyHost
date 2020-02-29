# DenyHost

## 原理说明

通过监控系统日志文件`/var/log/secure`，来分析是否存在对OpenSSH的暴力破解行为，如果发现暴力破解，则其从系统安全日志分析出来源IP地址，然后通过在`/etc/hosts.deny`文件中加入相应的条目来使TCP Warappers禁止该IP地址的后续连接尝试。

一个IP请求连入，linux的检查策略是先看`/etc/hosts.allow`中是否允许，如果允许直接放行；如果没有，则再看`/etc/hosts.deny`中是否禁止，如果禁止那么就禁止连入。

## 部署

> 前提:root权限

```
# crontab -e
*/1 * * * * sh /yourpath/denyhosts.sh >/dev/null 2>&1
```
