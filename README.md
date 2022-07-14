# AspMcmeta
An asprite script to help with creating animated textures

## How to add the script to Aseprite
To start using the script all you have to do is download (or copy paste) the aspmcmeta.lua file into your script folder (file -> scripts -> Open Scripts Folder)
Now press the Reload scripts button, you should now have a script called aspmcmeta in the scripts menu.

## How to use the script


### How does it work
This script automaticly exports your asprite animation in the correct format for minecraft to understand, as well as adding the settings file for it (the .mcmeta file) so that minecraft plays each frame for the same duration as you had in your asprite animation.

### Using the script
Using this script is straight forward. Firstly you make the animation, then you run the script from the scripts menu (file -> scripts -> AspMcmeta), this will ask you for the name of the texture you are working on, so if you are making an animation for the iron ingot you would enter "iron_ingot". It will also ask you for the absolute path to the resource pack, as they can get quite long i recommend having the path on your clipboard to paste into the path feild.
When you have filled in both fields all you have to do is press "export", two files should now have been created at the path. <name>.png and <name>.png.mcmeta 

### Done
If you now equip the resouce packs and look at the item you just export, it should have the animation you made in asprite.

## Contributing
Feel welcome to make a pull request if you find a bug or an improvment to the script. This was my first lua script ever so there is most likely many big imporvments I could make.

## Found a bug?
If you find a bug please make submit an issue under the issues tab on github so I can fix it.
