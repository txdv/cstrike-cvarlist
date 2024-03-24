const fs = require('fs')

const data = fs.readFileSync('site.min.json')

const cvars = JSON.parse(data)

for (let i = 0; i < cvars.length; i++) {
  const cvar = cvars[i]

const t = `
        <tr>
          <td>${cvar.cvar}</td>
          <td>${cvar.value.default}</td>
          <td>${cvar.value.min}</td>
          <td>${cvar.value.max}</td>
          <td>${cvar.type}</td>
          <td>${cvar.category}</td>
          <td>${cvar.description}</td>
        </tr>`
  console.log(t)
}
