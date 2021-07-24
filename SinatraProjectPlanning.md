# App Overview

Access Actors is an app for actors to create profiles and register for auditions. 

# User Stories

## Users will be able to ...
- sign up, log in, log out
- view/register for auditions
- view other actor profiles 

## As a user, I can...
- utilize CRUD with all aspects of their profiles 

# Wireframing 

## Models will be Actor, Headshot, Audition, ActorAudition (Join Table) 

## Actor

### Attributes

- name 
- email 
- password_digest 
- bio 
- agent_id

### Associations

- belongs_to :agent
- has_many :headshots 
- has_many :actor_auditions
- has_many :auditions, through: :actor_auditions

## Headshot  

### Attributes

- name 
- path
- actor_id   

### Associations

- belongs_to :actor

## Audition

### Attributes

- role
- location  

### Associations

- has_many :actor_auditions
- has_many :actors, through: :actor_auditions 

## ActorAudition

### Attributes

- actor_id
- audition_id   

### Associations

- belongs_to :actor 
- belongs_to :audition 

#MVP (Minimum viable product)

- Actors can sign up, create a profile, log in/out, view, and register for auditions 

# Stretch Goals

- Allow users to upload pictures/resumes 
- Allow casting agencies to access actor profiles and contact agents for hiring
- Allow casting agencies to add new auditions
