function makePage(param) { //생성자

    var tag = param.tag || "<li>$$page</li>";
    var pageSize = param.pageSize || 10;
    var liCount = param.numSize || 10;
    var callback = param.callback;
    var total = param.total || 0;
    var current = param.current || 1;

    var tempEnd = makeTempEnd();
    var startNum = makeStart();
    var realEnd = makeRealEnd();
    var prev = startNum - 1;
    var next = realEnd * pageSize > total ? 0 : realEnd + 1;

//    console.log("tempEnd" + tempEnd);
//    console.log("startNum" + startNum);
//    console.log("realEnd" + realEnd);
//    console.log("prev" + prev);
//    console.log("next" + next);
//    console.log(makeTags());

    function makeTags() {
        var str = "";

        if (prev > 1) {
            str += tag.replace('$$page', prev);
        }

        for (var i = 0; i < realEnd; i++) {
            str += tag.replace('$$page', (i+1));
        }

        if (next > 1) {
            str += tag.replace("$$page", next);
        }

        return str;
    }

    function makeTempEnd() {
        return Math.ceil(current / liCount) * liCount;
    }

    function makeStart() {
        return tempEnd - (liCount - 1);
    }

    function makeRealEnd() {
        var lastPage = Math.ceil(total / pageSize);
        return tempEnd > lastPage ? lastPage : tempEnd;
    }

    
    return makeTags();
}