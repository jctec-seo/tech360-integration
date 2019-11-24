
import csv
import sys
import subprocess
import re 

argList = sys.argv

def getArgValue(key = ''):
    value = None
    for index, arg in enumerate(argList):
        if arg in ['--{}'.format(key)] and len(argList) > index + 1:
            value = argList[index + 1]
    return value


def isUrl(url = ''):
    regex = re.compile(
        r'^(?:http|ftp)s?://' # http:// or https://
        r'(?:(?:[A-Z0-9](?:[A-Z0-9-]{0,61}[A-Z0-9])?\.)+(?:[A-Z]{2,6}\.?|[A-Z0-9-]{2,}\.?)|' #domain...
        r'localhost|' #localhost...
        r'\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})' # ...or ip
        r'(?::\d+)?' # optional port
        r'(?:/?|[/?]\S+)$', re.IGNORECASE)
    return re.match(regex, url)

title = getArgValue('internalLinkList')
internalLinkList = getArgValue('internalLinkList')
projectDir = getArgValue('projectDir')

print("title: {}".format(title))
print("internalLinkList: {}".format(internalLinkList))
print("projectDir: {}".format(projectDir))

with open(internalLinkList, encoding='ISO-8859-1') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    line_count = 0
    print(csv_reader)
    for row in csv_reader:
        url = row[0]

        if not isUrl(url):
            print('[INFO] {} is not valid url, skip'.format(url))
            continue

        filteredUrl = re.sub('[\W_]+', '', url) 
        print(url)
        print(filteredUrl)
        output=subprocess.check_output(["webshot","--quality=80","--stream-type=jpeg", "--window-size=1080/1920",url, "{}images/{}.jpg".format(projectDir,filteredUrl)])

# webshot --quality=80 --stream-type=jpeg  google.com example.jpeg