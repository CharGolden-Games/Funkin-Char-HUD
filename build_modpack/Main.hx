package;

import haxe.zip.Compress;
import sys.io.FileSeek;
import haxe.Exception;
import haxe.io.Path;
import sys.FileSystem;
import sys.io.Process;
import metadata.GenerateMetadata;
import util.ZipUtil;

using StringTools;

typedef CMD = {
    var program:String;
    var args:Array<String>;
}

class Main
{
    static function isWindows():Bool
    {
        var home = Sys.getEnv("HOME");

        return home == null;
    }

    static function get_command():Array<String>
    {
        if (isWindows())
            return ['xcopy', null];

        return ["cp", "-r"];
    }

    static function combineArr<T:Dynamic>(arr1:Array<T>, arr2:Array<T>):Array<T>
    {
        var arr:Array<T> = [];
        for (item in arr2) arr1.push(item);
        for (item in arr1) if (item != null) arr.push(item);
        return arr;
    }

    static function resolvePath(path:String)
    {
        if (isWindows()) path.replace("/", "\\");

        return path;
    }

    public static function main()
    {
        var version = GenerateMetadata.genMeta().mod_version;
        var command:Array<String> = get_command();
        var commands:Array<CMD> = [
            {program: command[0], args: combineArr([command[1]], [resolvePath("./mod_pack/assets/"), resolvePath("./CharsFunkinHudModpack/")])},
            {program: command[0], args: combineArr([command[1]], [resolvePath("./mod_pack/metadata/"), resolvePath("./CharsFunkinHudModpack/")])},
            {program: command[0], args: combineArr([command[1]], [resolvePath("./mod_pack/source/"), resolvePath("./CharsFunkinHudModpack/scripts/")])},
        ];

        if (!FileSystem.exists("CharsFunkinHudModpack"))
        {
            FileSystem.createDirectory("CharsFunkinHudModpack");
        }
        else
        {
            if (!isWindows())
            {
                new Process("rm -rf ./CharsFunkinHudModpack");
            }
            else
            {
                new Process("del /A /F /Q /S .\\CharsFunkinHudModpack");
            }
        }

        for (cmd in commands)
        {
            trace(cmd);
            try
            {
                var f = cmd.program;
                for (arg in cmd.args)
                {
                    f += ' ' + arg.replace("/", "\\");
                }
                if (isWindows()) f += " /E /I /H";
                trace(f);
                var p = new Process(f);

                p.exitCode();
                trace(p.stdout.readAll().toString());
            }
            catch (e:Exception)
            {
                trace(e.stack.toString());
            }
        }

        ZipUtil.zipDir('CharsFunkinHudModpack', "Chars_Funkin_HUD-" + version);
    }
}