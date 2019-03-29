 [【ROS+OpenWrt合用】双线聚合，真旁路，超绝加速Burst Link【下篇】](https://jacyl4.github.io/post/ros-openwrt-burstlink2/) 文中 自动更新 电信移动 策略路由规则的脚本。

ip段信息取自 https://bgp.space/

仅 ros-pbr-CT-CMCC.rsc 这一个文件是给ros用的。

每日凌晨2点自动更新于此（如有更新）。


ros script 例子


```
/file remove [find name="ros-pbr-CT-CMCC.rsc"]
/ip route rule remove [find table=main]
/ip route rule remove [find table=CT]
/ip route rule remove [find table=CMCC]
/ip route rule remove [find table=CT2]
/ip route rule remove [find table=CT3]
/ip route rule add src-address=10.0.0.14/32 action=lookup table=main
/ip route rule add src-address=10.0.101.2/32 action=lookup table=CT2
/ip route rule add src-address=10.0.102.2/32 action=lookup table=CT3
/ip route rule add src-address=10.0.2.2/32 action=lookup table=CMCC
/tool fetch url="https://raw.githubusercontent.com/jacyl4/ros-pbr-CT-CMCC/master/ros-pbr-CT-CMCC.rsc"
/import ros-pbr-CT-CMCC.rsc
```
