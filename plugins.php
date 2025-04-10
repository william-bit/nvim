<?php

$luaPlugins = scandir('lua/plugins');
$luaPluginsCombine = '';
foreach ($luaPlugins as $luaPlugin) {
    if (!in_array($luaPlugin, ['.', '..', 'out'])) {
        $fileContent = array_filter(explode("\n", file_get_contents('lua/plugins/' . $luaPlugin)));
        array_shift($fileContent);
        array_pop($fileContent);
        $luaPluginsCombine .= implode("\n", $fileContent) . "\n";
    }
}
file_put_contents('lua/plugins/out/plugins.lua', "return {\n" . $luaPluginsCombine . "\n}");
