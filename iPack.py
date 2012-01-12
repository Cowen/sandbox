#!/usr/bin/python

import sys
import zipfile
import urllib
import tarfile

def sanitize(path):
    """
    iTunes Library XML files use something that's almost URL-encoding, but they do ;amp a little oddly
    This will parse a line of the XML file containing the file's location, and return the file's full
    pathname
    """
    return urllib.url2pathname('/' + path.lstrip().lstrip("<key>Location</key><string>file://localhost").rstrip().rstrip("</string>")).replace("&#38;", '&')

def pack(lib_xml, out_name):
    """
    Packs the iTunes Library XML file specified by lib_xml into a .tar.gz file named out_name.
    """
    xml = open(lib_xml)
    print 'Parsing ', lib_xml

    mp3s = []
    for line in xml:
        if "<key>Location</key><string>" in line:
            mp3s.append(sanitize(line))
    xml.close()

    tar = tarfile.open(out_name, 'w:gz')
    print 'Compressing',lib_xml, 'to', out_name
    for mp3 in mp3s:
        print mp3.rpartition('/')[2]
        try:
            tar.add(mp3)
        except:
            print 'Exception!'
            tar.close()
    tar.close()

if __name__ == __main__:
    if len(sys.argv) != 3:
        print 'Usage: iPack.py <iTunes_Library_xml_file> <output_filename>'
    else:
        pack(sys.argv[1], sys.argv[2])
