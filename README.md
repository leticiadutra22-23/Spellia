![image](https://user-images.githubusercontent.com/101335613/196950642-e763eeda-15ac-4fd9-9090-bd9ba2864c45.png)

<h1>
๐๐ฉ๐๐ฅ๐ฅ๐ข๐
</h1>
Spellia รฉ um aplicativo para buscar feitiรงos do mรกgico universo de Harry Potter. Jรก teve curiosidade para entender mais sobre esse universo mรกgico? Que tal comeรงar dando uma olhada em alguns feitiรงos que ajudam os melhores bruxos em suas jornadas?

<br />  ![Badge](https://img.shields.io/badge/code-WELCOME-B1405E?style=for-the-badge&logo=) ![Badge](https://img.shields.io/badge/status-INPROGRESS-B1405E?style=for-the-badge&logo=) ![Badge](https://img.shields.io/badge/language-ENG-B1405E?style=for-the-badge&logo=)

 <h2>
 .{๐ข๐ง๐๐ข๐๐ ๐
 </h2>
                
<p>
 <a href="#func">โข funcionalidades</a> <br />
 <a href="#demon">โข demonstraรงรฃo</a> <br />
 <a href="#dicas">โข dicas para teste</a> <br /> 
 <a href="#cbl">โข documentaรงรฃo do projeto</a> <br />
 <a href="#api">โข uso da API</a> <br />
 <a href="#stack">โข stacks utilizadas</a> <br />
 <a href="#aprend">โข aprendizados</a> <br />
 <a href="#autora">โข autora</a> <br />
</p> 

<h2 id="func">
๐ช๐๐ฎ๐ง๐๐ข๐จ๐ง๐๐ฅ๐ข๐๐๐๐๐ฌ
</h2>

- Pesquisar feitiรงos do universo de Harry Potter
- Obter informaรงรตes sobre o feitiรงo
- Favoritar feitiรงos interessantes
- Visualizar seus favoritos

<h2 id="demon">
๐ช๐ซ๐จ๐๐๐ง๐๐จ...
</h2>

https://user-images.githubusercontent.com/101335613/196952855-4b03f01f-d439-4e1d-8493-af16778f0ed4.mov

<h2 id="dicas">
๐ช๐ฌ๐ฉ๐๐ฅ๐ฅ๐ฌ ๐ฉ๐๐ซ๐ ๐ญ๐๐ฌ๐ญ๐๐ซ ๐ ๐ฌ๐ ๐๐ข๐ฏ๐๐ซ๐ญ๐ข๐ซ
</h2>

- Cantis 
- Flintifors
- Glisseo
- Langlock
- Mobilicorpus

<h2 id="cbl">
๐ช๐๐๐ ๐๐จ๐๐ฎ๐ฆ๐๐ง๐ญ๐๐๐จ
</h2>
Saiba mais sobre o proceso de mapeamento, protรณtipos, organizaรงรฃo diรกria de tasks e mais no CBL do projeto: <br />
[๐ Individual Challenge](https://field-tuesday-d65.notion.site/CBL-Individual-Challenge-0b54b286bf244284b6fe1bc60a93dc7c)

<h2 id="api">
๐ช๐ฎ๐ฌ๐จ ๐๐ ๐๐๐ 
</h2>

#### Pega todos os spells

```swift
  static func getSpells()
```

#### Retorna um spell

```swift
  static func searchSpell(with query: String, completion: @escaping (Result<[Spell], Error>) -> Void)
```

| Parรขmetro   | Tipo       | Descriรงรฃo                                   |
| :---------- | :--------- | :------------------------------------------ |
| `query`      | `string` | รฉ o texto que o usuรกrio insere, que serรก pesquisado na API |

```swift
  let urlstring = url + "?Name=" + query
        guard URL(string: urlstring) != nil else {
            print ("something went wrong")
            return
        }
```

Soma a url com "?Name=" para pesquisar somente os nomes na API. Somando com o query (input do user) retorna o feitiรงo esperado. <br />

#### API utilizada <br />

[๐ Wizard World API](https://wizard-world-api.herokuapp.com/swagger/index.html?ref=publicapis.dev)

<h2 id="stack">
๐ช๐ฌ๐ญ๐๐๐ค๐ฌ 
</h2>

**๐ Front-End & Back-End:** Swift <br />
**๐ Framework:** UIKit

<h2 id="aprend">
๐ช๐๐ฉ๐ซ๐๐ง๐๐ข๐ณ๐๐๐จ๐ฌ
</h2>

Como o foco foi principalmente puxar informaรงรตes de uma API, sinto que esse foi o maior aprendizado desse challenge. Me aprofundei em usar algumas bases do swift como classes, funรงรตes, structs e etc. Conhecer mais sobre o framework UIKit tambรฉm foi muito interessante (apesar de ser trabalhoso ehehe)

<h2 id="autora">
๐ช๐๐ฎ๐ญ๐จ๐ซ๐
</h2>

[<img src="https://avatars.githubusercontent.com/u/101335613?s=400&u=208cc7f426ab58ecedbd8c8c489afd1788361798&v=4" width=115><br><sub>Letรญcia Dutra</sub>](https://github.com/leticiadutra22-23)
