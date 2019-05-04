#SingleInstance, force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
;; #Warn  ; Enable warnings to assist with detecting common errors.
#Warn UseUnsetLocal, OutputDebug  ; Warn when a local variable is used before it's set; send warning to OutputDebug.

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; UTF-8: Unicode UTF-8, equivalent to CP65001.

; UTF-8-RAW: As above, but no byte order mark is written when a new file is created.

Global strInstallSourceHome := "E:\mydoc\20190417 国英装机 0402 给蔡平易装机用到的软件"

Global strLogFolder := "D:\portable\SilentInstall_Logs"

Global strSetUserFTA_q2 := % """" . strInstallSourceHome . "\bin_SetUserFTA\SetUserFTA.exe" . """"

Global strFullPath_WinRAR :=  % """" . "E:\Program Files\WinRAR\WinRAR.exe" . """"


SetupGlobalEnvironment(){
    strInstallSourceHome := "E:\mydoc\20190417 国英装机 0402 给蔡平易装机用到的软件"
}

!+2::

    SetTitleMatchMode, 2

    ;# FormatTime, strTime, R yyyy-MM-dd hh:mm:ss 
    FormatTime, strTime, R MM dd hh:mm:ss tt
    ; MsgBox %strTime%
    
    FileAppend  %strTime% 行号 %A_LineNumber% MyLog2222 before comspec`n, Test.log, UTF-8
    
    
    
    ; Run %ComSpec% /c "d:\Users\ljf\Downloads\2345Explorer_qx.exe"
    
    ; Run "d:\Users\ljf\Downloads\2345Explorer_qx.exe"
    Run "E:\Downloads\2345Explorer_qx.exe"
    
    Sleep, 1000    ; 休眠五秒。
    ; WinWaitActive 2345 ;加速浏览器
    
    sleep, 2000
    ; WinActivate 2345加速浏览器
    Sleep, 2000
    
    SendInput, {Enter}
    ;gosub doScreenshot2  ;开始截图。
    FormatTime, strTime, R MM dd hh:mm:ss tt
    FileAppend %strTime% 行号 %A_LineNumber% 完成输入回车键。`n, Test.log, UTF-8
    ToolTip %strTime% 行号 %A_LineNumber% 完成输入回车键。`n

    ;FormatTime, strTime, yyyy-MM-dd hh:mm:ss tt.
    FormatTime, strTime, R MM dd hh:mm:ss tt
    FileAppend %strTime% 行号 %A_LineNumber% 完成安装操作。`n, Test.log, UTF-8
    Return

doScreenshot2:
    fd=%a_desktop%
    runwait,"E:\Program Files\IrfanView\i_view64.exe" "/capture=0 /convert=%fd%\%A_now%_screenshotx.png"
    return


doScreenshot: ;<- a callable label
    FormatTime, strTime, R MM dd hh:mm:ss tt
    FileAppend %strTime% 行号 %A_LineNumber% 标号 %A_ThisLabel% 进入doScreenshot地界`n, Test.log, UTF-8
    
    Send, {PrintScreen} ;<- grabs the desktop puts on clipboard
    Run, mspaint.exe ;<- runs the paint pgm to save the image
    WinWaitActive, 画图 ;<- wait for paint to be active
    Send, ^v ;<- paste the image into paint
    Sleep 1000 ;<- let it settle
    Send {F12} ;<- activate save dialog
    Sleep 1000 ;<- let it settle
    FormatTime, strTime, R MM dd hh:mm:ss tt
    FileAppend %strTime% 行号 %A_LineNumber% MyHope Log after comspec`n, Test.log, UTF-8
    Send, temp %A_TickCount%.png ;<- name the file as temp.png
    Sleep 1000 ;<- let it settle
    Send, {Enter} ;<- activate the save
    sleep 1000 ;<- let it settle
    WinClose, Paint ;<- close the paint program
    return

!+3::
    run "D:\Program Files (x86)\AutoIt3\AutoIt3_x64.exe" "E:\mydoc\20180607 准备出书的文件\bin AutoInstall 2345浏览器\AutoIt_Install_2345.au3" 
    return

!+4::  ;Chrome installation
    Install_ChromeBrowser()
    return

