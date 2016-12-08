


WinLogOnView v1.11
Copyright (c) 2013 - 2015 Nir Sofer
Web site: http://www.nirsoft.net



Description
===========

WinLogOnView is a simple tool for Windows Vista/7/8/2008 that analyses
the security event log of Windows operating system, and detects the
date/time that users logged on and logged off. For every time that a user
log on/log off to your system, the following information is displayed:
Logon ID, User Name, Domain, Computer, Logon Time, Logoff Time, Duration,
and network address.
WinLogOnView also allows you to easily export the logon sessions
information to tab-delimited/comma-delimited/html/xml file.



System Requirements
===================


* This utility works on Windows Vista/7/8/2008/10. Both 32-bit and
  64-bit systems are supported. Older systems are not supported because
  the log on/log off information is not added to the security event log.



Known Limitations
=================


* This tool is based on the security event log of Windows, and the
  accuracy of the displayed information depends on the availability and
  accuracy of the data stored inside the security event log. It's
  possible that some of the information will be missing, like a logon
  session without logoff time. Bw aware that WinLogOnView currently uses
  the following events: 4648, 4624, 4647.



Versions History
================


* Version 1.11:
  o Fixed bug: WinLogOnView failed to display the logoff time even
    when the was 4647 event.

* Version 1.10:
  o Added new command-line options: /Source , /Server ,
    /ExternalFolder

* Version 1.05:
  o Added 'Logon Type' column.

* Version 1.03:
  o Fixed bug: On some systems, WinLogOnView displayed the domain
    name instead of computer name.

* Version 1.02:
  o Fixed to display date/time properly according to daylight saving
    time settings.

* Version 1.01:
  o Added browse button in the 'Advanced Options' window to choose
    the external folder.

* Version 1.00 - First release.



Start Using WinLogOnView
========================

WinLogOnView doesn't require any installation process or additional dll
files. In order to start using it, simply run the executable file -
WinLogOnView.exe
After running it, the main window of WinLogOnView displays the list of
all logon sessions detected on your system. You can easily export the
list to html/xml/tab-delimited/comma-delimited file by using the 'Save
Selected Items' option. You can also copy the selected items to the
clipboard (Ctrl+C) and then paste them into Excel with Ctrl+V.

If you want to get the logon/logoff information of a remote computer on
your network, simply go to the Advanced Options window (F9), choose
'Remote Computer' as data source, and then type the name of the remote
computer to connect.
If you want to get the logon/logoff information from external disk,
simply choose 'External Disk' as data source and then type the path of
the event log (Usually located under C:\Windows\System32\winevt\Logs)



Command-Line Options
====================



/Source <1-3>
Specifies the type of data source. 1 = Local Computer, 2 = Remote
Computer, 3 = External Disk

/Server <Remote Computer>
Specifies the remote computer to load. (For using with /Source 2 )

/ExternalFolder <Folder>
Specifies the folder in external disk to load. (For using with /Source 3 )

/stext <Filename>
Save the list of all logon sessions into a regular text file.

/stab <Filename>
Save the list of all logon sessions into a tab-delimited text file.

/scomma <Filename>
Save the list of all logon sessions into a comma-delimited text file
(csv).

/stabular <Filename>
Save the list of all logon sessions into a tabular text file.

/shtml <Filename>
Save the list of all logon sessions into HTML file (Horizontal).

/sverhtml <Filename>
Save the list of all logon sessions into HTML file (Vertical).

/sxml <Filename>
Save the list of all logon sessions to XML file.

/sort <column>
This command-line option can be used with other save options for sorting
by the desired column. If you don't specify this option, the list is
sorted according to the last sort that you made from the user interface.
The <column> parameter can specify the column index (0 for the first
column, 1 for the second column, and so on) or the name of the column,
like "User Name" and "Logon Time". You can specify the '~' prefix
character (e.g: "~User Name") if you want to sort in descending order.
You can put multiple /sort in the command-line if you want to sort by
multiple columns.

Examples:
WinLogOnView.exe /shtml "f:\temp\logon.html" /sort 2 /sort ~1
WinLogOnView.exe /shtml "f:\temp\logon.html" /sort "User Name" /sort
"Logon Time"

/nosort
When you specify this command-line option, the list will be saved without
any sorting.



Translating WinLogOnView to other languages
===========================================

In order to translate WinLogOnView to other language, follow the
instructions below:
1. Run WinLogOnView with /savelangfile parameter:
   WinLogOnView.exe /savelangfile
   A file named WinLogOnView_lng.ini will be created in the folder of
   WinLogOnView utility.
2. Open the created language file in Notepad or in any other text
   editor.
3. Translate all string entries to the desired language. Optionally,
   you can also add your name and/or a link to your Web site.
   (TranslatorName and TranslatorURL values) If you add this information,
   it'll be used in the 'About' window.
4. After you finish the translation, Run WinLogOnView, and all
   translated strings will be loaded from the language file.
   If you want to run WinLogOnView without the translation, simply rename
   the language file, or move it to another folder.



License
=======

This utility is released as freeware. You are allowed to freely
distribute this utility via floppy disk, CD-ROM, Internet, or in any
other way, as long as you don't charge anything for this and you don't
sell it or distribute it as a part of commercial product. If you
distribute this utility, you must include all files in the distribution
package, without any modification !



Disclaimer
==========

The software is provided "AS IS" without any warranty, either expressed
or implied, including, but not limited to, the implied warranties of
merchantability and fitness for a particular purpose. The author will not
be liable for any special, incidental, consequential or indirect damages
due to loss of data or any other reason.



Feedback
========

If you have any problem, suggestion, comment, or you found a bug in my
utility, you can send a message to nirsofer@yahoo.com
