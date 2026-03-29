#! /bin/bash
# Copyright (C) 2019-2025 Igara Studio S.A.

# $1 = first sprite sheet json file
# $2 = second sprite sheet json file
function compare_sheet_data() {
    cat $1 | grep -v "\"image\"" > $1-tmp
    cat $2 | grep -v "\"image\"" > $2-tmp
    diff -u $1-tmp $2-tmp
}

# --sheet and STDOUT

d=$t/sheet
mkdir $d # we need to create the directory because the >STDOUT redirection
if ! $PIXELFORGE -b sprites/1empty3.pixelforge --sheet "$d/sheet.png" > "$d/stdout.json" ; then
   exit 1
fi
cat >$d/compare.lua <<EOF
local data = json.decode(io.open('$d/stdout.json'):read('a'))
local frames = { data.frames['1empty3 0.pixelforge'],
                 data.frames['1empty3 1.pixelforge'],
                 data.frames['1empty3 2.pixelforge'] }
assert(frames[1].frame.x == 0)
assert(frames[2].frame.x == 32)
assert(frames[3].frame.x == 64)
for i,v in ipairs(frames) do
  assert(v.frame.y == 0)
  assert(v.frame.w == 32)
  assert(v.frame.h == 32)
end
EOF
$PIXELFORGE -b -script "$d/compare.lua" || exit 1

# --sheet --data

d0=$d
d=$t/sheet-data
$PIXELFORGE -b sprites/1empty3.pixelforge --sheet "$d/sheet.png" --data "$d/sheet.json" || exit 1
compare_sheet_data $d0/stdout.json $d/sheet.json || exit 1
cat >$d/compare.lua <<EOF
local orig = app.open("sprites/1empty3.pixelforge")
local sheet = app.open("$d/sheet.png")
local expected = Image(orig.width*3, orig.height, orig.colorMode)
expected:clear()
for f = 1,3 do
  expected:drawSprite(orig, f, (f-1)*orig.width, 0)
end
assert(expected:isEqual(sheet.cels[1].image))
EOF
$PIXELFORGE -b -script "$d/compare.lua" || exit 1

# vertical sprite sheet

d=$t/vertical-sheet
mkdir $d
# TODO this should be possible in a future
# $PIXELFORGE -b sprites/1empty3.pixelforge -sheet-type vertical --sheet "$d/sheet.png" --data "$d/sheet.json" || exit 1
cat >$d/create.lua <<EOF
local sprite = app.open("sprites/1empty3.pixelforge")
app.command.ExportSpriteSheet {
  type="vertical",
  textureFilename="$d/sheet1.png",
  dataFilename="$d/sheet1.json"
}
app.command.ExportSpriteSheet {
  type=SpriteSheetType.VERTICAL,
  textureFilename="$d/sheet2.png",
  dataFilename="$d/sheet2.json"
}
EOF
$PIXELFORGE -b -script "$d/create.lua" || exit 1
compare_sheet_data "$d/sheet1.json" "$d/sheet2.json" || exit 1
cmp "$d/sheet1.png" "$d/sheet2.png" || exit 1
cat >$d/compare.lua <<EOF
local orig = app.open("sprites/1empty3.pixelforge")
local sheet = app.open("$d/sheet1.png")
local expected = Image(orig.width, orig.height*3, orig.colorMode)
expected:clear()
for f = 1,3 do
  expected:drawSprite(orig, f, 0, (f-1)*orig.height)
end
assert(expected:isEqual(sheet.cels[1].image))
EOF
$PIXELFORGE -b -script "$d/compare.lua" || exit 1

# --split-layers --sheet --data

d=$t/split-layers-sheet-data
$PIXELFORGE -b --split-layers sprites/1empty3.pixelforge \
          --filename-format "{layer}-{frame}" \
          --sheet "$d/sheet.png" \
          --data "$d/sheet.json" || exit 1
cat >$d/compare.lua <<EOF
local data = json.decode(io.open('$d/sheet.json'):read('a'))
assert(data.meta.size.w == 96)
assert(data.meta.size.h == 64)