Install_ChromeBrowser(){    
    ;msgbox % A_Is64bitOS	; Contains 1 (true) if the OS is 64-bit or 0 (false) if it is 32-bit.

    ; chrome_installer.exe /silent /install
    if (A_Is64bitOS = 1){
        strToRun := % """" . strInstallSourceHome . "\" . "72.0.3626.121_chrome_installer_x64.exe" . """" . " /silent /install"
        LogEvent(A_LineNumber, "准备运行 = " . strToRun)
        RunWait, %strToRun%
        LogEvent(A_LineNumber, "运行完毕 = " . strToRun)
        ;Msgbox, 完成安装！
        return
    }else{  
        RunWait, "E:\mydoc\20190417 国英装机 0402 给蔡平易装机用到的软件\72.0.3626.121_chrome_installer.exe" /silent /install
        ;Msgbox, 完成32位Chrome浏览器的安装！
        return
    }
}

    ; 下面这种方法不准。

;    MsgBox, % "OS Type: " . A_OSType . "`nOS Version: " . A_OSVersion . "`nPointer Size: " . A_PtrSize
;        . "`nAdmin: " . (If (A_IsAdmin == 1)?"Yes":"No") . "`n64 Bit OS: "
;        . (If (InStr(A_ProgramFiles, "x86") > 0)?"Yes":"No") . "`nAHK Version: " . A_AhkVersion
;        . "`nAHK Path: " . A_AhkPath

;    msgbox % A_Is64bitOS	; Contains 1 (true) if the OS is 64-bit or 0 (false) if it is 32-bit.
;    msgbox % A_OSVersion

!+e:: ; Everything的安装
    Install_Everything()
    return

Install_Everything(){

    is64BitOS := Check64Bit()
    strOptions := " /S -app-data -disable-run-as-admin -disable-update-notification -install-desktop-shortcut -install-all-users-desktop-shortcut -install-folder-context-menu -install-quick-launch-shortcut -install-service -install-service-port 15485  -install-all-users-start-menu-shortcuts -language 2052 /D d:\portable\Everything_silent_install"
;    msgbox, %is64BitOS%
;     if is64BitOS is alpha 
;         msgbox 是个alpha
;     else if is64BitOS is integer
;         msgbox 是个整数。
;   /D desthomefolder 注意，可以安装到D盘
    if (is64bitOS = 1){
        strToRun := "E:\mydoc\20190417 国英装机 0402 给蔡平易装机用到的软件\Everything-1.4.1.935.x64-Setup.exe" . strOptions
        ;msgbox, %strToRun%
        LogEvent(A_LineNumber, "准备运行 = " . strToRun)
        RunWait, %strToRun%
        LogEvent(A_LineNumber, "运行完毕 = " . strToRun)
        Tooltip 完成64位Everything的安装！
        Sleep 5000
        Tooltip 
    }else{
        RunWait, "E:\mydoc\20190417 国英装机 0402 给蔡平易装机用到的软件\Everything-1.4.1.935.x86-Setup.exe" %strOptions%
        Tooltip 完成32位Everything的安装！
        Sleep 5000
        Tooltip 
    }
    return
}

LogEvent(lineno, strPrint){
    ;做日志记录
    FormatTime, strTime, R MM dd hh:mm:ss tt
    FileAppend %strTime% 行号 %lineno% %strPrint%`n, Test.log, UTF-8

    Tooltip % strPrint
    Sleep 4500
    Tooltip 

}

Check64Bit(){
    

    for obj in ComObjGet("winmgmts:\\.\root\cimv2").ExecQuery("SELECT OSArchitecture FROM Win32_OperatingSystem")
       strObj := % obj.OSArchitecture

    StringLeft, OutputStr, strObj, 2     ; get 2 left chars

    if (OutputStr = "64" ){
        Tooltip 64位操作系统。
        Sleep 5000
        Tooltip  
        return 1
    }else if (OutputStr = "32"){
        Tooltip 32位操作系统。
        Sleep 5000
        Tooltip  
        return 0
    }else{
        MsgBox 出现未明状态！
        return 0
    }

}

!+y::   ;安装FastCopy
    Install_FastCopy()
    return

Install_FastCopy(){     

    SetupGlobalEnvironment()

    ; msgbox % strInstallSourceHome

    strToRun := % """" . strInstallSourceHome . "\" . "FastCopy361_installer.exe" . """" . " /SILENT /DIR=" . """" . "D:\portable\FastCopy_Silent_Auto_Install" . """"

    ; msgbox % strToRun

    ;FormatTime, strTime, R MM dd hh:mm:ss tt
    ;FileAppend  %strTime% 行号 %A_LineNumber% 安装FastCopy = %strToRun% `n, Test.log, UTF-8

    LogEvent(A_LineNumber, "准备运行 = " . strToRun)
    RunWait, %strToRun% 
    LogEvent(A_LineNumber, "运行结束 = " . strToRun)

;    if (A_Is64bitOS = 1){
        
;    }else{

;    }
    return
}

