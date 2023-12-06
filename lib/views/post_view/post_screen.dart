import 'package:authors_post/views/post_view/post_bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class PostScreen extends StatefulWidget {
  final int postId;
  final dynamic authorName;

  const PostScreen({Key? key, required this.postId, required this.authorName}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {


  @override
  void initState() {
    BlocProvider.of<PostBloc>(context)
        .add(GetPostData(postId: widget.postId.toString()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Post"
        ),
        elevation: 0,
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if(state is PostDataLoaded){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
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
                                "${widget.authorName}",
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
                                  "${state.data['title']}",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                                SizedBox(height: 15,),
                                Text(
                                  "${state.data['body']}",
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
                  SizedBox(height: 25,),

                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Recent Comments"
                          ),
                          SizedBox(height: 25,),
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${widget.authorName}",
                                    style: GoogleFonts.lato(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  Text(
                                    "Nice",
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      color: Colors.black54
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 25,),
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${widget.authorName}",
                                    style: GoogleFonts.lato(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  Text(
                                    "Nice",
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black54
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 15,),
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${widget.authorName}",
                                    style: GoogleFonts.lato(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  Text(
                                    "Nice",
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black54
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 15,),
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${widget.authorName}",
                                    style: GoogleFonts.lato(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  Text(
                                    "Nice",
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black54
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                  )
                ],
              ),
            );
          }else{
            return Center(child: CircularProgressIndicator.adaptive(),);
          }
        },
      ),
    );
  }
}
