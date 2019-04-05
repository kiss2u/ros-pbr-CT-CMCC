#!/bin/sh

mkdir -p /tmp/pbr
#电信
curl https://bgp.space/chinatelecom.html > /tmp/pbr/ct.txt && sed -i '1,/BEGIN/d' /tmp/pbr/ct.txt && sed -i '/END/,$d' /tmp/pbr/ct.txt && sed -i 's/<br>//g' /tmp/pbr/ct.txt
#联通
curl https://bgp.space/unicom_cnc.html > /tmp/pbr/cnc.txt && sed -i '1,/BEGIN/d' /tmp/pbr/cnc.txt && sed -i '/END/,$d' /tmp/pbr/cnc.txt && sed -i 's/<br>//g' /tmp/pbr/cnc.txt
#移动
curl https://bgp.space/cmcc.html > /tmp/pbr/cmcc.txt && sed -i '1,/BEGIN/d' /tmp/pbr/cmcc.txt && sed -i '/END/,$d' /tmp/pbr/cmcc.txt && sed -i 's/<br>//g' /tmp/pbr/cmcc.txt
#铁通
curl https://bgp.space/crtc.html > /tmp/pbr/crtc.txt && sed -i '1,/BEGIN/d' /tmp/pbr/crtc.txt && sed -i '/END/,$d' /tmp/pbr/crtc.txt && sed -i 's/<br>//g' /tmp/pbr/crtc.txt
#教育网
curl https://bgp.space/cernet.html > /tmp/pbr/cernet.txt && sed -i '1,/BEGIN/d' /tmp/pbr/cernet.txt && sed -i '/END/,$d' /tmp/pbr/cernet.txt && sed -i 's/<br>//g' /tmp/pbr/cernet.txt
#长城宽带/鹏博士
curl https://bgp.space/gwbn.html > /tmp/pbr/gwbn.txt && sed -i '1,/BEGIN/d' /tmp/pbr/gwbn.txt && sed -i '/END/,$d' /tmp/pbr/gwbn.txt && sed -i 's/<br>//g' /tmp/pbr/gwbn.txt
#国内其他
curl https://bgp.space/othernet.html > /tmp/pbr/othernet.txt && sed -i '1,/BEGIN/d' /tmp/pbr/othernet.txt && sed -i '/END/,$d' /tmp/pbr/othernet.txt && sed -i 's/<br>//g' /tmp/pbr/othernet.txt

{
echo "/ip firewall address-list"

nets=`cat /tmp/pbr/ct.txt`
for net in $nets ; do
  echo "add list=dpbr-CT address=$net"
done

nets=`cat /tmp/pbr/cnc.txt`
for net in $nets ; do
  echo "add list=dpbr-CMCC address=$net"
done

nets=`cat /tmp/pbr/cmcc.txt`
for net in $nets ; do
  echo "add list=dpbr-CMCC address=$net"
done

nets=`cat /tmp/pbr/crtc.txt`
for net in $nets ; do
  echo "add list=dpbr-CMCC address=$net"
done

nets=`cat /tmp/pbr/cernet.txt`
for net in $nets ; do
  echo "add list=dpbr-CT address=$net"
done

nets=`cat /tmp/pbr/gwbn.txt`
for net in $nets ; do
  echo "add list=dpbr-CT address=$net"
done

nets=`cat /tmp/pbr/othernet.txt`
for net in $nets ; do
  echo "add list=dpbr-CT address=$net"
done
} > /home/wwwroot/@jacyl4_fr/github/ros-pbr-CT-CMCC/ros-dpbr-CT-CMCC.rsc 

rm -rf /tmp/pbr