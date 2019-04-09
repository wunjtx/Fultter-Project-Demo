import 'package:project_demo/common/bloc_provider.dart';
import 'package:project_demo/fetch_data/fetch_data.dart';
import 'package:project_demo/models/result.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc extends BlocBase {
  final BehaviorSubject<FetchResult> _fetchresult = BehaviorSubject();
    Observable<FetchResult> get movieresults => _fetchresult.stream;  
  final String cityID;

  final FetchMovies fm=new FetchMovies();


  MoviesBloc({this.cityID}) {
    _getMovies(this.cityID);
  }

  _getMovies(String cityID) {
    fm.getMovieList(cityID).then((results) {
      _fetchresult.add(results);
    });
  }

  dispose() {
    _fetchresult.close();
  }
}
