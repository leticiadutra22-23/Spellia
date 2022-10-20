![image](https://user-images.githubusercontent.com/101335613/196950642-e763eeda-15ac-4fd9-9090-bd9ba2864c45.png)

<h1>
𝐒𝐩𝐞𝐥𝐥𝐢𝐚
</h1>
Spellia é um aplicativo para buscar feitiços do mágico universo de Harry Potter. Já teve curiosidade para entender mais sobre esse universo mágico? Que tal começar dando uma olhada em alguns feitiços que ajudam os melhores bruxos em suas jornadas?

<br />  ![Badge](https://img.shields.io/badge/code-WELCOME-B1405E?style=for-the-badge&logo=) ![Badge](https://img.shields.io/badge/status-INPROGRESS-B1405E?style=for-the-badge&logo=) ![Badge](https://img.shields.io/badge/language-ENG-B1405E?style=for-the-badge&logo=)

 <h2>
 .{𝐢𝐧𝐝𝐢𝐜𝐞 📌
 </h2>
                
<p>
 <a href="#func">• funcionalidades</a> <br />
 <a href="#demon">• demonstração</a> <br />
 <a href="#dicas">• dicas para teste</a> <br /> 
 <a href="#cbl">• documentação do projeto</a> <br />
 <a href="#api">• uso da API</a> <br />
 <a href="#stack">• stacks utilizadas</a> <br />
 <a href="#aprend">• aprendizados</a> <br />
 <a href="#autora">• autora</a> <br />
</p> 

<h2 id="func">
🪄𝐟𝐮𝐧𝐜𝐢𝐨𝐧𝐚𝐥𝐢𝐝𝐚𝐝𝐞𝐬
</h2>

- Pesquisar feitiços do universo de Harry Potter
- Obter informações sobre o feitiço
- Favoritar feitiços interessantes
- Visualizar seus favoritos

<h2 id="demon">
🪄𝐫𝐨𝐝𝐚𝐧𝐝𝐨...
</h2>

https://user-images.githubusercontent.com/101335613/196952855-4b03f01f-d439-4e1d-8493-af16778f0ed4.mov

<h2 id="dicas">
🪄𝐬𝐩𝐞𝐥𝐥𝐬 𝐩𝐚𝐫𝐚 𝐭𝐞𝐬𝐭𝐚𝐫 𝐞 𝐬𝐞 𝐝𝐢𝐯𝐞𝐫𝐭𝐢𝐫
</h2>

- Cantis 
- Flintifors
- Glisseo
- Langlock
- Mobilicorpus

<h2 id="cbl">
🪄𝐂𝐁𝐋 𝐝𝐨𝐜𝐮𝐦𝐞𝐧𝐭𝐚𝐝𝐨
</h2>
Saiba mais sobre o proceso de mapeamento, protótipos, organização diária de tasks e mais no CBL do projeto: <br />
[🎃 Individual Challenge](https://field-tuesday-d65.notion.site/CBL-Individual-Challenge-0b54b286bf244284b6fe1bc60a93dc7c)

<h2 id="api">
🪄𝐮𝐬𝐨 𝐝𝐚 𝐀𝐏𝐈 
</h2>

#### Pega todos os spells

```swift
  static func getSpells()
```

#### Retorna um spell

```swift
  static func searchSpell(with query: String, completion: @escaping (Result<[Spell], Error>) -> Void)
```

| Parâmetro   | Tipo       | Descrição                                   |
| :---------- | :--------- | :------------------------------------------ |
| `query`      | `string` | é o texto que o usuário insere, que será pesquisado na API |

```swift
  let urlstring = url + "?Name=" + query
        guard URL(string: urlstring) != nil else {
            print ("something went wrong")
            return
        }
```

Soma a url com "?Name=" para pesquisar somente os nomes na API. Somando com o query (input do user) retorna o feitiço esperado. <br />

#### API utilizada <br />

[🎃 Wizard World API](https://wizard-world-api.herokuapp.com/swagger/index.html?ref=publicapis.dev)

<h2 id="stack">
🪄𝐬𝐭𝐚𝐜𝐤𝐬 
</h2>

**🎃 Front-End & Back-End:** Swift <br />
**🎃 Framework:** UIKit

<h2 id="aprend">
🪄𝐚𝐩𝐫𝐞𝐧𝐝𝐢𝐳𝐚𝐝𝐨𝐬
</h2>

Como o foco foi principalmente puxar informações de uma API, sinto que esse foi o maior aprendizado desse challenge. Me aprofundei em usar algumas bases do swift como classes, funções, structs e etc. Conhecer mais sobre o framework UIKit também foi muito interessante (apesar de ser trabalhoso ehehe)

<h2 id="autora">
🪄𝐚𝐮𝐭𝐨𝐫𝐚
</h2>

[<img src="https://avatars.githubusercontent.com/u/101335613?s=400&u=208cc7f426ab58ecedbd8c8c489afd1788361798&v=4" width=115><br><sub>Letícia Dutra</sub>](https://github.com/leticiadutra22-23)
