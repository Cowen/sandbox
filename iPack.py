#!/usr/bin/python

import sys
import zipfile
import urllib
import tarfile

def sanitize(path):
    """
    Parse a line of the XML file containing the file's location, and return the file's full
    pathname.
    
    Super ugly, would refactor it if I ever needed to change it. But I don't, and it works.
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
