"""Mise en place de la configuration intiale du serveur
"""
from flask import Flask, flash, redirect, url_for
from flask_login import LoginManager
from flask_wtf import CSRFProtect 
from models import Utilisateur, Role, db
from flask_principal import identity_loaded, RoleNeed, Principal
from flask_security import Security, PeeweeUserDatastore
import os

app = Flask(__name__)
app.config.from_object('config.Configuration')
# Generate a nice key using secrets.token_urlsafe()
app.config['SECRET_KEY'] = os.environ.get("SECRET_KEY", 'pf9Wkove4IKEAXvy-cQkeDPhv9Cb3Ag-wyJILbq_dFw')
# Bcrypt is set as default SECURITY_PASSWORD_HASH, which requires a salt
# Generate a good salt using: secrets.SystemRandom().getrandbits(128)
app.config['SECURITY_PASSWORD_SALT'] = os.environ.get("SECURITY_PASSWORD_SALT", '146585145368132386173505678016728509634')

login_manager = LoginManager()
#Page par défaut lorsque qu'utilisateur non authentifié essaie d'accéder directement à une page nécessitant une authhentifiacation
login_manager.login_view = 'login'
#Durée de vie de la session
app.config['REMEMBER_COOKIE_DURATION'] = 8 * 60 * 60 # exprimé en secondes (8 heures)
#Expiration du cookie à la fermeture de la page ou du navigateur
app.config['REMEMBER_COOKIE_FORCE_EXPIRES'] = True
login_manager.init_app(app)

principal = Principal()
app.config['PRINCIPAL_USE_SESSION'] = True
principal.init_app(app)
csrf = CSRFProtect(app) 

# Setup Flask-Security
user_datastore = PeeweeUserDatastore(db, Utilisateur, Role, None)
app.security = Security(app, user_datastore)

@login_manager.user_loader
def load_user(user_id):
    # Cette fonction est utilisée par Flask-Login pour obtenir l'utilisateur à partir de l'ID stocké dans la session
    return Utilisateur.get(Utilisateur.utilisateur_id == user_id)

# Personnaliser le message poue une connexion à des pages protégées
@login_manager.unauthorized_handler
def unauthorized():
    flash("Veuillez vous connecter pour accéder à cette page", "warning")
    return redirect(url_for('login'))

@identity_loaded.connect_via(app)
def on_identity_loaded(sender, identity):
    # Imprime les rôles et les besoins associés à l'identité lorsqu'elle est chargée
    print(identity.roles)