!+v::   ; 安装IrfanView
    Install_IrfanView()
    return


Install_IrfanView(){
    strOptions := " /silent /desktop /group /allusers /assoc=1 /ini "
    strAssocApplicationID := ""

    if (A_Is64bitOS = 1){
        strToRun := % """" . strInstallSourceHome . "\" . "iview450_x64_setup.exe" . """" . strOptions . "/folder=" . """" . "D:\portable\IrfanView64_Auto_Silent_Install" . """"
        ;msgbox % strToRun
        FormatTime, strTime, R MM dd hh:mm:ss tt
        FileAppend %strTime% 行号 %A_LineNumber% 安装 IrfanView %strToRun% `n, Test.log, UTF-8

        LogEvent(A_LineNumber, "准备运行 = " . strToRun)
        RunWait  %strToRun%
        LogEvent(A_LineNumber, "运行结束 = " . strToRun)

        strAssocApplicationID := "Applications\i_view64.exe"
            ;strToRun2 :=  % """" . strInstallSourceHome . "\" . "irfanview_lang_chinese.exe" . """" . " /silent /folder=" . """" .  "D:\portable\IrfanView64_Auto_Silent_Install" . """"
            ;msgbox % strToRun2
            ;RunWait, %strToRun2%

    }else{
        strToRun := % """" . strInstallSourceHome . "\" . "iview450_setup.exe" . """" . strOptions  . "/folder=" . """" . "D:\portable\IrfanView32_Auto_Silent_Install" . """"
        ;msgbox % strToRun
        FormatTime, strTime, R MM dd hh:mm:ss tt
        FileAppend %strTime% 行号 %A_LineNumber% 安装 IrfanView %strToRun% `n, Test.log, UTF-8

        RunWait, %strToRun%
        
        strAssocApplicationID := "Applications\i_view32.exe"

    }

    strRunAssoc := % strSetUserFTA_q2 . " .jpg " .  """" . strAssocApplicationID . """"
    LogEvent(A_LineNumber, "准备运行 = " . strRunAssoc)
    RunWait, %strRunAssoc%


    strRunAssoc := % strSetUserFTA_q2 . " .jpeg " .  """" . strAssocApplicationID . """"
    LogEvent(A_LineNumber, "准备运行 = " . strRunAssoc)
    RunWait, %strRunAssoc%


    strRunAssoc := % strSetUserFTA_q2 . " .png " .  """" . strAssocApplicationID . """"
    LogEvent(A_LineNumber, "准备运行 = " . strRunAssoc)
    RunWait, %strRunAssoc%

    ; "Applications\i_view64.exe"

    Sleep 3000
    LogEvent(A_LineNumber, "要再安装相关的语言包")
    return
}


^!+Home::
    TotalAutoSilentInstall()
    return


TotalAutoSilentInstall(){
    ;实现全部安装包的静默安装。

    makeSpecialFolders("D:")

    ;return

    Install_WinRAR()   ;解压软件一定要先安装。

    Install_FastCopy()

    Install_InputMethods()

    Install_Fonts() ; E:\mydoc\20190417 国英装机 0402 给蔡平易装机用到的软件\bin_fontreg-2.1.3-redist\bin.x86-64\FontReg.exe

    Install_Everything()

    Install_Listary()

    Install_NotePlusPlus()

    Install_Office2007()

    Install_ChromeBrowser()


    Install_IrfanView()

    Install_PDFXChange_Viewer()

    Install_RevoUninstaller()

    ;Install_NoSleep()   ;权限问题没搞好。
    Install_Nero2018()   ; 安装耐录 2018

    Install_HuoRong()

    Install_WindowsUpdateBlocker() ; Windows Update Blocker

    Install_RebootRestoreRx()  ; 放在最后，要重启的。

}

