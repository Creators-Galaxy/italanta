part of delegates;

class Search extends SearchDelegate<String> {
  final List<City> cityList;

  Search({required this.cityList});

  @override
  String get searchFieldLabel => 'Search for a city..';

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    if (colorScheme.brightness == Brightness.light) {
      return theme.copyWith(
        scaffoldBackgroundColor: CityScapeColors.complementaryColor1,
        backgroundColor: CityScapeColors.complementaryColor1,
        primaryColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: CityScapeColors.complementaryColor1,
          iconTheme: theme.primaryIconTheme
              .copyWith(color: CityScapeColors.complementaryColor2),
          toolbarTextStyle: theme.textTheme.bodyText2,
          titleTextStyle: theme.textTheme.headline6,
        ),
        inputDecorationTheme: searchFieldDecorationTheme ??
            InputDecorationTheme(
              hintStyle:
                  searchFieldStyle ?? theme.inputDecorationTheme.hintStyle,
              border: InputBorder.none,
            ),
      );
    } else {
      return theme.copyWith(
        scaffoldBackgroundColor: CityScapeColors.complementaryColor3,
        backgroundColor: CityScapeColors.spooky,
        primaryColor: Colors.black,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: CityScapeColors.spooky,
          iconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
          toolbarTextStyle: theme.textTheme.bodyText2,
          titleTextStyle: theme.textTheme.headline6,
        ),
        inputDecorationTheme: searchFieldDecorationTheme ??
            InputDecorationTheme(
              hintStyle:
                  searchFieldStyle ?? theme.inputDecorationTheme.hintStyle,
              border: InputBorder.none,
            ),
      );
    }
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, query);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<City> allKenyanCities = cityList
        .where((element) =>
            element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Container(
        color: CityScapeColors.complementaryColor1,
        child: buildCitiesList(allKenyanCities, context));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
  Widget buildCitiesList(List<City> cities, BuildContext context) {
    return ListView(
      children:  cities.map((city) => ListTile(
        title: Text(city.name),
        leading: Icon(Icons.location_city),
        subtitle: Text(city.capital.join(",")),
        onTap: ()=>close(context, city.name),
      )).toList()
      ,
    );
  }
}
