import vm.lua.Lua;

class Main {
    static function main() {
        var lua = new Lua();
        lua.run('print("Hello, ${lua.version}!!")');
        lua.destroy();
    }
}
