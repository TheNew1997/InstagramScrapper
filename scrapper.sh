#Author: BlueEyedBoy

# on next line XXXXXXX replace with name or hastags etc... from you want download your pictures
wget -O scrapped_web.html "https://www.instagram.com/XXXXXXXXXXX/"

grep -oP 'width":1080},"display_url":"https.*?"' scrapped_web.html | tr -d '"' > all_url.txt

sed -r 's/.{24}//' all_url.txt > HD_url.txt

file="HD_url.txt"
while IFS= read line
do
	wget "$line"
done <"$file"
