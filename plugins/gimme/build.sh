# This is a simple script that compiles the plugin using the free Flex SDK on Linux/Mac.
# Learn more at http://developer.longtailvideo.com/trac/wiki/PluginsCompiling

# if needed, change this to suit your environment
# FLEXPATH=/c/src/vendor/flex_sdk_3

echo "Compiling plugin..."
$FLEXPATH/bin/mxmlc ./Gimme.as -sp ./ -o ./gimme.swf -use-network=false