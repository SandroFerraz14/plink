# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


NicknamesFeed.create([
	{nick: 'Joe', image_url: 'Joe'}, 
	{nick: 'Stephanie', image_url: 'Stephanie'}, 
	{nick: 'Jorge', image_url: 'Jorge'}, 
	{nick: 'Paulo', image_url: 'Paulo'},
	{nick: 'Ana', image_url: 'Ana'},
	{nick: 'Manuel', image_url: 'Manuel'},
	{nick: 'Priscila', image_url: 'Priscila'},
	{nick: 'Francisco', image_url: 'Francisco'},
	{nick: 'Fifi', image_url: 'Fifi'},
	{nick: 'Gina', image_url: 'Gina'},
	{nick: 'Juan', image_url: 'Juan'},
	{nick: 'Rui', image_url: 'Rui'}])

User.create([
	{email: 'sandro@gmail.com', password: '12345678', password_confirmation: '12345678'},
	{email: 'xico@gmail.com', password: '12345678', password_confirmation: '12345678'},
	{email: 'filipe@gmail.com', password: '12345678', password_confirmation: '12345678'},
	{email: 'duarte@gmail.com', password: '12345678', password_confirmation: '12345678'},
	{email: 'renato@gmail.com', password: '12345678', password_confirmation: '12345678'},
	{email: 'ana@gmail.com', password: '12345678', password_confirmation: '12345678'},
	{email: 'isabel@gmail.com', password: '12345678', password_confirmation: '12345678'},
	{email: 'nelson@gmail.com', password: '12345678', password_confirmation: '12345678'}])

