import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import 'discovery_screen.dart';
import 'map_hub_screen.dart';
import 'landing_screen.dart';
import 'profile_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const DiscoveryScreen(),
      MapHubScreen(),
      LandingScreen(
        onExploreMap: () {
          setState(() {
            _currentIndex = 1;
          });
        },
      ),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 768;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.background.withValues(alpha: 0.8),
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withValues(alpha: 0.1),
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryFixedDim.withValues(alpha: 0.15),
                blurRadius: 15,
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // App Brand Logo
                  Row(
                    children: [
                      Text(
                        'Stitch',
                        style: GoogleFonts.inter(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: AppColors.primaryFixedDim,
                          shadows: [
                            Shadow(
                              color: AppColors.primaryFixedDim
                                  .withValues(alpha: 0.6),
                              blurRadius: 8,
                            )
                          ],
                        ),
                      ),
                      if (isDesktop) ...[
                        const SizedBox(width: 36),
                        _buildDesktopNavButton(0, 'MAP', Icons.explore),
                        const SizedBox(width: 20),
                        _buildDesktopNavButton(1, 'QUESTS', Icons.military_tech),
                        const SizedBox(width: 20),
                        _buildDesktopNavButton(2, 'SOCIAL', Icons.group),
                        const SizedBox(width: 20),
                        _buildDesktopNavButton(3, 'PROFILE', Icons.shuffle),
                      ],
                    ],
                  ),

                  // Trailing Action (Level / XP Info)
                  Row(
                    children: [
                      Text(
                        'Lvl 24 • 450 XP',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.tertiaryFixedDim,
                          shadows: [
                            Shadow(
                              color: AppColors.tertiaryFixedDim
                                  .withValues(alpha: 0.4),
                              blurRadius: 8,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.primaryFixedDim),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryFixedDim
                                  .withValues(alpha: 0.5),
                              blurRadius: 8,
                            )
                          ],
                        ),
                        child: const ClipOval(
                          child: Image(
                            image: NetworkImage(
                              'https://lh3.googleusercontent.com/aida-public/AB6AXuDvx2w7piy3_XhfuFUPWOkem4KmJmhT4dI9bypY61egOjzzaMRdUeodOsTgGjGsVPCasCL6Wxkeu9G7kfSD66Xpgl73aZKIYXFXauRxXp5dScgfOhFOGoY4HsP8RThzi1eYFGu9-yDulkMnSrFi91vgmM3SN0oVUZ2ghNx8GAZ5Gx-4OHnyeyjlr2vwAZNLBsVcsPL7CfrcARRY8ys3aBunVnhrRoy9Zzh2loA7D5a5LWxl4sKOvDd5',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          IndexedStack(
            index: _currentIndex,
            children: _screens,
          ),

          // Floating FAB (visible on Map tab)
          if (_currentIndex == 1)
            Positioned(
              bottom: isDesktop ? 32 : 96,
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.tertiaryFixed,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.tertiaryFixed.withValues(alpha: 0.4),
                      blurRadius: 20,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: IconButton(
                  iconSize: 28,
                  icon: const Icon(Icons.add, color: AppColors.onSurfaceVariant),
                  onPressed: () {},
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: isDesktop
          ? null
          : Container(
              height: 72,
              decoration: BoxDecoration(
                color: AppColors.surfaceContainer.withValues(alpha: 0.9),
                border: Border(
                  top: BorderSide(
                    color: Colors.white.withValues(alpha: 0.05),
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.5),
                    blurRadius: 20,
                    offset: const Offset(0, -4),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildMobileNavItem(0, 'Map', Icons.explore),
                  _buildMobileNavItem(1, 'Quests', Icons.military_tech),
                  _buildMobileNavItem(2, 'Social', Icons.group),
                  _buildMobileNavItem(3, 'Profile', Icons.shuffle),
                ],
              ),
            ),
    );
  }

  Widget _buildDesktopNavButton(int index, String label, IconData icon) {
    final isSelected = _currentIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
            color: isSelected
                ? AppColors.primaryFixedDim
                : AppColors.onSurfaceVariant,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isSelected
                  ? AppColors.primaryFixedDim
                  : AppColors.onSurfaceVariant,
              shadows: isSelected
                  ? [
                      Shadow(
                        color: AppColors.primaryFixedDim.withValues(alpha: 0.8),
                        blurRadius: 10,
                      )
                    ]
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileNavItem(int index, String label, IconData icon) {
    final isSelected = _currentIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 24,
            color: isSelected
                ? AppColors.primaryFixedDim
                : AppColors.onSurfaceVariant.withValues(alpha: 0.6),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: isSelected
                  ? AppColors.primaryFixedDim
                  : AppColors.onSurfaceVariant.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}
