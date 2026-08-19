import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/custom_bars.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                              child: const CircleAvatar(
                                backgroundImage: NetworkImage(
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
                                      '24',
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
                                'CipherPunk99',
                                style: GoogleFonts.inter(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Neon District Runner',
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
                                            children: const [
                                              TextSpan(
                                                text: '450',
                                                style: TextStyle(
                                                    color: AppColors
                                                        .primaryFixedDim),
                                              ),
                                              TextSpan(text: ' / 1000 XP'),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    const AnimatedXpBar(progress: 0.45),
                                    const SizedBox(height: 6),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        '550 XP to Level 25',
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
                                    child: _buildStatTile('128', 'QUESTS',
                                        AppColors.tertiaryFixedDim),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: _buildStatTile('42', 'CONNECTIONS',
                                        AppColors.primaryFixedDim),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: _buildStatTile('15', 'BADGES',
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
                  return GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.1,
                    children: [
                      _buildBadgeCard(
                        icon: Icons.dark_mode,
                        title: 'Night Owl',
                        subtitle: 'Active past 2 AM',
                        color: AppColors.primaryFixedDim,
                      ),
                      _buildBadgeCard(
                        icon: Icons.forum,
                        title: 'Social Butterfly',
                        subtitle: '10+ connections',
                        color: AppColors.tertiaryFixedDim,
                      ),
                      _buildBadgeCard(
                        icon: Icons.location_on,
                        title: 'Explorer',
                        subtitle: 'Visited 50 zones',
                        color: AppColors.primaryFixedDim,
                      ),
                      _buildLockedBadgeCard(),
                    ],
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

              _buildIntelFeedItem(
                icon: Icons.military_tech,
                iconColor: AppColors.tertiaryFixedDim,
                title: 'Completed the "Neon Alley Run" quest.',
                subtitle: '2 hours ago • +50 XP',
                highlightText: '"Neon Alley Run"',
              ),
              const SizedBox(height: 12),
              _buildIntelFeedItem(
                icon: Icons.person_add,
                iconColor: AppColors.primaryFixedDim,
                title: 'Connected with @GlitchWalker.',
                subtitle: '5 hours ago',
                highlightText: '@GlitchWalker',
              ),
            ],
          ),
        ),
      ),
    );
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
    required String highlightText,
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
