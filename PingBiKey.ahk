; 屏蔽按键
;
^Space::SoundBeep
+Space::SoundBeep
CapsLock::SoundBeep

^!+d::
    Run, "D:\Program Files\Free Download Manager\fdm.exe"
    Return

;^!+w::
;    Run, "D:\portable\my_daily_wallpaper\My_Daily_Wallpaper.exe"
;    Return

^!+a::
    Run, "D:\Program Files (x86)\AutoIt3\AutoIt3.exe" "E:\mydoc\20180921 中秋 autoit v3\ClickMDWP_ContextMenu v06.au3"
    Return

^!+j::
    Run, D:\portable\NirCmd-64\nircmd.exe cdrom open f:
    Return

^!+f::
    Run, D:\portable\NirCmd-64\nircmd.exe cdrom close f:
    Return

^!o:: 
    Run *RunAs "D:\portable\foobar2000_141\foobar2000.exe"
    Return

^!r::
    Edit
    Return
	
^!+r::
    Reload
    Return

^!b::
    Run, "C:\Program Files (x86)\Nero\Nero 2018\Nero Burning ROM\nero.exe" 
    ;"E:\mydoc\20180607 准备出书的文件"
    Return

^!+b:: 
    Run, "E:\mydoc\20180607 准备出书的文件\00 一轮古月耀天心 万顷碧波鉴真金 剑飞文字精选\00 Latex总括\PyBackup\RunPyBackup.cmd"
    Return

^!+n::
    Run, "E:\mydoc\20180607 准备出书的文件\00_Round_1_Volume_4_Literature\Bin\BackupWholeProjectByBurn.cmd"
    Return

^!+c::
    Run, "D:\portable\clipdiary_portable\clipdiary-portable.exe"
    Return

;^!+d fdm use it

^!+e::
    Run, "E:\mydoc\20180607 准备出书的文件\00_Round_1_Volume_4_Literature\Bin\cleanAndBackupDesktop.cmd"
    Return


; forfiles /P d:\doc /M *.* /S /C "CMD /C if @fsize gtr 4000000000 echo @PATH @FSIZE"
; >icacls "J:\20190106 梅峰备份 v03" /grant EveryOne:(OI)(CI)F /T 
;^+v::
;    Send ^+{,}
;    ; SoundBeep
;    Sleep, 300
;    Send ^+n
;    SoundBeep;
;
;    Return

^+UP::
    SoundSet +10, MASTER
    SoundSet, +10, WAVE
    Return

^+DOWN::
    SoundSet -10, MASTER
    SoundSet, -10,WAVE
    Return

^!+s::
    Run, "D:\Program Files\IrfanView\i_view64.exe" /slideshow="E:\mydoc\19990909 guo photo  v03\allPhotoFiles.txt" /forcefullscreen /reloadonloop
;    Run, "D:\Program Files\IrfanView\i_view64.exe" /slideshow="E:\mydoc\19990909 guo photo  v03\allPhotoFiles.txt"
    Return

^!+l::
    Run, D:\portable\NirCmd-64\nircmd.exe cdrom close f: 
    Return

^!l::
    Run, D:\portable\NirCmd-64\nircmd.exe cdrom open f: 
    Return

^!h::
    Run, "D:\Program Files\PuTTY\putty.exe" -load myunix
    Return

^!+i::
    Run, "C:\Program Files\internet explorer\iexplore.exe"
    Return

^!t::
    ;Run, "E:\totalcmd\TOTALCMD.EXE" /O E:\mydoc  E:\Downloads /T /i=E:\totalcmd\totalcmd.ini /f=Mftp.ini
    Run, "E:\totalcmd\TOTALCMD.EXE" /O  /i=E:\totalcmd\ini\totalcmd.ini /f=E:\totalcmd\ini\Mftp.ini
    Run, "C:\Program Files\Everything\Everything.exe"
    Return

