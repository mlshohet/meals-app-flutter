import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorites_screen.dart';
import '../widgets/main_drawer.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {

	final List<Meal> favoriteMeals;

	TabsScreen(this.favoriteMeals);

	@override
	_TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

	List<Map<String, Object>> _pages;

	int _selectedPageIndex = 0;

	@override
	void initState() {
		super.initState();
		_pages = [
			{
				'page': CategoriesScreen(),
				'title': 'Categories',
			},
			{
				'page': FavoritesScreen(widget.favoriteMeals),
				'title': 'Favorites',
			}
		];
	}

	void _selectPage(int index) {
		setState(() {
			_selectedPageIndex = index;
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
				appBar: AppBar(
					title: Text(_pages[_selectedPageIndex]['title']),
				),
				//DRAWER!!
				drawer: MainDrawer(),

				//The order of tabs should match the order 
				//of widgets in body
				body: _pages[_selectedPageIndex]['page'],
				// bottom nav tabs
				bottomNavigationBar: BottomNavigationBar(
					onTap: _selectPage,
					backgroundColor: Theme.of(context).primaryColor,
					unselectedItemColor: Colors.white,
					selectedItemColor: Theme.of(context).accentColor,
					currentIndex: _selectedPageIndex,
					items: [
						BottomNavigationBarItem(
							icon: Icon(Icons.category),
							title: Text('Categories'),
						),
						BottomNavigationBarItem(
							icon: Icon(Icons.star),
							title: Text('Favorites'),
						),
					]
				),
		);
	}
}