local orig = app.open("sprites/1empty3.pixelforge")
local sheet = app.open("$d/sheet.png")
local expected = Image(orig.width*3, orig.height*2, orig.colorMode)
expected:clear()
for lay = 1,2 do
  orig.layers[1].isVisible = (lay == 1)
  orig.layers[2].isVisible = (lay == 2)
  for frm = 1,3 do
    local x, y = (frm-1)*orig.width, (lay-1)*orig.height
    expected:drawSprite(orig, frm, x, y)

    local frmData = data.frames[orig.layers[lay].name .. '-' .. (frm-1)]
    assert(frmData.frame.x == x)
    assert(frmData.frame.y == y)
    assert(frmData.frame.w == 32)
    assert(frmData.frame.h == 32)
  end
end
assert(expected:isEqual(sheet.cels[1].image))
EOF
$PIXELFORGE -b -script "$d/compare.lua" || exit 1

# Test that the transparent color persists in the output sheet

d=$t/sheet-custom-transparent-index
if ! $PIXELFORGE -b sprites/bg-index-3.pixelforge -sheet "$d/sheet.pixelforge" -data "$d/sheet.json" ; then
    exit 1
fi
cat >$d/compare.lua <<EOF
local original = Sprite{ fromFile='sprites/bg-index-3.pixelforge' }
assert(original.transparentColor == 3)
local sheet = Sprite{ fromFile='$d/sheet.pixelforge' }
assert(sheet.transparentColor == 3)
EOF
$PIXELFORGE -b -script "$d/compare.lua" || exit 1

# Don't discard empty frames if -ignore-empty is not used (even if -trim is used)
# https://github.com/pixelforge/pixelforge/issues/2116
# -layer -trim -ignore-empty -list-tags -sheet -data

d=$t/sheet-trim-without-ignore-empty
$PIXELFORGE -b \
          -list-tags \
          -layer "c" \
          "sprites/tags3.pixelforge" \
          -trim \
          -sheet-pack \
          -sheet "$d/sheet1.png" \
          -format json-array \
          -data "$d/sheet1.json" || exit 1
$PIXELFORGE -b \
          -list-tags \
          -layer "c" \
          "sprites/tags3.pixelforge" \
          -trim -ignore-empty \
          -sheet-pack \
          -sheet "$d/sheet2.png" \
          -format json-array \
          -data "$d/sheet2.json" || exit 1

