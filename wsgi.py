#!/usr/bin/env python

import bottle

app = application = bottle.Bottle()

@app.get('/echo/:input')
def get_echo(input):
    return { 'input': input }


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)
