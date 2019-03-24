# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|default:"",null: false|
|email|string|default: "", null: false|
|encrypted-password|string|default: "", null: false|
|confirm-password|string|default:"",null: false|
|first-name|string|default:"", null: false|
|last-name|string|default:"", null: false|
|first-name-kata|string|default:"", null: false|
|last-name-kata|string|default:"", null: false|
|year|integer|default:"", null: false|
|month|integer|default:"", null: false|
|day|integer|default:"", null: false|
|postal-code|integer|default:"", null: false|
|prefectutre|string|default:"", null: false|
|city|string|default:"", null: false|
|block|string|default:"", null: false|
|building|string|default:"", null: false|
|phone-number|integer|default:"", null: false|
