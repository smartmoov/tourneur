from flask_wtf import FlaskForm
from wtforms import Form, BooleanField, StringField, validators
import email_validator


class ArtisteForm(FlaskForm):
    username     = StringField('Username', [validators.Length(min=4, max=25)])
    email        = StringField('Email Address', [validators.Length(min=6, max=35), validators.Email()])

class UtilisateurForm(ArtisteForm):
    password    = StringField('password',  [validators.Length(min=6, max=75), validators.InputRequired()])

class LoginForm(FlaskForm):
    email       = StringField('Email Address', [validators.Length(min=6, max=35), validators.Email()])
    password    = StringField('password',  [validators.Length(min=6), validators.InputRequired()])
    remember    = BooleanField('remember')