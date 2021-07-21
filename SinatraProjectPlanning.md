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
