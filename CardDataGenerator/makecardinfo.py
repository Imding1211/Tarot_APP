# -*- coding: utf-8 -*-
"""
Created on Mon Aug  7 14:36:38 2023

@author: user
"""

def readtxt(file_path):
    
    with open(file_path, 'r', encoding='utf-8') as file:
        lines = file.readlines()
    
    lines_list = [line.strip() for line in lines]
    
    return lines_list

#------------------------------------------------------------------------------

def writetxt(file_path, english, chinese, imagename, keyword_up, keyword_re, describe):
    
    with open(file_path, 'w', encoding='utf-8') as file:
        for num in range(78):
            line = 'CardInfo(englishName: "'+english[num]+'", chineseName: "'+chinese[num]+'", imageName: "'+imagename[num]+'", keyWordUpright: "'+keyword_up[num]+'", keyWordReversed: "'+keyword_re[num]+'", describe: "'+describe[num]+'"),'
            file.write(line + '\n')

#------------------------------------------------------------------------------

def writeread(file_path, english, chinese, imagename, keyword_up, keyword_re, describe):
    
    with open(file_path[0], 'w', encoding='utf-8') as file:
        for num in range(0,22):
            file.write("英文名: " + english[num] + '\n')
            file.write("中文名: " + chinese[num] + '\n')
            file.write("圖片名: " + imagename[num] + '\n')
            file.write("正位關鍵字: " + keyword_up[num] + '\n')
            file.write("逆位關鍵字: " + keyword_re[num] + '\n')
            file.write("描述: " + describe[num] + '\n')
            file.write(" " + '\n')
            file.write("------------------------------------------------------------------------------" + '\n')
            file.write(" " + '\n')

    with open(file_path[1], 'w', encoding='utf-8') as file:
        for num in range(22,36):
            file.write("英文名: " + english[num] + '\n')
            file.write("中文名: " + chinese[num] + '\n')
            file.write("圖片名: " + imagename[num] + '\n')
            file.write("正位關鍵字: " + keyword_up[num] + '\n')
            file.write("逆位關鍵字: " + keyword_re[num] + '\n')
            file.write("描述: " + describe[num] + '\n')
            file.write(" " + '\n')
            file.write("------------------------------------------------------------------------------" + '\n')
            file.write(" " + '\n')

    with open(file_path[2], 'w', encoding='utf-8') as file:
        for num in range(36,50):
            file.write("英文名: " + english[num] + '\n')
            file.write("中文名: " + chinese[num] + '\n')
            file.write("圖片名: " + imagename[num] + '\n')
            file.write("正位關鍵字: " + keyword_up[num] + '\n')
            file.write("逆位關鍵字: " + keyword_re[num] + '\n')
            file.write("描述: " + describe[num] + '\n')
            file.write(" " + '\n')
            file.write("------------------------------------------------------------------------------" + '\n')
            file.write(" " + '\n')

    with open(file_path[3], 'w', encoding='utf-8') as file:
        for num in range(50,64):
            file.write("英文名: " + english[num] + '\n')
            file.write("中文名: " + chinese[num] + '\n')
            file.write("圖片名: " + imagename[num] + '\n')
            file.write("正位關鍵字: " + keyword_up[num] + '\n')
            file.write("逆位關鍵字: " + keyword_re[num] + '\n')
            file.write("描述: " + describe[num] + '\n')
            file.write(" " + '\n')
            file.write("------------------------------------------------------------------------------" + '\n')
            file.write(" " + '\n')

    with open(file_path[4], 'w', encoding='utf-8') as file:
        for num in range(64,78):
            file.write("英文名: " + english[num] + '\n')
            file.write("中文名: " + chinese[num] + '\n')
            file.write("圖片名: " + imagename[num] + '\n')
            file.write("正位關鍵字: " + keyword_up[num] + '\n')
            file.write("逆位關鍵字: " + keyword_re[num] + '\n')
            file.write("描述: " + describe[num] + '\n')
            file.write(" " + '\n')
            file.write("------------------------------------------------------------------------------" + '\n')
            file.write(" " + '\n')

#------------------------------------------------------------------------------

EnglishCardName      = readtxt("English_Card_Name.txt")

ChineseCardName      = readtxt("Chinese_Card_Name.txt")

CardImageName        = readtxt("Card_Image_Name.txt")

CardKeyword_upright  = readtxt("Card_Keyword_upright.txt")

CardKeyword_reversed = readtxt("Card_Keyword_reversed.txt")

CardDescribe         = readtxt("Card_Describe.txt")

writetxt("output.txt", EnglishCardName, ChineseCardName, CardImageName, CardKeyword_upright, CardKeyword_reversed, CardDescribe)

writeread(["Major.txt", "Wands.txt", "Cups.txt", "Swords.txt", "Pentacles.txt"], EnglishCardName, ChineseCardName, CardImageName, CardKeyword_upright, CardKeyword_reversed, CardDescribe)