!+L::
    Install_Listary()
    return

Install_Listary(){
    ; 安装Listary，不区分32和64位。
    strToRun := % """" .  strInstallSourceHome . "\" . "Listary.exe" . """" . " /VERYSILENT /LOG:D:\Listary.log /NOCANCEL /NORESTART /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS /LANG=Chs /NOICONS " . " /DIR=D:\portable\Listary_Silent_Install" 
    LogEvent(A_LineNumber, "准备运行 = " . strToRun)
    ;msgbox % strToRun
    RunWait, %strToRun%
    LogEvent(A_LineNumber, "运行完毕 = " . strToRun)


}

!+d::
    makeSpecialFolders("D:")
    return

makeSpecialFolders(strTotalHomeFolder){  ; 创建特殊的文件夹

    LogEvent(A_LineNumber, "准备创建文件夹，父亲文件夹是 = " . strTotalHomeFolder)

    FileCreateDir, % strTotalHomeFolder . "\视频"
    FileCreateDir, % strTotalHomeFolder . "\图片"
    FileCreateDir, % strTotalHomeFolder . "\文档"
    FileCreateDir, % strTotalHomeFolder . "\下载"
    FileCreateDir, % strTotalHomeFolder . "\音乐"
    FileCreateDir, % strTotalHomeFolder . "\桌面"

    LogEvent(A_LineNumber, "文件夹创建完毕，父亲文件夹是 = " . strTotalHomeFolder)

    ;FileCreateDir, 图片
    ;FileCreateDir, 文档
    ;FileCreateDir, 下载
    ;FileCreateDir, 音乐
    ;FileCreateDir, 桌面


}

;http://www.jrsoftware.org/ishelp/index.php?topic=setupcmdline

!+p::  ; power to not sleep
    Install_NoSleep()
    return

Install_NoSleep(){


    strFullPath_NoSleep := % strInstallSourceHome . "\NoSleep.exe"

    strToExplorer := % "explorer.exe /select, " . """" .  strFullPath_NoSleep . """"

    Run, %strToExplorer%

    LogEvent(A_LineNumber, "准备放置不睡眠的软件 = " . strFullPath_NoSleep)

    ; 检测文件是否存在。
    if !FileExist(strFullPath_NoSleep){
       MsgBox % "源文件不存在 = " . strFullPath_NoSleep
       return
    }

    EnvGet, myPrimaryFolder, USERPROFILE

    ; msgbox % myPrimaryFolder

    myStartUp := % myPrimaryFolder . "\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

    LogEvent(A_LineNumber, "取得启动文件夹的全路径名 = " . myStartUp)

    ; 如果文件存在，则要取得shell folder (startup)
    ; strDestFolder := GetStartUpPath()
    strDestFolder := % myStartUp  . "\NoSleep.exe"

    strToExplorer := % "explorer.exe /select, " . """" .  strDestFolder . """"

    Run, %strToExplorer%

    LogEvent(A_LineNumber, "取得目标文件夹 = " . strDestFolder)

    ;执行拷贝操作。
    FileCopy, %strFullPath_NoSleep%, %strDestFolder% , 1 ; 1 overwrite

;RunAs, Administrator, MyPassword
;Run, RegEdit.exe
;RunAs  ; Reset to normal behavior.

}

