const fs = require('fs')
const SwaggerParser = require('swagger-parser')

SwaggerParser.bundle('docs/gateway/openapi.yaml', (err, api) => {
  if (err) throw err

  fs.writeFile('docs/gateway/openapi.json', JSON.stringify(api), (err) => {
    if (err) throw err

    console.log('done')
  })
})
