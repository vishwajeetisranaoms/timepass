import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/custom_bars.dart';
import '../services/api_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? _profile;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchProfile();
  }

  Future<void> _fetchProfile() async {
    final profile = await ApiService.getProfile();
    if (mounted) {
      setState(() {
        _profile = profile;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Padding(
        padding: EdgeInsets.all(40.0),
        child: Center(
          child: CircularProgressIndicator(color: AppColors.primaryFixedDim),
        ),
      );
    }

    final username = _profile?['username'] ?? 'CipherPunk99';
    final tagline = _profile?['tagline'] ?? 'Neon District Runner';
    final level = _profile?['level'] ?? 24;
    final currentXp = _profile?['currentXp'] ?? 450;
    final maxXp = _profile?['maxXp'] ?? 1000;
    final xpProgress = (currentXp / maxXp).clamp(0.0, 1.0);
    final questsCount = _profile?['questsCount'] ?? 128;
    final connectionsCount = _profile?['connectionsCount'] ?? 42;
    final badgesCount = _profile?['badgesCount'] ?? 15;

    final List<dynamic> badges = _profile?['badges'] ?? [
      {
        'title': 'Night Owl',
        'subtitle': 'Active past 2 AM',
        'iconName': 'dark_mode',
        'colorHex': '#00DBE9',
        'isLocked': false
      },
      {
        'title': 'Social Butterfly',
        'subtitle': '10+ connections',
        'iconName': 'forum',
        'colorHex': '#D7CA00',
        'isLocked': false
      },
      {
        'title': 'Explorer',
        'subtitle': 'Visited 50 zones',
        'iconName': 'location_on',
        'colorHex': '#00DBE9',
        'isLocked': false
      },
      {
        'title': 'Locked',
        'subtitle': 'Reach Level 30',
        'iconName': 'lock',
        'colorHex': '#849495',
        'isLocked': true
      },
    ];

    final List<dynamic> recentIntel = _profile?['recentIntel'] ?? [
      {
        'title': 'Completed the "Neon Alley Run" quest.',
        'subtitle': '2 hours ago • +50 XP',
        'iconName': 'military_tech',
        'colorHex': '#D7CA00'
      },
      {
        'title': 'Connected with @GlitchWalker.',
        'subtitle': '5 hours ago',
        'iconName': 'person_add',
        'colorHex': '#00DBE9'
      },
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Profile Section
              GlassCard(
                padding: const EdgeInsets.all(24),
                borderColor: AppColors.primaryFixedDim.withValues(alpha: 0.3),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isWide = constraints.maxWidth > 650;
                    return Flex(
                      direction: isWide ? Axis.horizontal : Axis.vertical,
                      crossAxisAlignment: isWide
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.center,
                      children: [
                        // Avatar & Level Ring
                        Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              width: 130,
                              height: 130,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: AppColors.primaryFixedDim, width: 2),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primaryFixedDim
                                        .withValues(alpha: 0.4),
                                    blurRadius: 15,
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  _profile?['avatarUrl'] ??
                                      'https://lh3.googleusercontent.com/aida-public/AB6AXuASO9XHc8AfnxC4H-ruM-jzwea5xe6_F_6Ha4uoZZD1Zj0WMH2zpE7C48PmtJYI7LiHyLDR5qG8Oci4llDW_q7ApzoUL0ZTxszL0cUbTQXwukzPKPFFR-JspcMXfG3u7japYa1lGQWskIrG4SMmCAVNSmkG8zdIoGI3w-V1YIGxapdcOihiZXbA4gRY5T3_lKIJD9lHmGI49xhPQXwAHw3G0FD-mniM6d_JMKN5vJoi49IH3MjldTWu',
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: -14,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 4),
                                decoration: BoxDecoration(
                                  color: AppColors.surfaceContainerHigh,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: AppColors.primaryFixedDim),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.primaryFixedDim
                                          .withValues(alpha: 0.4),
                                      blurRadius: 10,
                                    )
                                  ],
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.bolt,
                                        size: 14,
                                        color: AppColors.primaryFixedDim),
                                    const SizedBox(width: 2),
                                    Text(
                                      '$level',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.primaryFixedDim,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            width: isWide ? 28 : 0, height: isWide ? 0 : 28),

                        // User Info & XP Bar
                        Expanded(
                          child: Column(
                            crossAxisAlignment: isWide
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.center,
                            children: [
                              Text(
                                username,
                                style: GoogleFonts.inter(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                tagline,
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: AppColors.onSurfaceVariant,
                                ),
                              ),
                              const SizedBox(height: 16),

                              // XP Bar Module
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: AppColors.surfaceContainer
                                      .withValues(alpha: 0.5),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: Colors.white.withValues(alpha: 0.05)),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'EXPERIENCE',
                                          style: GoogleFonts.spaceGrotesk(
                                            fontSize: 11,
                                            color: AppColors.onSurfaceVariant,
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            style: GoogleFonts.inter(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.primary,
                                            ),
                                            children: [
                                              TextSpan(
                                                text: '$currentXp',
                                                style: const TextStyle(
                                                    color: AppColors
                                                        .primaryFixedDim),
                                              ),
                                              TextSpan(text: ' / $maxXp XP'),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    AnimatedXpBar(progress: xpProgress),
                                    const SizedBox(height: 6),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        '${maxXp - currentXp} XP to Level ${level + 1}',
                                        style: GoogleFonts.inter(
                                          fontSize: 11,
                                          color: AppColors.onSurfaceVariant
                                              .withValues(alpha: 0.6),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Quick Stats
                              Row(
                                children: [
                                  Expanded(
                                    child: _buildStatTile('$questsCount', 'QUESTS',
                                        AppColors.tertiaryFixedDim),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: _buildStatTile('$connectionsCount', 'CONNECTIONS',
                                        AppColors.primaryFixedDim),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: _buildStatTile('$badgesCount', 'BADGES',
                                        AppColors.secondaryFixedDim),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              const SizedBox(height: 32),

              // Badges Grid Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Trophies & Badges',
                    style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'VIEW ALL',
                      style: GoogleFonts.spaceGrotesk(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryFixedDim,
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(color: Colors.white10),
              const SizedBox(height: 16),

              LayoutBuilder(
                builder: (context, constraints) {
                  final crossAxisCount = constraints.maxWidth > 650 ? 4 : 2;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 1.1,
                    ),
                    itemCount: badges.length,
                    itemBuilder: (context, index) {
                      final b = badges[index];
                      final isLocked = b['isLocked'] == true;
                      if (isLocked) {
                        return _buildLockedBadgeCard();
                      }
                      return _buildBadgeCard(
                        icon: _getIconData(b['iconName']),
                        title: b['title'] ?? '',
                        subtitle: b['subtitle'] ?? '',
                        color: _parseColor(b['colorHex']),
                      );
                    },
                  );
                },
              ),

              const SizedBox(height: 32),

              // Recent Activity Feed
              Text(
                'Recent Intel',
                style: GoogleFonts.inter(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const Divider(color: Colors.white10),
              const SizedBox(height: 16),

              Column(
                children: recentIntel.map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: _buildIntelFeedItem(
                      icon: _getIconData(item['iconName']),
                      iconColor: _parseColor(item['colorHex']),
                      title: item['title'] ?? '',
                      subtitle: item['subtitle'] ?? '',
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIconData(String? iconName) {
    switch (iconName) {
      case 'dark_mode':
        return Icons.dark_mode;
      case 'forum':
        return Icons.forum;
      case 'location_on':
        return Icons.location_on;
      case 'military_tech':
        return Icons.military_tech;
      case 'person_add':
        return Icons.person_add;
      case 'lock':
      default:
        return Icons.lock;
    }
  }

  Color _parseColor(String? colorHex) {
    if (colorHex != null && colorHex.startsWith('#')) {
      final hex = colorHex.replaceFirst('#', '');
      return Color(int.parse('FF$hex', radix: 16));
    }
    return AppColors.primaryFixedDim;
  }

  Widget _buildStatTile(String value, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadgeCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
  }) {
    return GlassCard(
      padding: const EdgeInsets.all(12),
      borderColor: color.withValues(alpha: 0.3),
      glowColor: color,
      glowRadius: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.surfaceContainer,
              border: Border.all(color: color.withValues(alpha: 0.5)),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 11,
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLockedBadgeCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Opacity(
        opacity: 0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.surfaceContainerHighest,
                border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
              ),
              child: const Icon(Icons.lock,
                  color: AppColors.onSurfaceVariant, size: 24),
            ),
            const SizedBox(height: 10),
            Text(
              'Locked',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              'Reach Level 30',
              style: GoogleFonts.inter(
                fontSize: 11,
                color: AppColors.onSurfaceVariant.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIntelFeedItem({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: iconColor.withValues(alpha: 0.15),
              border: Border.all(color: iconColor.withValues(alpha: 0.4)),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
