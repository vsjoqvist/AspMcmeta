function GetFrames()
    local frame = app.activeFrame

    --Get the first frame
    while(true) do 
        local new_frame = frame.previous
        if new_frame == nil then
            break        
        end
        frame = new_frame
    end
    
    local frames = {}
    
    -- Add all frames from first to last to the table
    local j = 0;
    while(true) do
        if frame == nil then
            break     
        end
        frames[j] = frame
        frame = frame.next
        j = j + 1
    end

    return frames
end

-- array of all the frames ordered from first to last
Frames = GetFrames()

local dlg = Dialog { title = "Export settings" }

local path = dlg.data.path

if path == nil then
    path = ""
end

dlg:entry{ id="name",
           label="texture name",
           text="",
           focus=true,
}

dlg:entry{ id="path",
           label="Path",
           text=path,
           focus=false,
}

dlg:button{ id="export",
            label="",
            text="export",  
            selected=false,
            focus=false,
            onclick=function()
                dlg:close()
                path = dlg.data.path
                if path:sub(#path, #path) ~= "/" then
                    path = path.."/"
                end
                local fullPath = path..dlg.data.name:gsub("%.png", "")..".png"

                -- export the animation
                Export(fullPath)
                
                --Write animation settings to .mcmeta file
                local filename = fullPath..".mcmeta"
                local mcmetafile = io.open( filename, "w")
                local settings = GetSettings()
                if mcmetafile ~= nil then
                    mcmetafile:write(settings)
                else 
                    print(fullPath.." is not a valid place to write the file to. do the directories exist?")
                end

                mcmetafile:close()
            end 
        }
dlg:show()

function GetSettings ()
    local settings = "{\"animation\":{\"frames\":["
    local settimgs_end = "]}}"

    for i = 0, #Frames do
        settings = settings.."{\"index\": "..tostring(Frames[i].frameNumber - 1)..", \"time\": "..tostring(math.floor(Frames[i].duration * 20)).."}"
        if i ~= #Frames then
            settings = settings..", "
        end
    end

    settings = settings..settimgs_end

    return settings
end

function Export(fullPath)
    app.command.ExportSpriteSheet {
        ui=false,
        askOverwrite=true,
        type=SpriteSheetType.VERTICAL,
        columns=Frames[0].sprite.height * #Frames + 1,
        rows=1,
        width=Frames[0].sprite.width,
        height=0,
        bestFit=false,
        textureFilename=fullPath,
        dataFilename="",
        dataFormat=SpriteSheetDataFormat.JSON_HASH,
        filenameFormat="png",
        borderPadding=0,
        shapePadding=0,
        innerPadding=0,
        trimSprite=false,
        trim=false,
        trimByGrid=false,
        extrude=false,
        ignoreEmpty=false,
        mergeDuplicates=false,
        openGenerated=false,
        layer="",
        tag="",
        splitLayers=false,
        splitTags=false,
        listLayers=true,
        listTags=true,
        listSlices=true
    }
end 

