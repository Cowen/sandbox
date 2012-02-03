from stats.models import Player, GameSummary, PlayerGame
from gameByGame import scrape

def update(playerID):
    player = Player.objects.get(id=playerID)
    url = player.official_profile

    results = scrape(url)

    for game_date in results.keys():
        game_stats = PlayerGame.get_or_create(date=game_date)