;^r::Send 13799001059@139.com;13348318095@189.cn;evering7@sina.com;evering777@sina.com;evering7@tom.com;evering7@qq.com;13799001059@sohu.com;evering7@gmail.com;evering7@icloud.com;evering99@icloud.com;evering7@hotmail.com

^+r::
    clipboard=13799001059@139.com;13348318095@189.cn;evering7@sina.com;evering777@sina.com;evering7@tom.com;evering7@qq.com;13799001059@sohu.com;evering7@gmail.com;evering7@icloud.com;evering99@icloud.com;evering7@hotmail.com
    Send ^v
    Sleep 500
    Return

^+Insert::  ;work with clipboard: add delimiter and marked text to existing clipboard content
    ClipboardText = %Clipboard%  ;remove formatting
    SendEvent ^c  ;send the Ctrl+C command, must be sent as event so apps get it correctly
    ClipWait
    ClipNew = %Clipboard%
    ;Clipboard = %ClipboardText%||%ClipNew%
    Clipboard = %ClipboardText% ·n ·n %ClipNew%
    ;Clipboard = %ClipboardText% \n %ClipNew%
    ClipboardText =  ;clear the variable
    SplashTextOn 200,20,Clipboard Added,%ClipNew%
    Sleep 1000
    SplashTextOff
Return

^!c::
    Run, "E:\Program Files (x86)\Tencent\WeChat\WeChat.exe"
    Return

^!e::
    Run, "D:\Program Files\Notepad++\notepad++.exe"
    Return

^!f::
    Run, "D:\Program Files\Mozilla Firefox\firefox.exe"
    Return

^!y::
    Run *RunAs "D:\Users\everi\FastCopy\FastCopy.exe"
    Return

^!i::
    ;Run, C:\Users\everi\AppData\Local\Google\Chrome\Application\chrome.exe http://mtgox.com http://kns.cnki.net/kns/brief/result.aspx?dbPrefix=SCDB https://stackoverflow.com/questions/53639659/how-to-unescape-a-urlstring-with-as-escaping-char-in-latex http://navi.cnki.net/knavi/JournalDetail?pcode=CJFD&pykm=SCZG  http://mail.10086.cn
    ;Run, C:\Users\everi\AppData\Local\Google\Chrome\Application\chrome.exe http://mtgox.com http://kns.cnki.net/kns/brief/result.aspx?dbPrefix=SCDB    http://cz.fjkj.gov.cn http://price.btcfans.com/ https://bbs.csdn.net/topics/392555955 
    Run, C:\Users\everi\AppData\Local\Google\Chrome\Application\chrome.exe http://mtgox.com https://www.bitcoinprice.com/  https://www.coindesk.com/price/bitcoin http://kns.cnki.net/kns/brief/result.aspx?dbPrefix=SCDB    http://cz.fjkj.gov.cn http://price.btcfans.com/  https://baike.baidu.com/item/图灵奖  https://en.wikiquote.org/wiki/Marvin_Minsky  https://translate.google.com/?hl=en&tab=TT https://unsplash.com/search/photos/waterfall http://120.35.30.197/fjkj/portalWeb/toIndex http://www.0594.com/  http://blog.sina.com.cn/s/blog_49b588670100lqym.html http://mail.10086.cn http://www.51cto.com/ http://www.5dmail.net/
    Web0 = https://www.baidu.com
    Web1 = http://mtgox.com
    Web2 = http://kns.cnki.net/kns/brief/result.aspx?dbPrefix=SCDB
    Web3 = http://navi.cnki.net/knavi/JournalDetail?pcode=CJFD&pykm=SCZG  
    Web4 = http://cz.fjkj.gov.cn
    Web5 = http://price.btcfans.com/
    Web6 = https://bbs.csdn.net/topics/392555955
    ;MsgBox The value in the variable named Var is   %Web1% %Web2%  %Web4% %Web5%
    ;C:\Users\everi\AppData\Local\Google\Chrome\Application\chrome.exe  %Web0% %Web1% %Web2% %Web3% %Web4%
    Return

