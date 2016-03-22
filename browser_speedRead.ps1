##############################################################################
#
# NAME: 	browser_speedRead.ps1
#
# AUTHOR: 	BRIAN MUSINGUZI
# 
#
# COMMENT:  Powershell Script to Speed-Read through a document displaying 3 words in a browser, the middle word is highlighted red
#
# browser_speedRead:
# 0.1.1 2016-03-18 - initial version
#
##############################################################################

#$browse is the url where the output will be displayed
$browse = "C:\Users\musingb\Desktop\out.htm"
 
$document = Get-Content -Path  "C:\Users\musingb\Desktop\LTE Swap.txt"
 
#.split eliminates spaces creating an index for each word between spaces
$words = $document.split(" ")

Invoke-Item $browse

for($i = 0; $i -lt $words.count-1; $i +=3){
  
$a = $words[$i]
$b = $words[$i + 1]
$c = $words[$i  + 2]

#$to_html variable  is used to create content in the HTML file each time the loop runs

$to_html = @'
<html>
   <head>
      <meta http-equiv="refresh" content="1;URL=C:\Users\musingb\Desktop\out.htm" />
   </head>
   <body>
   <p>My Speed Read:</p>
      <p>
      <h3> {0} <font color="red">{1}</font> {2} <h3>
      </p>
   </body>
</html>
'@ -f $a, $b, $c

 
 $to_html | Out-File $browse
 
#Stopwatch time in seconds between each display
start-sleep -seconds 1 
 
}
 
 