cat >$d/check.lua <<EOF
local sheet1 = json.decode(io.open('$d/sheet1.json'):read('a'))
local sheet2 = json.decode(io.open('$d/sheet2.json'):read('a'))
assert(#sheet1.frames == 12)
assert(#sheet2.frames == 4)
EOF
$PIXELFORGE -b -script "$d/check.lua" || exit 1

# -sheet -sheet-columns vs -sheet-rows

d=$t/sheet-columns-and-rows
$PIXELFORGE -b -split-layers sprites/1empty3.pixelforge \
          -filename-format "{layer}{frame}" \
          -sheet "$d/sheet1.png" \
          -sheet-type rows \
          -sheet-columns 3 \
          -data "$d/sheet1.json" || exit $?
$PIXELFORGE -b -split-layers sprites/1empty3.pixelforge \
          -filename-format "{layer}{frame}" \
          -sheet "$d/sheet2.png" \
          -sheet-type columns \
          -sheet-rows 3 \
          -data "$d/sheet2.json" || exit $?
$PIXELFORGE -b \
          -script-param file1=$d/sheet1.json \
          -script-param file2=$d/sheet2.json \
          -script scripts/compare_sprite_sheets.lua || exit $?

# -sheet -trim vs -trim-sprite

d=$t/sheet-columns-and-rows
$PIXELFORGE -b -split-layers sprites/1empty3.pixelforge \
          -trim \
          -filename-format "{layer}{frame}" \
          -sheet "$d/sheet1.png" \
          -data "$d/sheet1.json" || exit $?

$PIXELFORGE -b -split-layers sprites/1empty3.pixelforge \
          -trim-sprite \
          -filename-format "{layer}{frame}" \
          -sheet "$d/sheet2.png" \
          -data "$d/sheet2.json" || exit $?
$PIXELFORGE -b \
          -script-param file1=$d/sheet1.json \
          -script-param file2=$d/sheet2.json \
          -script scripts/compare_sprite_sheets.lua || exit $?

# Test all sprite sheet types
# -sheet horizontal/vertical/rows/columns/packed
d=$t/sheet-all-types
for type in horizontal vertical rows columns packed ; do
    $PIXELFORGE -b "sprites/tags3.pixelforge" \
              -sheet-type $type -sheet "$d/$type.png" \
              -format json-array -data "$d/$type.json" || exit $?

    $PIXELFORGE -b -split-layers "sprites/tags3.pixelforge" \
              -sheet-type $type -sheet "$d/$type-layers.png" \
              -format json-array -data "$d/$type-layers.json" || exit $?

    $PIXELFORGE -b -split-layers -merge-duplicates "sprites/tags3.pixelforge" \
              -sheet-type $type -sheet "$d/$type-layers-merge-duplicates.png" \
              -format json-array -data "$d/$type-layers-merge-duplicates.json" || exit $?

    $PIXELFORGE -b -split-tags "sprites/tags3.pixelforge" \
              -sheet-type $type -sheet "$d/$type-tags.png" \
              -format json-array -data "$d/$type-tags.json" || exit $?

    $PIXELFORGE -b -split-tags -trim "sprites/tags3.pixelforge" \
              -sheet-type $type -sheet "$d/$type-tags-trim.png" \
              -format json-array -data "$d/$type-tags-trim.json" || exit $?

    $PIXELFORGE -b -split-layers -split-tags "sprites/tags3.pixelforge" \
              -sheet-type $type -sheet "$d/$type-layer-tags.png" \
              -format json-array -data "$d/$type-layer-tags.json" || exit $?
done

for type in horizontal vertical rows columns ; do
    for subtype in "" "-layers" "-layers-merge-duplicates" "-tags" "-tags-trim" "-layer-tags" ; do
        $PIXELFORGE -b \
                  -script-param file1=$d/packed$subtype.json \
                  -script-param file2=$d/$type$subtype.json \
                  -script scripts/compare_sprite_sheets.lua || exit $?
    done
done

# "Trim Cels" (-trim) with -merge-duplicates didn't generate the
# correct "spriteSourceSize" for each frame.
# https://igarastudio.zendesk.com/agent/tickets/407
d=$t/ticket-407
for layer in a b ; do
    $PIXELFORGE -b -layer "$layer" "sprites/point4frames.pixelforge" \
              -trim \
              -data "$d/data1-$layer.json" \
              -format json-array -sheet "$d/sheet1-$layer.png" || exit 1
    $PIXELFORGE -b -layer "$layer" "sprites/point4frames.pixelforge" \
              -trim -merge-duplicates \
              -data "$d/data2-$layer.json" \
              -format json-array -sheet "$d/sheet2-$layer.png" || exit 1
    cat >$d/compare.lua <<EOF
local data1 = json.decode(io.open('$d/data1-$layer.json'):read('a'))
local data2 = json.decode(io.open('$d/data2-$layer.json'):read('a'))
assert(#data1.frames == #data2.frames)
for i = 1,#data1.frames do
    local a = data1.frames[i].spriteSourceSize
    local b = data2.frames[i].spriteSourceSize
    assert(a.x == b.x)
    assert(a.y == b.y)
    assert(a.w == b.w)
    assert(a.h == b.h)
end
EOF
    $PIXELFORGE -b -script "$d/compare.lua" || exit 1
done

# Same problem as in ticket 407 but with "sourceSize" field and
# different sprites in the same texture atlas.
d=$t/ticket-407-w-atlas
$PIXELFORGE -b \
          -layer a "sprites/point4frames.pixelforge" \
          "sprites/point2frames.pixelforge" \
          -data "$d/data1.json" \
          -format json-array -sheet "$d/sheet1.png" || exit 1
$PIXELFORGE -b \
          -layer a "sprites/point4frames.pixelforge" \
          "sprites/point2frames.pixelforge" \
          -trim \
          -data "$d/data2.json" \
          -format json-array -sheet-pack -sheet "$d/sheet2.png" || exit 1
cat >$d/compare.lua <<EOF
local data1 = json.decode(io.open('$d/data1.json'):read('a'))
local data2 = json.decode(io.open('$d/data2.json'):read('a'))
assert(#data1.frames == #data2.frames)
for i = 1,#data1.frames do
    local a = data1.frames[i].sourceSize
    local b = data2.frames[i].sourceSize
    assert(a.w == b.w)
    assert(a.h == b.h)
end
EOF
$PIXELFORGE -b -script "$d/compare.lua" || exit 1

# https://github.com/pixelforge/pixelforge/issues/2380
# Check that -split-layers and -list-layers include group information
d=$t/issue-2380
$PIXELFORGE -b -trim -all-layers "sprites/groups3abc.pixelforge" -data "$d/sheet1.json" -format json-array -sheet "$d/sheet1.png" -list-layers
$PIXELFORGE -b -trim -all-layers -split-layers "sprites/groups3abc.pixelforge" -data "$d/sheet2.json" -format json-array -sheet "$d/sheet2.png" -list-layers
cat >$d/check.lua <<EOF
local sheet1 = json.decode(io.open('$d/sheet1.json'):read('a'))
local sheet2 = json.decode(io.open('$d/sheet2.json'):read('a'))
assert(#sheet1.meta.layers == 12)
assert(#sheet2.meta.layers == 12)
assert(json.encode(sheet1.meta.layers) == json.encode(sheet2.meta.layers))
EOF
$PIXELFORGE -b -script "$d/check.lua" || exit 1

# https://github.com/pixelforge/pixelforge/issues/2432
# -ignore-layer is ignoring extra layers when -split-layers is used
d=$t/issue-2432
$PIXELFORGE -b -trim -ignore-layer "c" -all-layers "sprites/groups3abc.pixelforge" -data "$d/sheet1.json" -format json-array -sheet "$d/sheet1.png" -list-layers
$PIXELFORGE -b -trim -ignore-layer "c" -all-layers -split-layers "sprites/groups3abc.pixelforge" -data "$d/sheet2.json" -format json-array -sheet "$d/sheet2.png" -list-layers
cat >$d/check.lua <<EOF
local sheet1 = json.decode(io.open('$d/sheet1.json'):read('a'))
local sheet2 = json.decode(io.open('$d/sheet2.json'):read('a'))
assert(#sheet1.meta.layers == 8)
assert(#sheet2.meta.layers == 8)
assert(json.encode(sheet1.meta.layers) == json.encode(sheet2.meta.layers))
EOF
$PIXELFORGE -b -script "$d/check.lua" || exit 1

# https://github.com/pixelforge/pixelforge/issues/2600
# -merge-duplicates -split-layers -trim give incorrect 'frame' coordinates on linked cels
d=$t/issue-2600
$PIXELFORGE -b -list-layers -format json-array -trim -merge-duplicates -split-layers -all-layers "sprites/link.pixelforge" -data "$d/sheet.json" -sheet "$d/sheet.png"
cat >$d/check.lua <<EOF
local sheet = json.decode(io.open('$d/sheet.json'):read('a'))
local restoredSprite = Sprite(sheet.frames[1].sourceSize.w, sheet.frames[1].sourceSize.h, ColorMode.RGB)
local spriteSheet = Image{ fromFile="$d/sheet.png" }
local lay = 1
repeat
  local layerName = sheet.meta.layers[lay].name
  local layer = restoredSprite.layers[lay]
  for i=1, #sheet.frames do
    if string.find(sheet.frames[i].filename, layerName) ~= nil then
      local sample = sheet.frames[i]
      local dotAseIndex = string.find(sample.filename, ".ase")
      local frame = (string.sub(sample.filename, dotAseIndex - 2, dotAseIndex - 1)) + 1
      for f=#restoredSprite.frames, frame-1 do
        restoredSprite:newEmptyFrame()
      end
      local image = Image(sample.frame.w, sample.frame.h)
      for y=0,image.height-1 do
        for x=0,image.width-1 do
          image:drawPixel(x, y, spriteSheet:getPixel(sample.frame.x + x, sample.frame.y + y))
        end
      end
      restoredSprite:newCel(layer, frame, image, Point(sample.spriteSourceSize.x, sample.spriteSourceSize.y))
    end
  end
  if lay < #sheet.meta.layers then
    restoredSprite:newLayer()
  end
  lay = lay + 1
until(lay > #sheet.meta.layers)

app.activeSprite = restoredSprite
app.activeLayer = restoredSprite.layers[#restoredSprite.layers]
for i=1,#restoredSprite.layers-1 do
  app.command.MergeDownLayer()
end

local orig = app.open("sprites/link.pixelforge")
app.activeSprite = orig
app.activeLayer = orig.layers[#orig.layers]
for i=1,#orig.layers-1 do
  app.command.MergeDownLayer()
end

assert(orig.width == restoredSprite.width)
assert(orig.height == restoredSprite.height)
assert(#orig.frames == #restoredSprite.frames)
for fr=1,#restoredSprite.frames do
  for celIndex1=1,#restoredSprite.cels do
    if restoredSprite.cels[celIndex1].frameNumber == fr then
      for celIndex2=1,#orig.cels do
        if orig.cels[celIndex2].frameNumber == fr then
          assert(orig.cels[celIndex2].position == restoredSprite.cels[celIndex1].position)
          if orig.cels[celIndex2].image ~= nil and restoredSprite.cels[celIndex1].image ~= nil then
            assert(orig.cels[celIndex2].image:isEqual(restoredSprite.cels[celIndex1].image))
          end
        end
      end
    end
  end
end
EOF
$PIXELFORGE -b -script "$d/check.lua" || exit 1

# Test solution to #1514 using new --tagname-format
d=$t/issue-1514
$PIXELFORGE -b "sprites/1empty3.pixelforge" "sprites/tags3.pixelforge" \
          -data "$d/atlas.json" \
          -format json-array \
          -sheet "$d/atlas.png" \
          -list-tags -tagname-format="{title}-{tag}" || exit 1
cat >$d/compare.lua <<EOF
local data = json.decode(io.open('$d/atlas.json'):read('a'))
assert(#data.meta.frameTags == 5)

local tags = {}
for i,t in ipairs(data.meta.frameTags) do
  tags[t.name] = t
end

t = tags["1empty3-a"]      assert(t.from == 0 and t.to == 1)
t = tags["1empty3-b"]      assert(t.from == 2 and t.to == 2)
t = tags["tags3-forward"]  assert(t.from == 0 and t.to == 3)
t = tags["tags3-reverse"]  assert(t.from == 4 and t.to == 7)
t = tags["tags3-pingpong"] assert(t.from == 8 and t.to == 11)
EOF
$PIXELFORGE -b -script "$d/compare.lua" || exit 1

# https://github.com/pixelforge/pixelforge/issues/5053
# --export-tileset in different pixel formats
d=$t/export-tileset
$PIXELFORGE -b -export-tileset "sprites/2x2tilemap2x2tile.pixelforge" "sprites/2x3tilemap-indexed.pixelforge" "sprites/3x2tilemap-grayscale.pixelforge" \
          -data "$d/tilesets.json" \
          -format json-array \
          -sheet "$d/tilesets.png" || exit 1
cat >$d/compare.lua <<EOF
local file = app.params["file"]
local spriteSheet = Sprite{ fromFile=file }
local sheetImage = spriteSheet.layers[1].cels[1].image
local filenames = { "sprites/2x2tilemap2x2tile.pixelforge", "sprites/2x3tilemap-indexed.pixelforge", "sprites/3x2tilemap-grayscale.pixelforge" }
local origins = { Point(0, 0), Point(0, 2), Point(0, 5) }
for k=1, #filenames do
  local spr = Sprite{ fromFile=filenames[k] }
  if spr.colorMode ~= spriteSheet.colorMode then
    app.sprite = spr
    app.command.ChangePixelFormat { format="rgb" }
  end
  local ts = spr.layers[1].tileset
  local origin = origins[k]
  for i=0, #ts-1 do
    local tileImage = ts:getTile(i)
    local offset = Point(origin.x + i*tileImage.width, origin.y)
    for y=0, tileImage.height-1 do
      for x=0, tileImage.width-1 do
        assert(tileImage:getPixel(x, y) == sheetImage:getPixel(offset.x + x, offset.y + y))
      end
    end
  end
end
EOF
$PIXELFORGE -b -script-param file=$d/tilesets.png \
          -script "$d/compare.lua" || exit 1
