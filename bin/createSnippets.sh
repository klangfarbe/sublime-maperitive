#!/bin/zsh

#IFS=$'\n'

properties=(
"map.rendering align-horizontal (alignment, local): Horizontal alignment"
"map.rendering align-vertical (alignment, local): Vertical alignment"
"map.rendering border-opacity (opacity, local): Border opacity"
"map.rendering border-style (dash style, local): Border style"
"map.rendering border-width (non-negative value, local): Border width"
"map.rendering contour.label (boolean, local): Specifies whether the contour symbol should place contour labels"
"map.rendering curved (boolean, local): Indicates whether polylines be drawn as curves"
"map.rendering fill-color (color, local): Fill color"
"map.rendering fill-hatch (hatch style, local): Fill hatch"
"map.rendering fill-hatch-color (color, local): Fill hatch second color"
"map.rendering fill-hatch-opacity (opacity, local): Fill hatch second color opacity"
"map.rendering fill-opacity (opacity, local): Fill opacity"
"map.rendering fill-texture (resoure location, local): Location of image to use as the fill texture"
"map.rendering font-family (font family, local): Font family"
"map.rendering font-size (non-negative value, local): Font size"
"map.rendering font-stretch (aspect ratio, local): Specifies how much to stretch the font on a horizontal axis (default value of 1 means no stretch)"
"map.rendering font-style (font style, local): Font style (normal/italic)"
"map.rendering font-weight (font weight, local): Font weight (normal/bold)"
"map.rendering icon-image (resoure location, local): Location of icon image"
"map.rendering icon-width (non-negative value, local): Icon width"
"map.rendering lflp.max-allowed-corner-angle (integer, local): Line feature label placement: max allowed corner angle"
"map.rendering lflp.max-compression (real number, local): Line feature label placement: max compression"
"map.rendering lflp.min-buffer-space (real number, local): Line feature label placement: min buffer space"
"map.rendering line-color (color, local): Line color"
"map.rendering line-end-cap (line cap, local): Line end cap type"
"map.rendering line-hatch (hatch style, local): Line hatch"
"map.rendering line-hatch-color (color, local): Line hatch second color"
"map.rendering line-hatch-opacity (opacity, local): Line hatch second color opacity"
"map.rendering line-join (line join, local): Line join type"
"map.rendering line-offset (non-negative value, local): Line offset"
"map.rendering line-offset-miter-limit (value greater or equal to 1, local): Miter limit for offset lines"
"map.rendering line-offset-sides (line offset sides, local): Specifies on which sides to offset the line"
"map.rendering line-opacity (opacity, local): Line opacity"
"map.rendering line-start-cap (line cap, local): Line staty cap type"
"map.rendering line-style (dash style, local): Line style"
"map.rendering line-width (non-negative value, local): Line width"
"map.rendering map-background-color (color, global): Background color of the map"
"map.rendering map-background-opacity (opacity, global): Opacity of the map background"
"map.rendering map-sea-color (color, global): Color of the sea on the map"
"map.rendering map-sea-opacity (opacity, global): Opacity of the sea on the map"
"map.rendering map-sea-texture (resoure location, local): Location of image to use as the texture for the sea on the map"
"map.rendering max-zoom (zoom, local): Maximum zoom level a feature is visible at"
"map.rendering min-zoom (zoom, local): Minimum zoom level a feature is visible at"
"map.rendering placement-value (non-negative value, local): The value of the feature used for automatic label placement"
"map.rendering shape (shape type, local): Shape to draw"
"map.rendering shape-aspect (aspect ratio, local): Custom shape\'s aspect ratio"
"map.rendering shape-def (shape definition, local): A definition of a custom shape"
"map.rendering shape-mode (shape mode, local): Specifies how the shapes should be drawn when the feature is of the line or the area type"
"map.rendering shape-orientation (shape orientation, local): Specifies the orientation of the custom shape"
"map.rendering shape-size (non-negative value, local): Shape size (in pixels)"
"map.rendering shape-spacing (zoom factor value, local): Shape spacing"
"map.rendering shield-padding-bottom (zoom factor value, local): Bottom padding between the shield and the text (in pixels)"
"map.rendering shield-padding-left (zoom factor value, local): Left padding between the shield and the text (in pixels)"
"map.rendering shield-padding-right (zoom factor value, local): Right padding between the shield and the text (in pixels)"
"map.rendering shield-padding-top (zoom factor value, local): Top padding between the shield and the text (in pixels)"
"map.rendering shield-resize-mode (shield resize mode, local): How the shield should be resized according to text contents"
"map.rendering text (label definition, local): Specifies the label to use as text of the feature"
"map.rendering text-align-horizontal (alignment, local): Horizontal alignment of the text"
"map.rendering text-align-vertical (alignment, local): Vertical alignment of the text"
"map.rendering text-avoid-overlaps (boolean, local): Indicates whether the text labels overlapping should be avoided"
"map.rendering text-color (color, local): Text color"
"map.rendering text-decoration (text decoration, local): Text decoration (none/underline)"
"map.rendering text-direction (text direction, local): Text direction (auto/rtl)"
"map.rendering text-func (text, local): Specifies the scripting function for generating text label"
"map.rendering text-halo-color (color, local): Color of the text halo (outline)"
"map.rendering text-halo-opacity (opacity, local): Opacity of the text halo (outline)"
"map.rendering text-halo-width (non-negative value, local): Width of the text halo (outline)"
"map.rendering text-letter-spacing (zoom factor value, local): Letter spacing for text (as ratio to font-size, 0 is the default)"
"map.rendering text-line-spacing (aspect ratio, local): Line spacing for text (as ratio, 1 is the default normal spacing)"
"map.rendering text-max-width (aspect ratio, local): Maximum width of the text (as aspect ratio to font-size)"
"map.rendering text-offset-horizontal (zoom factor value, local): How much to offset the text on its horizontal axis (as aspect ratio to font-size)"
"map.rendering text-offset-vertical (zoom factor value, local): How much to offset the text on its vertical axis (as aspect ratio to font-size)"
"map.rendering text-opacity (opacity, local): Text opacity"
"map.rendering text-orientation (shape orientation, local): Specifies the orientation of the text on linear features"
"map.rendering topmost-layer (boolean, local): Indicates whether to override the OSM layer tag and draw a feature as a topmost layer"
"map.rendering webmap.zoom-factor-correction (real number, global): The zoom correction to use for web maps. Values higher than 0 will make grainer web maps but will load quicker."
)

ROOT=$(git rev-parse --show-toplevel)

WORD="\([-[:alnum:]_\.]*\)"
REGEX="map.${WORD} ${WORD} (\(.*\), [a-zA-Z]*): *\(.*\)"

rm -rf snippet/*

for i in ${properties[@]}; do
    category=`echo $i | sed -e "s/${REGEX}/\1/"`
    cmd=`echo $i | sed -e "s/${REGEX}/\2/"`
    arg=`echo $i | sed -e "s/${REGEX}/\3/"`
    description=`echo $i | sed -e "s/${REGEX}/\4/" | sed -e s'$/$|$'`
    file="snippets/${category}/prop-${cmd}.sublime-snippet"

    echo "creating $file"
    echo "<snippet>" > $file
    echo "  <content><![CDATA[${cmd} : \${1:${arg}}]]></content>" >> $file
    echo "  <tabTrigger>osm:${cmd}</tabTrigger>" >> $file
    echo "  <scope>source.maperitive</scope>" >> $file
    echo "  <description>    ${description}</description>" >> $file
    echo "</snippet>" >> $file
done
