
#writing a bash script to pull the latest mac version of splunk

mv html html.old

wget -O html 'https://www.splunk.com/goto/Download_4_V1'

filename=$(cat html | grep darwin | perl -lne '/splunk\-\d\.\d\.\d\-\w+\-darwin\-64\.tgz/ && print $&')
version=$(echo $filename | sed 's/splunk-//g' | sed 's/-.*//g')

echo " "
echo " "
wget -O $filename 'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86&platform=macos&version='$version'&product=splunk&filename='$filename'&wget=true' -q --show-progress

rm html