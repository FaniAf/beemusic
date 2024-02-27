import 'package:beemusic/app/audio/audio_service.dart';
import 'package:beemusic/app/config/app_config.dart';
import 'package:beemusic/app/extension/sizedbox.dart';
import 'package:beemusic/app/model/response/album/detail_album_respon.dart';
import 'package:beemusic/app/model/response/artist/detail_artist_respon.dart';
import 'package:beemusic/app/utils/component/shimmer.dart';
import 'package:beemusic/app/utils/constant/export/export_constant.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ListTileWidgetMusic<T> extends StatefulWidget {
  ListTileWidgetMusic({
    super.key,
    required this.listLagunya,
    required this.song,
    required this.index,
  });
  List<Lagu> listLagunya;
  T song;
  final int index;

  @override
  State<ListTileWidgetMusic<T>> createState() => _ListTileWidgetMusicState<T>();
}

class _ListTileWidgetMusicState<T> extends State<ListTileWidgetMusic<T>> {
  Lagu? detailArtist;

  DetailAlbumRespon? detailAlbum;

  @override
  Widget build(BuildContext context) {
    print(widget.index);
    print(widget.index);
    print(widget.index);
    print(widget.index);
    bool isLoading =
        isLoadingList.length > widget.index && isLoadingList[widget.index];

    final String title;
    final String artist;

    // Mengecek tipe data song dan mengakses properti yang sesuai
    if (widget.song is Lagu) {
      final detailArtist = widget.song as Lagu;
      title = detailArtist.judul;
      artist = detailArtist.judul;
    } else if (widget.song is DetailAlbumRespon) {
      // Tambahkan penanganan tipe data lain jika diperlukan
      // Misalnya, ModelLain adalah tipe model lain yang memiliki properti yang sesuai.
      final modelLain = widget.song as DetailAlbumRespon;
      title = modelLain.lagu[widget.index].judul;
      artist = modelLain.artis;
    } else {
      // Penanganan tipe data lainnya atau kesalahan jika tipe data tidak sesuai.
      title = "Unknown Title";
      artist = "Unknown Artist";
    }

    return ListTile(
      onTap: () async {
        setState(() {
          if (isLoadingList.length <= widget.index) {
            isLoadingList.add(true);
          } else {
            isLoadingList[widget.index] = true;
          }
        });
        initMusicSong(widget.song, widget.index, widget.listLagunya);
        await Future.delayed(const Duration(seconds: 2));

        setState(() {
          isLoadingList[widget.index] = false;
        });
      },
      title: Text(title),
      subtitle: Text(artist),
      leading: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: AppImage
                .kImageDefaultPosterNetwork, // Replace 'imageUrl' with your actual image URL
            width: 50, // Set your desired width
            height: 50, // Set your desired height
            imageBuilder: (context, imageProvider) => Stack(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                          imageProvider, // Use the imageProvider from CachedNetworkImage
                    ),
                  ),
                ),
                if (isLoading) // Tampilkan CircularProgressIndicator jika isLoading true
                  const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
              ],
            ),
            placeholder: (context, url) => ShimmerLoading(
                child: Container(
              width: 50,
              height: 50,
              color: Colors.grey,
            )), // You can customize the placeholder
            errorWidget: (context, url, error) =>
                const Icon(Icons.error), // You can customize the error widget
          ),
        ],
      ),
    );
  }
}
