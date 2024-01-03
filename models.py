from flask_login import UserMixin
from peewee import *
from flask_security import RoleMixin

# flask-peewee 
from peewee import MySQLDatabase
from setting import DB_DATABASE, DB_HOST, DB_PASSWORD, DB_USERNAME


db = MySQLDatabase(DB_DATABASE, user=f'{DB_USERNAME}', password=f'{DB_PASSWORD}', host=f'{DB_HOST}', port=3306)

class Adresse(Model):
    class Meta:
        table_name = "adresse"
        database = db
        
    adresse_id = AutoField()
    rue = CharField(max_length=39)
    complement = CharField(max_length=39, null = True)
    ville=CharField(max_length=39)
    code_postal = IntegerField()

class Role(RoleMixin, Model):
    class Meta:
        table_name="role"
        database= db
        
    role_id = AutoField()
    nom = CharField(max_length=20)
    
    def get_id(self):
            # Retourne la clé primaire (role_id) sous forme de chaîne
            return str(self.role_id)
        
class Artiste(Model):
    class Meta:
        table_name="artiste"
        database = db
        
    artiste_id = AutoField()
    nom = CharField(max_length=150)
    prenom = CharField(max_length=150, null=True)
    email = CharField(100, unique = True)
    adresse = ForeignKeyField(Adresse, backref="artistes")
    id_instrument = IntegerField(null=True)
    id_orchestre = IntegerField(null=True)

class Orchestre(Model):
    class Meta:
        table_name="orchestre"
        database = db
        
    id_orchestre = AutoField()
    nom = CharField(max_length=50)

#UserMixin ajoute des fonctions à Utilisateur permettant d'utiliser les sessions
class Utilisateur(UserMixin, Model):
    class Meta:
        table_name="utilisateur"
        database = db

    utilisateur_id = AutoField()
    email = CharField(100, unique=True)
    password = CharField(200) #Le mot de passe hashé à toujours la même longueur et dépend de l'algorithme utilisé
    nom = CharField(75)
    role = ForeignKeyField(Role, backref="utilisateurs")
    active = BooleanField(column_name='is_active')
    fs_uniquifier = TextField(null=False)

    def get_id(self):
            # Retourne la clé primaire (utilisateur_id) sous forme de chaîne
            return str(self.utilisateur_id)
    
    def get_security_payload(self):
        # Retourne les données supplémentaires à inclure dans le jeton de sécurité
        return {"role": self.role.nom}  # Vous pouvez ajouter d'autres informations si nécessaire
    
    def verify_and_update_password(self, password):         
        return {'password': self.password}