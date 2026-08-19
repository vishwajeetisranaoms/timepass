import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class DiscoveryScreen extends StatefulWidget {
  const DiscoveryScreen({super.key});

  @override
  State<DiscoveryScreen> createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
  String _selectedFilter = 'All Vibes';

  final List<String> _filters = [
    'All Vibes',
    'Food & Drink',
    'Gaming',
    'Music',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header & Filter Chips Section
          LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pulse Check',
                            style: GoogleFonts.inter(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Vibes currently dropping nearby.',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: AppColors.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: _filters.map((filter) {
                        final isSelected = _selectedFilter == filter;
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ChoiceChip(
                            label: Text(
                              filter,
                              style: GoogleFonts.spaceGrotesk(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: isSelected
                                    ? AppColors.primaryFixedDim
                                    : AppColors.onSurfaceVariant,
                              ),
                            ),
                            selected: isSelected,
                            onSelected: (val) {
                              if (val) {
                                setState(() {
                                  _selectedFilter = filter;
                                });
                              }
                            },
                            backgroundColor: AppColors.surfaceContainer,
                            selectedColor:
                                AppColors.primaryFixedDim.withValues(alpha: 0.15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(999),
                              side: BorderSide(
                                color: isSelected
                                    ? AppColors.primaryFixedDim
                                    : Colors.white.withValues(alpha: 0.05),
                              ),
                            ),
                            showCheckmark: false,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 24),

          // Bento Grid Cards
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 700;
              return Column(
                children: [
                  // Row 1: Featured & Secondary
                  if (isWide)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 7, child: _buildFeaturedCard()),
                        const SizedBox(width: 16),
                        Expanded(flex: 5, child: _buildSecondaryCard()),
                      ],
                    )
                  else ...[
                    _buildFeaturedCard(),
                    const SizedBox(height: 16),
                    _buildSecondaryCard(),
                  ],

                  const SizedBox(height: 16),

                  // Row 2: Tertiary Cards
                  if (isWide)
                    Row(
                      children: [
                        Expanded(child: _buildTertiaryCard1()),
                        const SizedBox(width: 16),
                        Expanded(child: _buildTertiaryCard2()),
                      ],
                    )
                  else ...[
                    _buildTertiaryCard1(),
                    const SizedBox(height: 16),
                    _buildTertiaryCard2(),
                  ],
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedCard() {
    return Container(
      height: 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
        image: const DecorationImage(
          image: NetworkImage(
            'https://lh3.googleusercontent.com/aida-public/AB6AXuCvf9h8lcOCXNSPHYSmnz23JJPfJqZtYreWb2630WRIQlobzrOViAUg2HyyRNOTGoOQETPwu336_QMJnR36zjNnrM5U64ADJGyLP-hFTrmxH5YtoMIH42cN2eA6cJ_0F9khtYde8v-6P6LJbiU4G8pR3xXZPzbkXAe_sPFM_ZQ0JQcPf_LrScSjDp_d-rvc6f_4Fjuyt9VzAFBRmg2UzaRvxHYoAFuaFARphXbI1qgZ9H-1hzpgPmB8',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              Colors.black.withValues(alpha: 0.95),
              Colors.black.withValues(alpha: 0.6),
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryContainer.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.secondaryContainer),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.local_fire_department,
                          color: AppColors.secondaryContainer, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        'Hot Now',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppColors.secondaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerHigh.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.group,
                          color: AppColors.onSurfaceVariant, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        '24 Stitchers',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Late Night Ramen',
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.location_on,
                    color: AppColors.onSurfaceVariant, size: 14),
                const SizedBox(width: 4),
                Text(
                  '0.8 mi away • Cyber Noodle Bar',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Avatars stack
                SizedBox(
                  width: 100,
                  height: 32,
                  child: Stack(
                    children: [
                      _avatarCircle('https://lh3.googleusercontent.com/aida-public/AB6AXuBli6YWHGiXPCgUmBND8i7y6GUhdTNr1y1dsGQCJpq88Cr2JiEwyCxRersttwHqkN2LPMe2Z_3hsvrEp_tcZcYAZM_h8-kR2hKAo24IZlVXE3IBN4kuIcQKDAyGhBgYpM10ryfynOyQvU8yuTQCdxQm9i7W2eNcSL2FfsU6zYrCXq9HnBTHidQu4ItnG53_8Y338sVt1A7wSmxXFoFybkZkoETgI1eFVBjGXLw88n7LwSDh2gEx8f_T', 0),
                      _avatarCircle('https://lh3.googleusercontent.com/aida-public/AB6AXuBs4PUfCAOjHgYfvwqr6fyf3dPe6Xl4EWY27wvHliPTVSgj5kK-Im1hI8e4XHNsVGOp5iXaQywyCL8HXFz_auojsQkj0JSpa7qL9_SmD0DdzUS4HeLV_pY-JhgEv7eJSbqN8rx4tokWkiPKeMxTe_syaxjkJg52NT5hAhlQrt6ndjctL9Z1Mv6wXsB2F2_vhSZBZc0dkRYMbr_dy8WPCk3T2X5d_5rbAvXhcsVzae6sorFFc08fbea1', 20),
                      _avatarCircle('https://lh3.googleusercontent.com/aida-public/AB6AXuDH4gwZzU-XtgwBZf1fgVibXqJR92x-ytz5fSFb0ChKQ1MYUgchpiOgxYsGftPo9KBNs6BQnan-lj4mQQXa8cL5Yh4PRdBz0l60jMHv447OwBVhMVq88Ke7TV4FrH2LhR8TgSno2nnBix2SBd7xuWufs0LzyAIv9-52VkbWKuJttsovNuvvepYgceNnDx6niDxKeBhuG1N0P8yceHjm3h7lcCyTGcpJXnDL98t5pVJl4-Q0xOAqJElq', 40),
                      Positioned(
                        left: 60,
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: AppColors.surfaceContainerHigh,
                          child: Text(
                            '+21',
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: AppColors.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryFixedDim,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 5,
                    shadowColor: AppColors.primaryFixedDim.withValues(alpha: 0.5),
                  ),
                  child: Text(
                    'Join Link',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _avatarCircle(String url, double left) {
    return Positioned(
      left: left,
      child: CircleAvatar(
        radius: 16,
        backgroundColor: AppColors.background,
        child: CircleAvatar(
          radius: 14,
          backgroundImage: NetworkImage(url),
        ),
      ),
    );
  }

  Widget _buildSecondaryCard() {
    return Container(
      height: 360,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
        image: const DecorationImage(
          image: NetworkImage(
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBsdrFyppiCx5T_KNp0lgDIqd_XhVdOYKFq7SW7M9AtPzmB0ZbXq5khzUFCl-j0XTpKV5gyNpbqzXWQJQLPvwncnQWTbUkkRX2kg_gyKHrseHmn-J3jqW6JqxDqtxty223t4_QzTSh_GMHDRBy5SMSbQyiVvxtHa7zuCHd9xVsj9VzllbyBbqUHRuxHjKTkjMLHvBmYUjH-AGsHHI4EDv1fLike88uUuAAyW-zJRlnS4rvDwV8aSpLC',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              Colors.black.withValues(alpha: 0.95),
              Colors.black.withValues(alpha: 0.5),
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.primaryFixedDim.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.primaryFixedDim),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.sports_esports,
                      color: AppColors.primaryFixedDim, size: 14),
                  const SizedBox(width: 4),
                  Text(
                    'Gaming',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryFixedDim,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Retro Arcade Tour',
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.location_on,
                    color: AppColors.onSurfaceVariant, size: 14),
                const SizedBox(width: 4),
                Text(
                  '1.2 mi away',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.group,
                        color: AppColors.onSurfaceVariant, size: 14),
                    const SizedBox(width: 4),
                    Text(
                      '8 Here',
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 12,
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                        color: AppColors.secondaryContainer, width: 2),
                    foregroundColor: AppColors.secondaryContainer,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Join',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTertiaryCard1() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        image: const DecorationImage(
          image: NetworkImage(
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBRVBwXhNaPM6XNmW52ERzeohdHcojXEVi6DR_5bJSs3FdWuR8E023jZeVpzuKvN1KK_yxgKb7ywA0FBm0d49QTml3JdET4FYI84q3krD9mbZCctLOTSHtFMvN5NbUK-MIBPEcCBoKvZ7jEgKyHjU6AcHUmdrRB-wMWOlC6mv4Dqot9pshf626_muAPaPlKUJRrdfIX8o9rgixkzSn8CaIN_SxPp24p2xV-NI6S0ly7r6eNX16mB39y',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              Colors.black.withValues(alpha: 0.9),
              Colors.black.withValues(alpha: 0.3),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Midnight Synthwave',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.schedule,
                    color: AppColors.onSurfaceVariant, size: 14),
                const SizedBox(width: 4),
                Text(
                  'Starts in 2 hrs',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                  ),
                  child: Text(
                    '42 Interested',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 11,
                      color: AppColors.onSurface,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  iconAlignment: IconAlignment.end,
                  icon: const Icon(Icons.arrow_forward,
                      size: 14, color: AppColors.primaryFixedDim),
                  label: Text(
                    'Details',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 12,
                      color: AppColors.primaryFixedDim,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTertiaryCard2() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        image: const DecorationImage(
          image: NetworkImage(
            'https://lh3.googleusercontent.com/aida-public/AB6AXuAwB44tDq0h8ieH1OmKLh9Ya2yuPEKP2h2YkYFYgou46V1I9ZyXDyLsZY1YqyGN4Ze746xw7jRQx-c-AcjSl9me-Y-MUVCTJSlgwltA7SGeS43h1kA6HB6eEFOMdKkOUPbnCHEkkxSfSD7wwzPu1X78KEqBomoeZo5yydGCtdII7XxuJG_Cglx1pB9zOvDsZqZTd-WdxkHSkn8Clkm84lhphlBqhkEjiC77ydROJAdvUaLXm_rdrpY5',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              Colors.black.withValues(alpha: 0.9),
              Colors.black.withValues(alpha: 0.3),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rooftop Chill',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.location_on,
                    color: AppColors.onSurfaceVariant, size: 14),
                const SizedBox(width: 4),
                Text(
                  '2.5 mi away',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                  ),
                  child: Text(
                    '5 Here',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 11,
                      color: AppColors.onSurface,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  iconAlignment: IconAlignment.end,
                  icon: const Icon(Icons.arrow_forward,
                      size: 14, color: AppColors.primaryFixedDim),
                  label: Text(
                    'Details',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 12,
                      color: AppColors.primaryFixedDim,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
