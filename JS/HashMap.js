
function HashMap() {
    let map = {};

    return {
        put: function (key, value) {
            if (key) {
                map[key] = value;
            }
        },
        get: function (key) {
            return map[key];
        },
        keys: function () {
            return Object.keys(map);
        },
        contains: function (key) {
            return key in map;
        },
        clear: function () {
            for (let key in map) {
                delete map[key];
            }
        }
    }
}