;GetCommonPath( csidl ) ; csidl as a string
GetStartUpPath(){ 

    EnvGet, myPrimaryFolder, USERPROFILE

    msgbox % myPrimaryFolder

    myStartUp := % myPrimaryFolder . "\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

    LogEvent(A_LineNumber, "取得启动文件夹的全路径名 = " . myStartUp)

    return myStartUp

        ;static init 

        ;if !init 
        ;{ 
    CSIDL_APPDATA                 =0x001A     ; Application Data, new for NT4 
    CSIDL_COMMON_APPDATA          =0x0023     ; All Users\Application Data 
    CSIDL_COMMON_DOCUMENTS        =0x002e     ; All Users\Documents 
    CSIDL_DESKTOP                 =0x0010     ; C:\Documents and Settings\username\Desktop 
    CSIDL_FONTS                   =0x0014     ; C:\Windows\Fonts 
    CSIDL_LOCAL_APPDATA           =0x001C     ; non roaming, user\Local Settings\Application Data 
    CSIDL_MYMUSIC                 =0x000d     ; "My Music" folder 
    CSIDL_MYPICTURES              =0x0027     ; My Pictures, new for Win2K 
    CSIDL_PERSONAL                =0x0005     ; My Documents 
    CSIDL_PROGRAM_FILES_COMMON    =0x002b     ; C:\Program Files\Common 
    CSIDL_PROGRAM_FILES           =0x0026     ; C:\Program Files 
    CSIDL_PROGRAMS                =0x0002     ; C:\Documents and Settings\username\Start Menu\Programs 
    CSIDL_RESOURCES               =0x0038     ; %windir%\Resources\, For theme and other windows resources. 
    CSIDL_STARTMENU               =0x000b     ; C:\Documents and Settings\username\Start Menu 
    CSIDL_STARTUP                 =0x0007     ; C:\Documents and Settings\username\Start Menu\Programs\Startup. 
    CSIDL_SYSTEM                  =0x0025     ; GetSystemDirectory() 
    CSIDL_WINDOWS                 =0x0024     ; GetWindowsDirectory() 
        ;} 

        
    ;val = % CSIDL_%csidl% 
    ;msgbox % "value = " . val
    ;VarSetCapacity(fpath, 256) 
    ; DllCall( "shell32\SHGetFolderPathA", "uint", 0, "int", CSIDL_STARTUP, "uint", 0, "int", 0, "str", fpath) 
    ;return %fpath% 

}

!+X::    ; Install Pdf x-change viewer
    Install_PDFXChange_Viewer()
    return

Install_PDFXChange_Viewer(){
    ; 还要解决绝对化关联问题，不然关联不稳定。
    
    FileCreateDir, % strLogFolder

    ; 安装PDFXChange Viewer，不区分32和64位。
    strToRun := % """" .  strInstallSourceHome . "\" . "PDFXVwer.exe" . """" . " /VERYSILENT /NOCANCEL /NORESTART /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS /LANG=Chs /NOICONS /NODESKICON /NOINSTASK /PDFV /PDFVINBROWSER  " . " /DIR=D:\portable\PDFXChange_Viewer_Silent_Install2 " . " /LOG=" . """" . strLogFolder . "\PDFXViewer.log" . """" 
    LogEvent(A_LineNumber, "准备运行 = " . strToRun)
    ;msgbox % strToRun
    RunWait, %strToRun%
    LogEvent(A_LineNumber, "运行完毕 = " . strToRun)

    ; 安装 PDFXChange Viewer 关联问题。E:\mydoc\20190417 国英装机 0402 给蔡平易装机用到的软件\bin_SetUserFTA\SetUserFTA.exe
    ; 无法完善运行，有待进一步解决。
    strSetUserFTA_q2 := % """" . strInstallSourceHome . "\bin_SetUserFTA\SetUserFTA.exe" . """"
                                                        ;D:\portable\PDFXChange_Viewer_Silent_Install\PDF Viewer\PDFXCview.exe
    strRunAssoc := % strSetUserFTA_q2 . " .pdf " .  """" . "Applications\PDFXCview.exe" . """"

    ;msgbox % strRunAssoc
    ; 还是有语言模式无法自动切换的问题。

    LogEvent(A_LineNumber, "准备运行 = " . strRunAssoc)

    RunWait, %strRunAssoc%

    Run, "D:\portable\PDFXChange_Viewer_Silent_Install2\PDF Viewer\PDFXCview.exe"

}

!+j::
    Install_WinRAR()
    return

