from django.db import models

PLAYER_POSITIONS = (
    ('LW', 'Left Wing'),
    ('C', 'Center'),
    ('RW', 'Right Wing'),
    ('D', 'Defense'),
    ('G', 'Goalie'),
)

# Create your models here.
class Team(models.Model):
    name = models.CharField(max_length=3, unique=True)
    full_name = models.CharField(max_length=50)

    def __str__(self):
        return self.name

    class Meta:
        ordering = ['name', 'full_name']

    class Admin:
        pass

class Player(models.Model):
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=40)
    team = models.ForeignKey(Team)
    position = models.CharField(max_length=2,choices=PLAYER_POSITIONS)
    official_profile = models.URLField() # NHL.com profile

    def __str__(self):
        return self.first_name + ' ' + self.last_name

    class Meta:
        ordering = ['last_name', 'first_name']

    class Admin:
        pass

class GameSummary(models.Model):
    date = models.DateField()
    homeTeam = models.ForeignKey(Team, related_name='homeTeam')
    awayTeam = models.ForeignKey(Team, related_name='awayTeam')
    winner = models.ForeignKey(Team)
    homeTeamScore = models.PositiveSmallIntegerField()
    awayTeamScore = models.PositiveSmallIntegerField()
    firstStar = models.ForeignKey(Player, related_name='firstStar')
    secondStar = models.ForeignKey(Player, related_name='secondStar')
    thirdStar = models.ForeignKey(Player, related_name='thirdStar')

    def __str__(self):
        return str(self.date) + ':' + self.awayTeam + ' @ ' + self.homeTeam

    class Admin:
        pass

class PlayerGame(models.Model):
    player = models.ForeignKey(Player)
    summary = models.ForeignKey(GameSummary)
    goals = models.PositiveSmallIntegerField()
    assists = models.PositiveSmallIntegerField()
    points = models.PositiveSmallIntegerField()
    plusminus = models.SmallIntegerField()
    pim = models.PositiveSmallIntegerField()
    ppg = models.PositiveSmallIntegerField()
    shg = models.PositiveSmallIntegerField()
    shots = models.PositiveSmallIntegerField()
    shotPct = models.FloatField()
    shifts = models.PositiveSmallIntegerField()
    toi = models.TimeField()
    foPct = models.FloatField()
    gwg = models.BooleanField()

    def __str__(self):
        return str(self.player) + ' -> ' + self.summary

    class Admin:
        pass