;^!+u::
;    Run, "E:\mydoc\20180607 准备出书的文件\00_Round_1_Volume_3_EcoFinance\文章素材\美国财政部长 - 维基百科，自由的百科全书2.pdf"
;    Return

^!u::
     ;Run, "D:\Program Files\Notepad++\notepad++.exe" "E:\mydoc\20180607 准备出书的文件\Book_2_Round_2_Computer\bin_OneQualityPic\StdPic.py"
     ;Run *RunAs "D:\Program Files (x86)\Vim\vim81\gvim.exe" "E:\mydoc\20180607 准备出书的文件\bin_StdPic_Essay_v2\bin\参考：StdPic.py"  ; "E:\mydoc\20180607 准备出书的文件\Book_2_Round_2_Computer\bin_StdPic_Essay\CompEssay_StdPic.tex"
     ;Run *RunAs "D:\Program Files (x86)\Vim\vim81\gvim.exe" "E:\mydoc\20180607 准备出书的文件\bin_StdPic_Essay_v2\bin\CompileSingleTexDocument.py"

     ;Run *RunAs "D:\Program Files (x86)\Vim\vim81\gvim.exe" "E:\mydoc\20180607 准备出书的文件\bin_StdPic_Essay_v2\Sources\CompEssay_StdPic.tex"
     ;Run *RunAs "D:\Program Files (x86)\Vim\vim81\gvim.exe" "E:\mydoc\20180607 准备出书的文件\bin_StdPic_Essay_v2\Sources\参考：StdPic.py"
     ;Run, explorer "E:\mydoc\20180607 准备出书的文件\bin_StdPic_Essay_v2"

    ;Run *RunAs "D:\Program Files (x86)\Vim\vim81\gvim.exe" "E:\mydoc\20180607 准备出书的文件\Book_23_Computer\bin\CompileSourceCode_Book23.py"
    ;Run "D:\Program Files (x86)\Vim\vim81\gvim.exe"  "E:\mydoc\20180607 准备出书的文件\bin_BackupFilesByEmail\BackupFilesByEmail.py"
    ;Run, explorer "E:\mydoc\20180607 准备出书的文件\bin_BackupFilesByEmail"

    Run "D:\Program Files (x86)\Vim\vim81\gvim.exe"  "E:\mydoc\20180607 准备出书的文件\bin AutoInstall 2345浏览器\Install2345.ahk"
    Run "D:\Program Files (x86)\AutoIt3\Au3Info_x64.exe"
    Run, explorer "E:\mydoc\20180607 准备出书的文件\bin AutoInstall 2345浏览器"


    ;Run, explorer  "E:\mydoc\20180607 准备出书的文件\Book_23_Computer\bin"

     ;Run, explorer "E:\mydoc\20180607 准备出书的文件\bin_OneQualityPic"
     ;Run, "D:\portable\clipdiary_portable\clipdiary-portable.exe"
     ;Run, "D:\Users\everi\WinEdt Team\WinEdt 10\WinEdt.exe" -V "E:\mydoc\20180607 准备出书的文件\00_Round_1_Volume_3_EcoFinance\EditSourceCode\00_Vol_03_Finance.tex"
     ;;Run, "E:\mydoc\20180607 准备出书的文件\00_Round_1_Volume_3_EcoFinance\文章素材\美国财政部长 - 维基百科，自由的百科全书2.pdf"
     ;Run, C:\Users\everi\AppData\Local\Google\Chrome\Application\chrome.exe   https://en.wikipedia.org/wiki/United_States_Secretary_of_the_Treasury https://zh.wikipedia.org/wiki/`%E7`%BE`%8E`%E5`%9B`%BD`%E8`%B4`%A2`%E6`%94`%BF`%E9`%83`%A8`%E9`%95`%BF  https://baike.baidu.com/item/`%E7`%BE`%8E`%E5`%9B`%BD`%E8`%B4`%A2`%E6`%94`%BF`%E9`%83`%A8`%E9`%95`%BF
     ;Run, "C:\Program Files (x86)\ExpressVPN\xvpn-ui\ExpressVPN.exe"
     Return

