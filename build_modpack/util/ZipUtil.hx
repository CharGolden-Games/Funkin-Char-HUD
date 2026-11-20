package util;

import sys.FileSystem;
import sys.io.File;
import haxe.io.Bytes;
import sys.io.Process;

using StringTools;

class ZipUtil {
	public static var has_7zip(get, never):Bool;
	public static var _7zCmd:String = "7z";
    
    static function isWindows():Bool
    {
        var home = Sys.getEnv("HOME");

        return home == null;
    }

	static function get_has_7zip():Bool {
		try {
			run(_7zCmd, []);
			return true;
		} catch (e:Dynamic) {
			return false;
		}
	}

	static function run(cmd:String, args:Array<String>) {
		var p = new Process(cmd, args);
		var exit = p.exitCode(true);
		if (exit != 0)
			throw 'Zip command failed (exit $exit): $cmd ' + args.join(" ") + "\nPrint Out:\n" + p.stderr.readAll().toString();
		else
			trace(p.stdout.readAll().toString());
	}

	public static function zipDir(dirPath:String, outZip:String):Bytes {
		outZip = outZip += ".zip";
		if (FileSystem.exists(outZip)) {
			FileSystem.deleteFile(outZip);
		}

		if (isWindows())
        {
            if (!has_7zip)
                throw "You must have 7Zip to use zip files";
            try {
                run(_7zCmd, ["a", outZip, ("./" + dirPath + "/*").replace("//*", "/*")]);
            } catch (e:Dynamic) {
                trace(e);
                throw 'No zip tool found. Install 7-Zip (7z) and ensure it exists on PATH.';
            }
        }
		else
        {
            try {
                run("zip", ["-r", outZip, dirPath]);
            } catch (e:Dynamic) {
                trace(e);
                throw 'No zip tool found. Install "zip" and ensure it exists on PATH.';
            }
		}

		return File.getBytes(outZip);
	}
}
