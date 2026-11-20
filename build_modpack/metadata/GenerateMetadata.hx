package metadata;

import sys.io.File;
import haxe.Json;
import thx.semver.Version;

typedef PolyContri = {
    var name:String;
    var role:String;
    var url:String;
}

typedef PolymodMeta = {
    var title:String;
    var description:String;
    var contributors:Array<PolyContri>;
    var api_version:String;
    var mod_version:String;
    var license:String;
}

class GenerateMetadata
{
    public static var modpack_version:Version = [3,2,0]; // The actual pack version.
    public static var api_version:Version = [0,8,0]; // The Funkin' Version the modpack targets.
    public static var license:String = "Apache-2.0";

    public static var title:String = "Char's Funkin HUD Modpack";
    public static var desc:String = "A mod that adds some QOL changes to Funkin' as well as some visual additions!";
    public static var contributors:Array<PolyContri> = [
        {
            name: "CharGoldenYT",
            role: "Coder",
            url: "https://vschar-official.com"
        }
    ];

    public static function genMeta():PolymodMeta
    {
        var funny:PolymodMeta = {
            title: title,
            description: desc,
            contributors: contributors,
            mod_version: modpack_version,
            api_version: api_version,
            license: license
        };

        var str = Json.stringify(funny, null, '\t');

        trace(str);
        File.saveContent("mod_pack/metadata/_polymod_meta.json", str);

        return funny;
    }
}