;^!l::
;    Run, D:\portable\FreeAlarmClockPortable\FreeAlarmClock.exe
;    Return

^!k::
    Run, "E:\portable\Long Path Fixer for Windows x64\Long Path Fixer.exe"
    Return


^!n::
    Run, "C:\Program Files\internet explorer\iexplore.exe" http://kjbm6.mof.gov.cn/sskb/indexd.jsp?sheng=23&shi=2304  
    Run, "C:\Program Files\internet explorer\iexplore.exe" https://www.microsoft.com/en-us/software-download/windows10
    Run, "C:\Program Files\internet explorer\iexplore.exe" http://etax.fjtax.gov.cn/xxmh/html/index.html
    Run, "C:\Program Files\internet explorer\iexplore.exe"  http://www.fj-l-tax.gov.cn/wbsys
    Return

^!p::
    ;Run, "D:\Program Files\IrfanView\i_view64.exe" /slideshow="E:\mydoc\guo 郭荔萍 相片" /fs
    ;Run, "E:\mydoc\20180607 准备出书的文件\Book_2_Round_2_Computer\bin_OneQualityPic\OneStdPic.cmd" "E:\mydoc\20180607 准备出书的文件\Book_2_Round_2_Computer\bin_OneQualityPic\orig-jianfei.jpg"
    ;Run, "E:\mydoc\20180607 准备出书的文件\Book_2_Round_2_Computer\bin_OneQualityPic\StdPic.cmd"  "E:\mydoc\20180607 准备出书的文件\Book_2_Round_2_Computer\bin_OneQualityPic\TempTest\李克强.jpg"
    ;Run, "E:\mydoc\20180607 准备出书的文件\bin_StdPic_Essay_v2\bin\CompileSingleTexDocument.cmd"
    ;Run, "E:\mydoc\20180607 准备出书的文件\bin_BackupFilesByEmail\BackupFilesByEmail.cmd"
    Run, "D:\Program Files\AutoHotkey\AutoHotkeyU64.exe" "E:\mydoc\20180607 准备出书的文件\bin AutoInstall 2345浏览器\Install2345.ahk"
    Return

^!0::
    Run, "E:\mydoc\20180607 准备出书的文件\bin ShrinkPicByK\ShrinkPicByK.cmd"
    Return

^!v::
    Run, "C:\Program Files (x86)\ExpressVPN\xvpn-ui\ExpressVPN.exe"
    Return

^!+v::
    Run, "E:\mydoc\20180607 准备出书的文件\bin_StdPic_Essay_v2\bin\TileVertically.js"
    Return

;^!+w::
;    Run, "D:\Users\everi\WinEdt Team\WinEdt 10\WinEdt.exe"
;    Return

^!w::
    ; D:\Program Files\AutoHotkey
    ; IniRead, OutputVar, C:\Temp\myfile.ini, section2, key, 4 
    IniRead, IniValue, PingBiKey.ini, TianXin, CurrentVolume, 4
    InputBox, UserInput, 书的卷号, 请输入书的卷号, , 600, 200, , , , 5, %IniValue%
    if ErrorLevel
        MsgBox, CANCEL was pressed.
    else{
        ;MsgBox, You entered "%UserInput%"
        MyInput := UserInput + 0
        ;MsgBox, MyInput = "%MyInput%"
        ; IniWrite, this is a new value, C:\Temp\myfile.ini, section2, key
        IniWrite, %MyInput%,  PingBiKey.ini, TianXin, CurrentVolume
        ;MsgBox, ErrorLevel = "%ErrorLevel%"

        if (MyInput = 2){
            Run, "D:\Users\everi\WinEdt Team\WinEdt 10\WinEdt.exe" -V "e:\mydoc\20180607 准备出书的文件\Book_2_Round_2_Computer\EditSourceCode\Book_2_Computer.tex"
        }else if (MyInput = 3){
            Run, "D:\Users\everi\WinEdt Team\WinEdt 10\WinEdt.exe" -V "E:\mydoc\20180607 准备出书的文件\00_Round_1_Volume_3_EcoFinance\EditSourceCode\00_Vol_03_Finance.tex"
        }else if (MyInput = 4) {
            Run, "D:\Users\everi\WinEdt Team\WinEdt 10\WinEdt.exe" -V "e:\mydoc\20180607 准备出书的文件\00_Round_1_Volume_4_Literature\EditSourceCode\00_Vol_04_Literature.tex"
        }
    }

    ;打开第三卷书的项目主页。
    
    Return

