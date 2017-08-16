import common
import edify_generator
import os

def ModifyBegin(edify):
  edify.script[0] = \
  '''ifelse(is_mounted("/system"), unmount("/system"));
ifelse(is_mounted("/data"), unmount("/data"));
ui_print("******************************************");
ui_print("* Flyme 6 For GM 5+ One Team | one-teams.com");
ui_print("*");
ui_print("* Powered By @The Punisher");
ui_print("* Flyme Yukleniyor...");
ui_print("******************************************");\n''' + edify.script[0]

def RemoveOemApps(script):
  script.AppendExtra("mount(\"ext4\", \"EMMC\", \"/dev/block/bootdevice/by-name/oem\", \"/oem\");")
  script.AppendExtra("delete_recursive(\"/oem/app\");")

def FullOTA_InstallEnd(info):
    edify = info.script
    ModifyBegin(edify)	
    script_temp = edify_generator.EdifyGenerator(3, info.script.info)
    RemoveOemApps(edify)
