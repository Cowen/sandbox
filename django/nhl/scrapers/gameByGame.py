""" Scrape an NHL player's game-by-game stats
    given the URL to the game-by-game stat page.

    Currently for skaters only. No goalies yet."""

import requests
from lxml import html
import datetime as dt

def format_date(datestr):
    return dt.datetime.strptime(datestr.replace('\'',''), '%b %d %y').date()

def toNum(stat):
    try:
        return int(stat)
    except ValueError:
        try:
            return float(stat)
        except ValueError:
            return stat

def scrape(url):
    # TODO validate URL
    # Example: http://www.nhl.com/ice/player.htm?id=8471215&season=20112012&view=log

    games = {} # { Game date : Game stats }

    r = requests.get(url)
    if r.status_code == 200:
        tree = html.fromstring(r.content)
        table = tree.find_class('playerStats')[0]
        tbody = table[1]
        for tr in tbody:
            tr_text = [ td.text_content() for td in tr ]

            gamestr = tr_text[0]
            date = format_date(gamestr.split('\n')[1])
            teams = gamestr.split('\n')[3]

            # Convert strings to numeric types
            tds = [ toNum for td in tr_text[1:] ]

            # Team strings end in "*" if this player scored the game-winning goal
            gwg = False
            if teams[-1] == '*':
                gwg = True
                teams = teams.rstrip('*')
            (away, home) = teams.split(' @ ')

            games[str(date)] = [away,home] + tr_text[1:] + [gwg]
    return games


