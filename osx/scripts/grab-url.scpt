JsOsaDAS1.001.00bplist00�Vscript_i
function Utilities(app) {

    const DATABASE = "/Users/mateus.canelhas/Desktop/revolut/priv/limni/lists/state/limni.db"

    function quotedForm(s) { return "'" + s.replace(/'/g, "'\\''") + "'" }

    function withFile(filePath, callback) {

        try {
            const openedFile = app.openForAccess(Path(filePath), {
                writePermission: true
            })
            callback(openedFile)
            app.closeAccess(openedFile)

        }
        catch {
            app.closeAccess(filePath)
        }

    }

    function appendFile(openedFile, content) {
        app.write(content, { to: openedFile, startingAt: app.getEof(openedFile) })
    }


    function findTransitions(currentUrl) {
        const sql = `sqlite3 "${DATABASE}" "select transitions from state where url like '${currentUrl}' "`
        const transitions = app.doShellScript(sql)
        if (transitions) {
            return JSON.parse(transitions)
        }
        return []
    }

    function persistTransition(transition) {

        const content = JSON.stringify([...transition.previous, { time: transition.time, status: transition.status }]).replaceAll("\"","\\\"")
        console.log(quotedForm( content ))
        const sql = `sqlite3 "${DATABASE}" "replace into state( url, transitions) values ('${transition.resource}' , '${content}') "`
        app.doShellScript(sql)

    }
    return {
        withFile: withFile,
        appendFile: appendFile,
        findTransitions: findTransitions,
        persistTransition: persistTransition,
    }
}

function run() {


    const APPEND_FILE = "/Users/mateus.canelhas/Desktop/revolut/priv/limni/lists/stream/articles.tsv"

    var app = Application.currentApplication()
    app.includeStandardAdditions = true
    utils = Utilities(app)

    function persist(transition) {
        const content = `\n${transition.time}\t${transition.status}\t${transition.resource}`
        utils.withFile(APPEND_FILE, file => utils.appendFile(file, content))
        utils.persistTransition(transition)
    }

    function showPrompt(currentUrl) {
        previousTransitions = utils.findTransitions(currentUrl)

        list = previousTransitions.map(t => `${t.date}\t${t.status}`).join("\n")
        const choices = ["Queue", "History", "Good", "Premium", "Bad", "Explore"]
        const classification = app.chooseFromList(choices, {
            withPrompt: `About ${currentUrl}\n\n${list}`,
            defaultItems: [choices[0]]
        })
        if (classification) {
            const currentTime = new Date().toISOString().replace("T", " ").substring(0, 19)
            return { time: currentTime, status: classification[0], resource: currentUrl, previous: previousTransitions }
        }
    }


    const currentUrl = Application('Chrome').windows[0].activeTab.url()
    const transition = showPrompt(currentUrl)
    if (transition) {
        persist(transition)
    }

}


                               jscr  ��ޭ