# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


NicknamesFeed.create([
	{nick: 'Joe'}, 
	{nick: 'Stephanie'}, 
	{nick: 'Jorge'}, 
	{nick: 'Paulo'},
	{nick: 'Ana'},
	{nick: 'Manuel'},
	{nick: 'Priscila'},
	{nick: 'Francisco'},
	{nick: 'Fifi'},
	{nick: 'Gina'},
	{nick: 'Juan'},
	{nick: 'Rui'}])

User.create([
	{email: 'sandro@gmail.com', password: '12345678', password_confirmation: '12345678'},
	{email: 'xico@gmail.com', password: '12345678', password_confirmation: '12345678'},
	{email: 'filipe@gmail.com', password: '12345678', password_confirmation: '12345678'},
	{email: 'duarte@gmail.com', password: '12345678', password_confirmation: '12345678'},
	{email: 'renato@gmail.com', password: '12345678', password_confirmation: '12345678'},
	{email: 'ana@gmail.com', password: '12345678', password_confirmation: '12345678'},
	{email: 'isabel@gmail.com', password: '12345678', password_confirmation: '12345678'},
	{email: 'nelson@gmail.com', password: '12345678', password_confirmation: '12345678'}])

