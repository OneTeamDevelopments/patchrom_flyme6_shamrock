#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 59648000 dd702bb9fad996bbb545d2fb7383a8e5454f971e 53911552 cef9c851d31636e459ab02d5c262ecd1a1a59b41
fi
if ! applypatch -c EMMC:/dev/block/bootdevice/by-name/recovery:59648000:dd702bb9fad996bbb545d2fb7383a8e5454f971e; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/bootdevice/by-name/boot:53911552:cef9c851d31636e459ab02d5c262ecd1a1a59b41 EMMC:/dev/block/bootdevice/by-name/recovery dd702bb9fad996bbb545d2fb7383a8e5454f971e 59648000 cef9c851d31636e459ab02d5c262ecd1a1a59b41:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