^!1::
    Run, E:\portable\Snipaste-1.16.2-x64\Snipaste.exe
    Return

^!3::
    Run, D:\texlive\2018\tlpkg\texworks\texworks.exe
    Return

^Numpad1::
    SoundBeep
    run "E:\mydoc\20180607 准备出书的文件\00_Book_01_EduExam\make_Book01_EduExam.cmd.lnk"
    Return

^+0::
    IniRead, IniValue, PingBiKey.ini, TianXin, CurrentVolume, 4
    InputBox, UserInput, 书的卷号, 请输入书的卷号, , 600, 200, , , , 5, %IniValue%
    if ErrorLevel
        MsgBox, CANCEL was pressed.
    else{
        MyInput := UserInput + 0
        IniWrite, %MyInput%,  PingBiKey.ini, TianXin, CurrentVolume
        If (MyInput = 3){
            ;Run, "D:\Users\everi\WinEdt Team\WinEdt 10\WinEdt.exe" -V "E:\mydoc\20180607 准备出书的文件\00_Round_1_Volume_3_EcoFinance\EditSourceCode\00_Vol_03_Finance.tex"
            Run "E:\mydoc\20180607 准备出书的文件\00_Round_1_Volume_3_EcoFinance\Bin\OpenLatestVersion.cmd"
        }else if (MyInput = 4) {
            ; Run, python.exe "E:\mydoc\20180607 准备出书的文件\00_Round_1_Volume_4_Literature\Bin\OpenLatestVersionInVolume.py" 4
            Run "E:\mydoc\20180607 准备出书的文件\00_Round_1_Volume_4_Literature\Bin\OpenLatestVersionInVolume.cmd"
        }
    }

    
    Return

^+8::

    IniRead, IniValue, PingBiKey.ini, TianXin, CurrentVolume, 4
    InputBox, UserInput, 书的卷号, 请输入书的卷号, , 600, 200, , , , 5, %IniValue%
    if ErrorLevel
        MsgBox, CANCEL was pressed.
    else{
        MyInput := UserInput + 0
        IniWrite, %MyInput%,  PingBiKey.ini, TianXin, CurrentVolume
        If (MyInput = 3){
            ;Run, "D:\Users\everi\WinEdt Team\WinEdt 10\WinEdt.exe" -V "E:\mydoc\20180607 准备出书的文件\00_Round_1_Volume_3_EcoFinance\EditSourceCode\00_Vol_03_Finance.tex"
            ; Run "E:\mydoc\20180607 准备出书的文件\00_Round_1_Volume_3_EcoFinance\Bin\OpenLatestVersion.cmd"
            ; Run, "E:\mydoc\20180607 准备出书的文件\00_Round_1_Volume_3_EcoFinance\Bin\ProduceImageFilesForCompile.cmd"
            Run, E:\mydoc\20180607 准备出书的文件\00_Round_1_Volume_3_EcoFinance\Bin\CreateFile_ForHeaderFooter.cmd
        }else if (MyInput = 4) {
            ; Run, python.exe "E:\mydoc\20180607 准备出书的文件\00_Round_1_Volume_4_Literature\Bin\OpenLatestVersionInVolume.py" 4
            ; Run "E:\mydoc\20180607 准备出书的文件\00_Round_1_Volume_4_Literature\Bin\ProduceImageFilesForCompile4.cmd"

        }
    }

    
    Return

