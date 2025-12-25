import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:charity_app/di.dart';
import 'package:charity_app/domain/model/charity.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:charity_app/presentation/core/style/charity_item_styles.dart';

class CharitySearchScreen extends ConsumerStatefulWidget {
  const CharitySearchScreen({super.key});

  @override
  ConsumerState<CharitySearchScreen> createState() => _CharitySearchScreenState();
}

class _CharitySearchScreenState extends ConsumerState<CharitySearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final getAllCharities = ref.watch(getAllCharitiesUseCaseProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Charities",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.grey[500], fontSize: 16),
                  prefixIcon: Icon(Icons.search, color: Colors.grey[500], size: 20),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                    icon: const Icon(Icons.cancel, size: 18),
                    onPressed: () => setState(() => _searchController.clear()),
                  )
                      : null,
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder<dynamic>(
        future: getAllCharities.call(),
        builder: (context, snapshot) {

            final List<Charity> charities = snapshot.data?.value ?? [];
            final filteredCharities = charities.where((charity) {
            final query = _searchController.text.toLowerCase();

            final bool matchesName = charity.name.toLowerCase().contains(query);

            final bool matchesDescription = charity.description.toLowerCase().contains(query);

            final String categoryLabel = _getLabelFromIcon(CharityItemStyles.getIcon(charity)).toLowerCase();
            final bool matchesCategory = categoryLabel.contains(query);

            return matchesName || matchesDescription || matchesCategory;
          }).toList();

          return ListView.builder(
            itemCount: filteredCharities.length,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            itemBuilder: (context, index) {
              final charity = filteredCharities[index];
              final color = CharityItemStyles.getColor(charity);
              final icon = CharityItemStyles.getIcon(charity);

              String displayCategory = charity.causeCategory.isNotEmpty
                  ? charity.causeCategory.toUpperCase()
                  : _getLabelFromIcon(icon);

              return Container(
                margin: const EdgeInsets.only(bottom: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: index == 0 ? const Radius.circular(30) : Radius.zero,
                    bottom: index == filteredCharities.length - 1 ? const Radius.circular(30) : Radius.zero,
                  ),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  leading: Container(
                    width: 52, height: 52,
                    decoration: BoxDecoration(color: color.withOpacity(0.12), shape: BoxShape.circle),
                    child: Icon(icon, color: color, size: 26),
                  ),
                  title: Text(
                      charity.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700
                      ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                      charity.description,
                      // maxLines: 1,
                      // overflow: TextOverflow.ellipsis
                  ),
                  trailing: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        displayCategory,
                        style: TextStyle(color: Colors.grey[400], fontSize: 11, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 4),
                      Icon(Icons.arrow_forward_ios_rounded, size: 12, color: Colors.grey[300]),
                    ],
                  ),
                  onTap: () => launchUrl(Uri.parse(charity.profileUrl)),
                ),
              );
            },
          );
        },
      ),
    );
  }

  String _getLabelFromIcon(IconData icon) {
    if (icon == Icons.pets_rounded) return "ANIMALS";
    if (icon == Icons.eco_rounded) return "ENVIRONMENT";
    if (icon == Icons.school_rounded) return "EDUCATION";
    if (icon == Icons.favorite_rounded) return "HEALTH";
    if (icon == Icons.palette_rounded) return "ARTS";
    if (icon == Icons.gavel_rounded) return "JUSTICE";
    if (icon == Icons.biotech_rounded) return "SCIENCE";
    return "GENERAL";
  }
}