<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<title>Mini Site Builder</title>
<style>
body {
    margin: 0;
    font-family: Arial;
    background: #0f172a;
    color: white;
}

.top {
    padding: 15px;
    background: #111827;
}

input, textarea {
    width: 100%;
    margin-top: 10px;
    padding: 10px;
    border: none;
    border-radius: 8px;
}

textarea {
    height: 120px;
    font-family: monospace;
    background: #0b1220;
    color: #22c55e;
}

button {
    margin-top: 10px;
    padding: 10px;
    border: none;
    border-radius: 8px;
    background: #22c55e;
    color: white;
    cursor: pointer;
}

.pages {
    padding: 15px;
}

.link {
    color: #60a5fa;
    cursor: pointer;
    display: block;
    margin-top: 5px;
}

.view {
    padding: 15px;
    border-top: 1px solid #1f2937;
}
</style>
</head>

<body>

<div class="top">
    <h2>🧠 Site Builder (HTML seul)</h2>

    <input id="name" placeholder="nom de page (ex: exemple)">
    <textarea id="code" placeholder="contenu HTML ici"></textarea>

    <button onclick="createPage()">➕ Créer page</button>
</div>

<div class="pages">
    <h3>📄 Pages créées :</h3>
    <div id="list"></div>
</div>

<div class="view" id="view">
    <h3>🌐 Aperçu</h3>
    <div id="content">Clique sur une page</div>
</div>

<script>
let pages = {};

function createPage() {
    let name = document.getElementById("name").value.trim();
    let code = document.getElementById("code").value;

    if (!name || !code) return;

    pages[name] = code;

    let link = document.createElement("div");
    link.className = "link";
    link.innerText = "monsite.com/" + name;

    link.onclick = () => openPage(name);

    document.getElementById("list").appendChild(link);

    document.getElementById("name").value = "";
    document.getElementById("code").value = "";
}

function openPage(name) {
    document.getElementById("content").innerHTML = pages[name];
}
</script>

</body>
</html>