^+9::

    IniRead, IniValue, PingBiKey.ini, TianXin, CurrentVolume, 4
    InputBox, UserInput, 书的卷号, 请输入书的卷号, , 600, 200, , , , 5, %IniValue%
    if ErrorLevel
        MsgBox, CANCEL was pressed.
    else{
        MyInput := UserInput + 0
        IniWrite, %MyInput%,  PingBiKey.ini, TianXin, CurrentVolume
        If (MyInput = 3){
            ;Run, "D:\Users\everi\WinEdt Team\WinEdt 10\WinEdt.exe" -V "E:\mydoc\20180607 准备出书的文件\00_Round_1_Volume_3_EcoFinance\EditSourceCode\00_Vol_03_Finance.tex"
            ; Run "E:\mydoc\20180607 准备出书的文件\00_Round_1_Volume_3_EcoFinance\Bin\OpenLatestVersion.cmd"
            Run, "E:\mydoc\20180607 准备出书的文件\00_Round_1_Volume_3_EcoFinance\Bin\ProduceImageFilesForCompile.cmd"
        }else if (MyInput = 4) {
            ; Run, python.exe "E:\mydoc\20180607 准备出书的文件\00_Round_1_Volume_4_Literature\Bin\OpenLatestVersionInVolume.py" 4
            Run "E:\mydoc\20180607 准备出书的文件\00_Round_1_Volume_4_Literature\Bin\ProduceImageFilesForCompile4.cmd"

        }
    }


    ;Run, "E:\mydoc\20180607 准备出书的文件\00_Round_1_Volume_3_EcoFinance\Bin\ProduceImageFilesForCompile.cmd"
    Return

^+2::
    SoundBeep
    SoundBeep
    ;run "E:\mydoc\20180607 准备出书的文件\00_Book_02_Computer\00_Book_02_Computer_make.cmd.lnk"
    ;Run, "E:\mydoc\20180607 准备出书的文件\Book_2_Round_2_Computer\bin\ComplieSourceCode _V22.cmd"
    ; 提权，编成第2卷书，
    ;Run *RunAs "E:\mydoc\20180607 准备出书的文件\Book_2_Round_2_Computer\bin\ComplieSourceCode _V22.cmd"
    Run *RunAs "E:\mydoc\20180607 准备出书的文件\Book_23_Computer\bin\CompileSourceCode_Book23.cmd"
    Return

^+3::
    SoundBeep
    SoundBeep
    SoundBeep
    Run "E:\mydoc\20180607 准备出书的文件\00_Round_1_Volume_3_EcoFinance\Bin\ComplieSourceCode.cmd"
    Return

^+4::
    SoundBeep, 800, 500
    Run "e:\mydoc\20180607 准备出书的文件\00_Round_1_Volume_4_Literature\Bin\ComplieSourceCode.cmd"
    Return

^-::
    Run, cmd /c "@echo off | clip"
    Return

^+c::
; null= 
send ^c
sleep,200
clipboard=%clipboard% ;%null%
tooltip,%clipboard%
sleep,500
tooltip,
return



^!x::
    Run, D:\texlive\2018\tlpkg\texworks\texworks.exe
    Return

^!+o::
    Run, C:\Users\everi\AppData\Local\Google\Chrome\Application\chrome.exe  http://ocr.wdku.net/
    Return

;^!k::
;    Run, "C:\Program Files\internet explorer\iexplore.exe" http://kjbm6.mof.gov.cn/sskb/indexd.jsp?sheng=23&shi=2304

^+p::
    Run *RunAs "E:\portable\IrfanView452222\i_view32.exe"  /print="NPIEA7460 (HP LaserJet 400 M401dw)" /scanhidden
    Return