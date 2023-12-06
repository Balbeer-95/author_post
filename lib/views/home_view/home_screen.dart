import 'package:authors_post/views/post_view/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../post_view/post_bloc/post_bloc.dart';
import 'home_bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context)
        .add(GetHomeData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Authors Post"
        ),
        elevation: 0,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoaded) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                        BlocProvider(
                          create: (context) => PostBloc(),
                          child: PostScreen(postId: state.homeData[index].id, authorName: state.homeData[index].authorsName,),
                        )));
                  },
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11)
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.lightBlueAccent
                                ),
                                child: const Icon(
                                    Icons.person
                                ),
                              ),
                              SizedBox(width: 15,),
                              Text(
                                "${state.homeData[index].authorsName}",
                                style: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 15,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20,
                                vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: Colors.grey.shade300,
                                    width: 1
                                )
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${state.homeData[index].title}",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                SizedBox(height: 15,),
                                Text(
                                  "${state.homeData[index].body}",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black54
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10,);
              },
              itemCount: state.homeData.length,
            );
          }
          else {
            return Center(child: CircularProgressIndicator.adaptive());
          }
        },
      ),
    );
  }
}
