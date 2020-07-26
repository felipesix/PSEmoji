# PSEmoji
Using emojis with Powershell has never been more fun and easy! 
But, what's the excitement about it? well if you have watched <a href="https://www.youtube.com/watch?v=8gw0rXPMMPE">this Microsoft new windows terminal release trailer</a> you know what I'm saying right?!

That's right, among all other several amazing features Microsoft has been providing with the new windows terminal one is the ability to render beatiful emojis!

So with that said, all you need to do is some UTF-32 encoding to display your emojis, the downside is that you would have to do it everytime, you could of course save a static variable in your Powershell profile, or even creating your own function for it, that's fine, but PSEmoji module brings it to the next level! 

With PSEmoji module, you can have how many emojis available you want in your terminal, organized the way you want, and anywhere you are!, that's cool right? so this is how it works.
### Installation
```PowerShell
# install module
Install-Module PSEmoji -PSRepository PSGallery -Force -Verbose

# import module
Import-Module PSEmoji -Verbose
```
### How to access emojis
The emojis will be available on nested properties in property <b>emojis</b> of <b>$PSEMOJI</b> variable
```Powershell
# Syntax example: $PSEMOJI.emojis.[emoji-category].[emoji-name]
$PSEMOJI.emojis.face.happy
```
### Manipulating your emojis
After you install and import <b>PSEmoji</b> module, this will export a new variable <b>$PSEMOJI</b> and 6 Powershell functions.
The $PSEMOJI variable is an object instance of a custom class <b>psemoji</b> and this is what you'll use for manipulating and using your emojis.  
There are 4 functions for manipulating <b>$PSEMOJI</b>:

```Powershell
# Adds new emojis
Add-PSEmoji

# Create new emoji category
New-PSEmojiCategory

# Removes existent emojis
Remove-PSEmoji

# Removes existent emoji category
Remove-PSEmojiCategory
```
### Importing / Exporting
There'll be two functions available for importing/exporting your emojis so you can use it everywhere!

```Powershell
# Export your emojis
Export-PSEmojiUnicodeJson -OutFilePath "[file system path of your choice]"

# Import your emojis
Import-PSEmojiUnicodeJson -Path "[path to your EmojiUnicode.json file]"
```
### Creating new emoji category and adding a new emoji to it
![example](/media/new_category_example.png)