Install_WinRAR(){
    if (A_Is64bitOS = 1){
        strToRun := % """" . strInstallSourceHome . "\" . "winrar-x64-570.exe" . """" . " /S "
        LogEvent(A_LineNumber, "准备运行 ＝ " . strToRun)
        RunWait, %strToRun%
        LogEvent(A_LineNumber, "运行完毕 ＝ " . strToRun)
    }else{
        strToRun := % """" . strInstallSourceHome . "\" . "winrar570.exe" . """" . " /S "
        LogEvent(A_LineNumber, "准备运行 ＝ " . strToRun)
        RunWait, %strToRun%
        LogEvent(A_LineNumber, "运行完毕 ＝ " . strToRun)

    } 
}

!+R::    ; Install Reboot & Restore
         ; 查了官网，没有命令行选项。

    Install_RebootRestoreRx()
    return

Install_RebootRestoreRx(){
    ; 先解压
    strFullPath_WinRAR := % """" . "E:\Program Files\WinRAR\WinRAR.exe" . """"
    strFullPath_InstallPack := % """" . strInstallSourceHome . "\" . "RebootRestoreRx31.zip" . """"
    strFullPath_ExtractDest := %   strInstallSourceHome . "\RebootRestoreRx" 
    strFullPath_ExtractDest_q2 := %  """" . strInstallSourceHome . "\RebootRestoreRx" . """" 
    
    ;生成解压命令
    ;if (A_Is64bitOS = 1){
    FileCreateDir , % strFullPath_ExtractDest
    strCmd_ToRun := % strFullPath_WinRAR . " x -y " . strFullPath_InstallPack . " " . strFullPath_ExtractDest_q2
    ;msgbox % strCmd_ToRun
    LogEvent(A_LineNumber, "准备运行 ＝ " . strCmd_ToRun)
    RunWait, %strCmd_ToRun%
    LogEvent(A_LineNumber, "运行完毕 ＝ " . strCmd_ToRun)

    strInstallApp = ""
    if (A_Is64bitOS = 1){
        ; E:\mydoc\20190417 国英装机 0402 给蔡平易装机用到的软件\RebootRestoreRx\Reboot Restore Rx 20181206 v3.1\x64.exe
        strInstallApp := % """" . strInstallSourceHome . "\RebootRestoreRx\Reboot Restore Rx 20181206 v3.1\x64.exe" . """"
    }else{
        ;E:\mydoc\20190417 国英装机 0402 给蔡平易装机用到的软件\RebootRestoreRx\Reboot Restore Rx 20181206 v3.1\Setup.exe
        strInstallApp := % """" . strInstallSourceHome . "\RebootRestoreRx\Reboot Restore Rx 20181206 v3.1\Setup.exe" . """"
    }

    LogEvent(A_LineNumber, "准备运行 ＝ " . strInstallApp)

    Run, %strInstallApp%

    ; 再根据需要，启动那两个文件。 
}

!+u::
    Install_WindowsUpdateBlocker()
    return


Install_WindowsUpdateBlocker(){
    ; 安装好更新阻止器
    strFullPath_WinRAR :=  % """" . "E:\Program Files\WinRAR\WinRAR.exe" . """"

    strFullPath_InstallPack := % """" . strInstallSourceHome . "\" . "wub.zip" . """"

    strFullPath_ExtractDest := % "D:\portable\WindowsUpateBlocker_Auto"

    ; 生成解压命令，先创建文件。
    FileCreateDir, % strFullPath_ExtractDest

    strCmd_Extract := % strFullPath_WinRAR . " x -y " . strFullPath_InstallPack . " " . """" . strFullPath_ExtractDest . """"

    LogEvent(A_LineNumber, "准备运行 ＝ " . strCmd_Extract)
    RunWait, %strCmd_Extract%
    LogEvent(A_LineNumber, "运行完毕 ＝ " . strCmd_Extract)

    ; D:\portable\WindowsUpateBlocker_Auto\Wub_v1.1\Wub.exe
    strApp_Path := % """" . strFullPath_ExtractDest . "\Wub_v1.1\Wub.exe" . """" . " /D /P "
    LogEvent(A_LineNumber, "准备运行 ＝ " . strApp_Path)
    Run % strApp_Path

}

!+s::
    Install_RevoUninstaller()
    return

Install_RevoUninstaller(){

    FileCreateDir, % strLogFolder

    ; 安装PDFXChange Viewer，不区分32和64位。
    strToRun := % """" .  strInstallSourceHome . "\" . "RevoSetup.exe" . """" . " /VERYSILENT /NOCANCEL /SUPPRESSMSGBOXES /NORESTART /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS /LANG=Chs /NOICONS " . " /DIR=D:\portable\RevoUninstaller_Silent_Install2 " . " /LOG=" . """" . strLogFolder . "\RevoUninstaller.log" . """" 
    LogEvent(A_LineNumber, "准备运行 = " . strToRun)
    ;msgbox % strToRun
    RunWait, %strToRun%
    LogEvent(A_LineNumber, "运行完毕 = " . strToRun)
        
}


!+i::
    Install_InputMethods()
    return

Install_InputMethods(){
    strToRun := % """" . strInstallSourceHome . "\" . "sogou_pinyin_93e.exe" . """" . " /S"
    LogEvent(A_LineNumber, "准备运行... = " . strToRun)
    RunWait, %strToRun%


    strToRun := % """" . strInstallSourceHome . "\" . "sogou_wubi_31a.exe" . """" . " /S"
    LogEvent(A_LineNumber, "准备运行... = " . strToRun)
    RunWait, %strToRun%

}

!+N::
    Install_NotePlusPlus()
    return

Install_NotePlusPlus(){

    ; https://notepad-plus-plus.org/
    ; E:\mydoc\20190417 国英装机 0402 给蔡平易装机用到的软件\npp.7.6.6.Installer.exe
    ; E:\mydoc\20190417 国英装机 0402 给蔡平易装机用到的软件\npp.7.6.6.Installer.x64.exe

    if (A_is64BitOS = 1) {
        strToRun := % """" . strInstallSourceHome . "\" . "npp.7.6.6.Installer.x64.exe" . """" . " /S"
        LogEvent(A_LineNumber, "准备运行 ＝ " . strToRun)
        RunWait % strToRun

    }else{
        strToRun := % """" . strInstallSourceHome . "\" . "npp.7.6.6.Installer.exe" . """" . " /S"
        LogEvent(A_LineNumber, "准备运行 ＝ " . strToRun)
        RunWait % strToRun
    }
   
    SetupFileAssoc(".txt", "notepad++.exe")
    SetupFileAssoc(".log", "notepad++.exe") 

    ; 还有一点，要关掉自动运行更新的开关。
    LogEvent(A_LineNumber, "待做事项：要关掉自动运行更新的开关。")

}


SetupFileAssoc(strExtension, strAppName){

    strSetUserFTA_q2 := % """" . strInstallSourceHome . "\bin_SetUserFTA\SetUserFTA.exe" . """"
    strRunAssoc := % strSetUserFTA_q2 . " " . strExtension . " " .  """" . "Applications" . "\" . strAppName . """"

    ;msgbox % strRunAssoc

    LogEvent(A_LineNumber, "准备运行应用程序与文件类型的关联 = " . strRunAssoc)

    RunWait, %strRunAssoc%

}

!+t::
    Install_Fonts()
    return


Install_Fonts() ; E:\mydoc\20190417 国英装机 0402 给蔡平易装机用到的软件\bin_fontreg-2.1.3-redist\bin.x86-64\FontReg.exe
{
    ; 先判断要用哪个fontreg
    strCmd_FontReg := ""
    if(A_Is64bitOS = 1) {
        strCmd_FontReg := % """" . strInstallSourceHome . "\" . "bin_fontreg-2.1.3-redist\bin.x86-64\FontReg.exe" . """"
    }else{
        strCmd_FontReg := % """" . strInstallSourceHome . "\" . "bin_fontreg-2.1.3-redist\bin.x86-32\FontReg.exe" . """"
    }
    ; E:\mydoc\20190417 国英装机 0402 给蔡平易装机用到的软件\20171114 xiaobiao win7-xp 字体兼容解决办法
    strFontDir := % """" . strInstallSourceHome . "\" . "20171114 xiaobiao win7-xp 字体兼容解决办法" . """"

    strOriginalWorkDir := % A_WorkingDir
    LogEvent(A_LineNumber, "原来的工作目录 ＝ " . strOriginalWorkDir)

    SetWorkingDir % strFontDir
    LogEvent(A_LineNumber, "现在的工作目录 ＝ " . A_WorkingDir)

    ;开始转换工作
    strCmd_ToRun := % strCmd_FontReg . " /COPY"
    LogEvent(A_LineNumber, "待执行的命令 ＝ " . strCmd_ToRun)

    RunWait % strCmd_ToRun

    SetWorkingDir % strOriginalWorkDir
    LogEvent(A_LineNumber, "现在的工作目录 ＝ " . A_WorkingDir)

}

!+o::
    Install_Nero2018()
    return


Install_Nero2018(){
    strNeroInstall_packPath := % """" . strInstallSourceHome . "\" . "Big_Nero2018\neroburningrom2018.exe" . """"
               ;E:\mydoc\20190417 国英装机 0402 给蔡平易装机用到的软件\Nero2018\neroburningrom2018.exe 

    strCmd_ToRun := % strNeroInstall_PackPath . " /SN=" . "908K-838A-L402-K0EE-321H-K7K7-7HMK-90U9" . " /WRITE_SN /NOCANCEL /NOREBOOT /SILENT /NO_UI "

    LogEvent(A_LineNumber, "即将运行的命令是 ＝ " . strCmd_ToRun)

    ;msgbox % strCmd_ToRun

    RunWait % strCmd_ToRun

    LogEvent(A_LineNumber, "该软件安装后需要重启，并请你手工安装好OneNero和OneBurn两个脚本。")

}

!+m::
    Install_Office2007()
    return

Install_Office2007(){
    ; 安装Office 2007
    strFullPath_InstallPackage := % """" . strInstallSourceHome . "\" . "Big_Office2007\Office2007PJBFXLH_1.0_XiaZaiZhiJia.zip" . """"
    strFullPath_DestExtractDir := % strInstallSourceHome . "\" . "Big_Office2007\" 
    strExtractCommand := % strFullPath_WinRAR . " x -y " . strFullPath_InstallPackage . " " . """" . strFullPath_DestExtractDir . """"
    ; strFullPath_WinRAR :=  % """" . "E:\Program Files\WinRAR\WinRAR.exe" . """"
    
    ;msgbox % strExtractCommand

    LogEvent(A_LineNUmber, "即将运行的解压缩命令是 ＝ " . strExtractCommand)

    RunWait % strExtractCommand

    ; 开始安装操作。
    ; E:\mydoc\20190417 国英装机 0402 给蔡平易装机用到的软件\Big_Office2007\office2007ProCN_downcc.com\office2007pro.chs\setup.exe
    strSetup := % """" . strInstallSourceHome . "\" . "Big_Office2007\office2007ProCN_downcc.com\office2007pro.chs\setup.exe" . """"
    strMSPFile := % """" . strInstallSourceHome . "\" . "Big_office2007\Office2007.MSP" . """"
    strRunOfficeSetup := % strSetup . " /adminfile " . strMSPFile

    msgbox % strRunOfficeSetup

    LogEvent(A_LineNumber, "即将运行的安装命令是 ＝ " . strRunOfficeSetup)

    RunWait % strRunOfficeSetup

    LogEvent(A_LineNUmber, "完成安装命令，下一步，将安装UBit经典菜单命令")

    strUBitMenu_InstallPack := % """" . strInstallSourceHome . "\" . "Big_Office2007\UBitMenuSetupZH Jian Ti.exe" . """"
    strUBitMenu_InstallSwitches := % " /VERYSILENT /NOCANCEL /SUPPRESSMSGBOXES /NORESTART /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS /LANG=Chs /NOICONS " .  " /LOG=" . """" . strLogFolder . "\UBitMenu.log" . """" 
    strCmd_ToRun := % strUBitMenu_InstallPack . strUBitMenu_InstallSwitches

    msgbox % strCmd_ToRun

    LogEvent(A_LineNumber, strCmd_ToRun)

    RunWait % strCmd_ToRun

    LogEvent(A_LineNumber, "圆满完成Office 2007的安装")
    

    
}


!+h::
    Install_HuoRong()
    return

Install_HuoRong(){ ; /S 静默安装。
    ; 此处要加上参数，完整码＋后缀来罗列，并举出最新版的。
}
