from flask import render_template, redirect, url_for, flash
from werkzeug.security import generate_password_hash, check_password_hash


from app import app
from models import Artiste, Adresse, Orchestre, Utilisateur
from forms import ArtisteForm, UtilisateurForm, LoginForm
from flask_login import login_user, logout_user, login_required, current_user
from flask_security import Security, roles_required, roles_accepted

@app.route('/')
def index():
    # Retrouver l'adresse d'un artiste
    artistes = Artiste.select()
    utilisateurs = Utilisateur.select()

    return render_template("index.html", artistes=artistes, users=utilisateurs)

@app.route('/artiste/ajout', methods=['GET', 'POST'])
def register():
    form = ArtisteForm()
    
    if form.is_submitted():
        if form.validate():
            user = Artiste()
            user.nom = form.username.data
            user.email = form.email.data
            user.adresse_id = 1
            user.save()
            return redirect('/register_success')

    return render_template('register.html', form=form)

@app.route('/register_success')
def register_success():
    return "Registration successful!"

@app.route('/login', methods=['GET'])
def login():
    form = LoginForm()
    return render_template("/login.html", form=form)

@app.route('/login', methods=['POST'])
def login_post():
    form = LoginForm()
    
    if form.is_submitted() and form.validate_on_submit():
        user = Utilisateur.get_or_none(Utilisateur.email == form.email.data)
        if not user or not check_password_hash(user.password, form.password.data):
            flash('Vérifier votre mail et votre mot de passe.')
            return render_template("login.html", form=form)
    else:
        flash('Vérifier les données du formulaire')
        return render_template("login.html", form=form)
    
#    if (form.remember.data):
#        remember = True
#    else:
#        remember = False
        
    login_user(user, remember=False)
    return redirect(url_for('profile'))
    
@app.route('/signup', methods=['GET'])
def signup():
    return render_template("/signup.html")

@app.route('/signup', methods=['POST'])
def signup_post():
    form = UtilisateurForm()
    
    if form.is_submitted() and form.validate_on_submit():
            user = Utilisateur()
            user.nom = form.username.data
            user.email = form.email.data
            user.password = generate_password_hash(form.password.data)
            user.save()
            flash('Utilisateur ajouté')

    return redirect(url_for('login'))

@app.route('/logout')
def logout():
    logout_user()
    return redirect(url_for('index'))

@app.route('/profile')
@login_required
def profile():
    return render_template("/profile.html", name=current_user.nom)

@app.route('/dashboard')
@roles_accepted('admin')
def dashboard():
    return 'dashboard'
