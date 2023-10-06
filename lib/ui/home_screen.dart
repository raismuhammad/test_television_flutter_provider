import 'package:flutter/material.dart';
import 'package:flutter_test_interview/data/api/ApiService.dart';
import 'package:flutter_test_interview/data/model/television.dart';
import 'package:flutter_test_interview/provider/television_provider.dart';
import 'package:flutter_test_interview/ui/detail_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<dynamic> _television;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _television = ApiService().televitionList();
  }

  Widget _buildList(BuildContext context) {
    return Consumer<TelevisionProvider>(builder: (context, state, _) {
      if (state.state == ResultState.loading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state.state == ResultState.hasData) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.result.length,
          itemBuilder: (context, index) {
            var television = state.result[index];
            return Padding(
              padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(television.name),
                    subtitle: Text(television.summary.toString()),
                    onTap: () => 
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return DetailScreen(televisionResult: television);
                    })),
                  ),
                ),
              ),
            );
          },
        );
      } else if (state.state == ResultState.noData) {
        return Center(
          child: Material(
            child: Text(state.message),
          ),
        );
      } else {
        return const Center(
          child: Material(
            child: Text('Check your connection'),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TelevisionProvider(apiService: ApiService()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text('Television'),),
          body: _buildList(context),),
      ),
    );
  }
}
