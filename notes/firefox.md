## Firefox
### Firefox Auto-Downloads Files
- [Since release 98.0](https://www.mozilla.org/en-US/firefox/98.0/releasenotes/).
	- [Longer explanation](https://support.mozilla.org/en-US/kb/manage-downloads-preferences-using-downloads-menu).
- [Please stop doing this](https://connect.mozilla.org/t5/ideas/choose-to-always-ask-to-download-files-instead-of-auto/idi-p/958).

In "Settings" -> "General" (`about:preferences`), under "Files and Applications", you may have "Always ask you where to save files" checked.
However, Firefox may still download files, such as PDFs, without asking.

My understanding of the problem is that Firefox thinks "opening files" and "saving files" are completely separate.

Just a bit further below, under "Applications", Firefox can have custom "Action"s for different "Content Type"s;
for example, (I believe) by default, PDFs are set to "Open in Firefox".
When you "download" a PDF, Firefox thinks it should "just" "open" it, so it auto-downloads the file, and opens it.

If you change the action to "Save File", Firefox will actually ask you where to save it
(assuming you have checked "Always ask you where to save files" as mentioned above).

Note that the setting "What should Firefox do with other files?" (where the options are "Save files" and "Ask whether to open or save files")
is orthogonal to "Always ask you where to save files";
"Always ask you where to save files" applies _after_ Firefox has decided that it is only saving the file.

Also, as part of release 98.0, such auto-downloaded files will no-longer be put in a proper temp folder.

> Any files you download will be immediately saved on your disk.
> Depending on the current configuration, they’ll be saved in your preferred download folder, or you’ll be asked to select a location for each download.
> Windows and Linux users will find their downloaded files in the destination folder.
> They’ll no longer be put in the Temp folder.
> - https://www.mozilla.org/en-US/firefox/98.0/releasenotes/

To make Firefox download such files into a proper temp folder again, the `about:config` setting `browser.download.start_downloads_in_tmp_dir` can be used
([beta 102.0 release notes](https://www.mozilla.org/en-US/firefox/102.0beta/releasenotes/)).

### Other Settings
- [`network.protocol-handler.external.mailto`](https://superuser.com/questions/363827/how-can-i-disable-add-application-for-mailto-links-bar-in-firefox)
	to disable "add application for mailto links".
- [`signon.includeOtherSubdomainsInLookup`](https://support.mozilla.org/en-US/questions/1275168)
	to disable autofill on a page from other subdomains of the site.
