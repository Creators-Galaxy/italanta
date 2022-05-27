part of screens;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String searchResult = "";
  List<City> cityList = [];


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CityCubit(CityRepositoryImpl()),
        child: BlocBuilder<CityCubit, CityState>(builder: (context, state) {
          if (state is CityStateInitial) context.read<CityCubit>().getData();
          if (state is CityStateLoaded) {
            cityList = state.cities;
          }
          return FullScreenShowStatusScaffold(
            statusBrightness: Brightness.dark,
              backgroundColor: Theme.of(context).backgroundColor,
              appBar: HomeAppbar().appBar(context, initialiseSearch),
              bodyBuilder: (BoxConstraints viewportConstraints) {
                return SingleChildScrollView(
                    child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewportConstraints.maxHeight,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      MapView(
                          constraints: viewportConstraints, city: searchResult),
                      if (searchResult.isEmpty)
                        ...homeIntro(viewportConstraints),
                      if (searchResult.isNotEmpty)
                        ...homeData(viewportConstraints, state),
                    ],
                  ),
                ));
              });
        }));
  }

  List<Widget> homeIntro(BoxConstraints viewportConstraints) {
    return <Widget>[
      Text('${LocaleKeys.infoBefore.tr().capitalize()}?',
          style: Theme.of(context).textTheme.headline2),
      Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          alignment: Alignment.center,
          child: FaIcon(
            FontAwesomeIcons.arrowDown,
            color: Colors.black.withOpacity(.5),
          )),
      ElevatedButton(
        child: Text(
          LocaleKeys.searchCity.tr(),
        ),
        onPressed: () {
          initialiseSearch();
        },
      ),
    ];
  }

  List<Widget> homeData(BoxConstraints viewportConstraints, CityState state) {
    City? searchedCity;
    if (state is CityStateLoaded) {
      final temp = state.cities.where(
          (city) => searchResult.toLowerCase() == city.name.toLowerCase());
      if (temp.isNotEmpty) {
        searchedCity = temp.first;
      } else {
        return _emptyView();
      }
    }
    return <Widget>[
      Text('${LocaleKeys.infoAfter.tr().capitalize()}:',
          style: Theme.of(context).textTheme.headline2),
      const SizedBox(
        height: 16,
      ),
      ListTile(
        leading: Container(
          alignment: Alignment.centerLeft,
          child: const Icon(FontAwesomeIcons.city),
          width: 40,
        ),
        title: Text(
          searchedCity!.name,
          style: Theme.of(context).textTheme.headline5,
        ),
        subtitle: Text(
          'Capital(s) : ${searchedCity.capital.join(", ")}',
          style: Theme.of(context).textTheme.caption,
        ),
        trailing: Wrap(
          spacing: 12,
          children: [
            const Icon(FontAwesomeIcons.chartArea),
            Text(searchedCity.areaSqKm,
                style: Theme.of(context).textTheme.subtitle2)
          ],
        ),
      )
    ];
  }

  void initialiseSearch() async {
    final result = await showSearch(
        context: context, delegate: Search(cityList: cityList));
    setState(() {
      searchResult = result.toString();
    });
  }

  List<Widget> _emptyView() {
    searchResult = "";
    return <Widget>[
      Text('Nothing to show here',
          style: Theme.of(context).textTheme.headline2),
    ];
  }
}
