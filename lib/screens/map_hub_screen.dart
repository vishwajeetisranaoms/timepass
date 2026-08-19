import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';
import '../widgets/custom_bars.dart';

class MapHubScreen extends StatefulWidget {
  const MapHubScreen({super.key});

  @override
  State<MapHubScreen> createState() => _MapHubScreenState();
}

class _MapHubScreenState extends State<MapHubScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Map Fragment Section
          Container(
            height: 350,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLowest,
              border: Border(
                bottom: BorderSide(
                  color: Colors.white.withValues(alpha: 0.05),
                ),
              ),
            ),
            child: Stack(
              children: [
                // Map Background Image
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.7,
                    child: Image.network(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuB9kTEZt1ofPGkt7jFLo40Jvk037l8KOtxCgoZ6SggteUbwPDpTCblzwLQgMnB3R6Fm1krK35lTY9CYNRTnVmMD22ufKIKu_p5hSgEKDwsQETPoYZTsTBrlFQ70On6ncIQ7Y-YW--oZmcReSSSbuPNLdVzswyW2TlCIYFvmaxqYLsmZo1Bep-BVQqXUCym3I3QOXgpdcj6_G98yKQwOk39Nm9sOGrl8l-ffD6HaCl3EzpKhzNhncGjN',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Gradient Vignette
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.background.withValues(alpha: 0.8),
                          Colors.transparent,
                          AppColors.background.withValues(alpha: 0.9),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),

                // Marker 1 (Active Arcade Marker with tooltip)
                Positioned(
                  top: 130,
                  left: 100,
                  child: Column(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primaryFixedDim.withValues(alpha: 0.3),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryFixedDim.withValues(alpha: 0.8),
                              blurRadius: 15,
                              spreadRadius: 2,
                            )
                          ],
                        ),
                        child: Center(
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainer.withValues(alpha: 0.9),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: Colors.white.withValues(alpha: 0.1)),
                        ),
                        child: Text(
                          'Neon Arcade',
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryFixedDim,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Marker 2 (Pink Venue)
                Positioned(
                  top: 200,
                  right: 90,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.secondaryContainer,
                      border: Border.all(color: AppColors.secondary, width: 1.5),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.secondaryContainer.withValues(alpha: 0.6),
                          blurRadius: 10,
                          spreadRadius: 1,
                        )
                      ],
                    ),
                  ),
                ),

                // Marker 3 (Yellow Venue)
                Positioned(
                  top: 90,
                  right: 150,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.tertiaryFixed,
                      border: Border.all(color: AppColors.tertiaryFixedDim, width: 1.5),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.tertiaryFixed.withValues(alpha: 0.6),
                          blurRadius: 10,
                          spreadRadius: 1,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Active Hangouts List Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Active Hangouts',
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(
                            'Filter',
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryFixedDim,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.tune,
                              size: 16, color: AppColors.primaryFixedDim),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 16),

                // Hangout Card 1
                GlassCard(
                  borderColor: AppColors.primaryFixedDim.withValues(alpha: 0.3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cyber-Dojo Sparring',
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.location_on,
                                      size: 14,
                                      color: AppColors.onSurfaceVariant),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Shinjuku Grid Sector 4',
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      color: AppColors.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Starts in 15m',
                              style: GoogleFonts.spaceGrotesk(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: AppColors.secondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Capacity filling...',
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 11,
                              color: AppColors.onSurfaceVariant,
                            ),
                          ),
                          Text(
                            '8/10',
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryFixedDim,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      const CapacityBar(
                        progress: 0.8,
                        activeColor: AppColors.primaryFixedDim,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Hangout Card 2
                GlassCard(
                  borderColor: AppColors.secondaryContainer.withValues(alpha: 0.3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Synthwave DJ Set',
                                style: GoogleFonts.inter(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.location_on,
                                      size: 14,
                                      color: AppColors.onSurfaceVariant),
                                  const SizedBox(width: 4),
                                  Text(
                                    'The Neon Vault',
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      color: AppColors.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Live Now',
                              style: GoogleFonts.spaceGrotesk(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: AppColors.onSurfaceVariant,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Capacity filling...',
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 11,
                              color: AppColors.onSurfaceVariant,
                            ),
                          ),
                          Text(
                            '45/50',
                            style: GoogleFonts.spaceGrotesk(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: AppColors.secondaryContainer,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      const CapacityBar(
                        progress: 0.9,
                        activeColor: AppColors.secondaryContainer,
                      ),
                    ],
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
