# App Overview

I am going to build an app for actors and casting agencies to create profiles and register for auditions. 

# User Stories

## Users will be able to ...
- sign up, log in, log out
- view/register for auditions 

## As a user, I can...
- agent can utilize CRUD with auditions 
- actor can utilize CRUD with profiles 

# Wireframing 

## Models will be Actor, Agent, and Audition, AgentAudition (Join Table) 

## Actor

### Attributes

- name 
- email 
- password_digest 
- bio 
- agent_id
- audition_id

### Associations

- belongs_to :agent
- has_many :auditions, through: :agents

## Agent 

### Attributes

- name 
- email 
- password_digest 
- audition_id   

### Associations

- has_many :actors
- has_many :agent_auditions
- has_many :auditions, through: :agent_auditions  

## Audition

### Attributes

- role
- location
- actor_id  

### Associations

- has many :actors, through: :agents
- has_many :agent_auditions
- has_many :agents, through: :agent_auditions 

## AgentAudition

### Attributes

- agent_id
- audition_id   

### Associations

- belongs_to :agent 
- belongs_to :audition 

#MVP (Minimum viable product)

- Actors can sign up, create a profile, log in/out, view, and register for auditions
- Agents can sign up, create a profile, log in/out, create and edit auditions 

# Stretch Goals

- Allow users to upload pictures/resumes 
- Allow casting agencies to access actor/profiles and contact agents for hiring

Specifications for the Sinatra Assessment
Specs:

(x) Use Sinatra to build the app
(x) Use ActiveRecord for storing information in a database
(x) Include more than one model class (e.g. User, Post, Category)
(x) Include at least one has_many relationship on your User model (e.g. User has_many Posts)
(x) Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
() Include user accounts with unique login attribute (username or email)
() Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
() Ensure that users can't modify content created by other users
() Include user input validations
() BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
() Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm:

() You have a large number of small Git commits
() Your commit messages are meaningful
() You made the changes in a commit that relate to the commit message
() You don't include changes in a commit that aren't related to the commit message