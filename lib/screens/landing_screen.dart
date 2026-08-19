import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/glass_card.dart';

class LandingScreen extends StatelessWidget {
  final VoidCallback? onExploreMap;

  const LandingScreen({super.key, this.onExploreMap});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isDesktop = constraints.maxWidth > 800;
              return Column(
                children: [
                  const SizedBox(height: 20),
                  if (isDesktop)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: _buildHeroTextContent(context, onExploreMap)),
                        const SizedBox(width: 40),
                        Expanded(child: _buildLogoPresentation()),
                      ],
                    )
                  else ...[
                    _buildHeroTextContent(context, onExploreMap),
                    const SizedBox(height: 48),
                    _buildLogoPresentation(),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeroTextContent(BuildContext context, VoidCallback? onExploreMap) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Pill Badge
        GlassCard(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          borderRadius: 999,
          borderColor: AppColors.primaryFixedDim.withValues(alpha: 0.3),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.tertiaryFixed,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.tertiaryFixed,
                      blurRadius: 6,
                    )
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'V2.0 Now Live',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryFixedDim,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Headline
        RichText(
          text: TextSpan(
            style: GoogleFonts.inter(
              fontSize: 48,
              fontWeight: FontWeight.w800,
              height: 1.1,
              color: Colors.white,
            ),
            children: [
              const TextSpan(text: 'Find Your \n'),
              WidgetSpan(
                child: ShaderMask(
                  shaderCallback: (bounds) =>
                      AppColors.accentGradient.createShader(bounds),
                  child: Text(
                    'Vibe',
                    style: GoogleFonts.inter(
                      fontSize: 48,
                      fontWeight: FontWeight.w800,
                      height: 1.1,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        Text(
          'The nocturnal network for digital natives. Connect, explore, and leave your mark on the grid. High-fidelity social interactions start here.',
          style: GoogleFonts.inter(
            fontSize: 16,
            height: 1.6,
            color: AppColors.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 28),

        // CTA Buttons
        Wrap(
          spacing: 16,
          runSpacing: 12,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: AppColors.accentGradient,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryFixedDim.withValues(alpha: 0.4),
                    blurRadius: 15,
                  )
                ],
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 28, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Join the Thread',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward, size: 18),
                  ],
                ),
              ),
            ),
            OutlinedButton(
              onPressed: onExploreMap,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                    color: AppColors.primaryFixedDim, width: 1.5),
                foregroundColor: AppColors.primaryFixedDim,
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Explore Map',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 36),

        // Online Users Avatar Cluster
        Container(
          padding: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.white.withValues(alpha: 0.05),
              ),
            ),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 90,
                height: 36,
                child: Stack(
                  children: [
                    _avatarCircle('https://lh3.googleusercontent.com/aida-public/AB6AXuCOD78r9Z_fuSc2F44zO5u9xzQO0eiUDmDHURPjvllU_9Db3pNibrqXfhYAUQ-mC3EjGOszp9Gxcy7jcCeUdY_vFDACi51DRP_bbfLaqvw83KvGO28mvICRHP1FFoWeLq51hlfaX5ZJaXKPovPr6c2YhzZiLmXM7wZ4p-iPARhA3WTaxgktnhM5QnnecrfB2xmJWmd6ahnwXL2DVbI0HQBX5TvSlT--K5YCOT5sXscacnxKJbGNOnvO', 0),
                    _avatarCircle('https://lh3.googleusercontent.com/aida-public/AB6AXuCDvZL5Ae3cIMwrmkOBmCAVmXTI2qB46mjNQyvYq1LFYPmAwIVE_JiL51zyyFqOaaR4xQqArbou_LWrvXflBOfihXBeyyMCayeF6YRfsFM2ye9obDjlRKhFu5b9YExFoj-_X7XA9Szv9WKmqCQ0WAwFb9WJEOcn99g4O1GGa_STSkBWimtwrylH59LL6ZRoHe8p1bhFWADpRf0Ys6OXOmBbQB2F62nE4mzNVQYwWtq20yGv3JD_AMbn', 24),
                    _avatarCircle('https://lh3.googleusercontent.com/aida-public/AB6AXuBCjgXyd8xPfaOEOGOjVoseh6qUt5BV-4mZT4usKulzo6kBJWaA1Yue-lYJJmUzuoD8AQebArf9GgNlO9MkZHHpio3LuQ2DFJ4Am-a1GKLLfqWQt9qpw33_tptu3ueNo5JAQDWaKgrKDKGVN2Cdsw5flkZV5DvLSxiZJpWohjp3G6N5ngZHgdH-TfqsQtwv2299N82mSh32Fx61X0oHAs9JzdJTRxCBjdX-Oo6NvVUHWizCMP22FKkK', 48),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: AppColors.onSurfaceVariant,
                  ),
                  children: [
                    const TextSpan(text: 'Join '),
                    TextSpan(
                      text: '14,029',
                      style: GoogleFonts.inter(
                        color: AppColors.primaryFixedDim,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const TextSpan(text: ' users online'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _avatarCircle(String url, double left) {
    return Positioned(
      left: left,
      child: CircleAvatar(
        radius: 18,
        backgroundColor: AppColors.surface,
        child: CircleAvatar(
          radius: 16,
          backgroundImage: NetworkImage(url),
        ),
      ),
    );
  }

  Widget _buildLogoPresentation() {
    return SizedBox(
      height: 380,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Glow Effect
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryFixedDim.withValues(alpha: 0.15),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryFixedDim.withValues(alpha: 0.3),
                  blurRadius: 100,
                  spreadRadius: 20,
                )
              ],
            ),
          ),

          // Glass Logo Container
          GlassCard(
            borderRadius: 24,
            padding: const EdgeInsets.all(24),
            borderColor: AppColors.primaryFixedDim.withValues(alpha: 0.4),
            glowColor: AppColors.secondaryContainer,
            glowRadius: 30,
            child: SizedBox(
              width: 260,
              height: 260,
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuBjSRUYxDyGxs2yKZQ_YJp0_86teB9oyT47_UIW9L3rrOmQS9LjIS0UYnyC4Pcm9MpFTGrBeQ2sMKyjAXRHLnCqx2cTSak0SKAR6MQ1dKaocQMaWhbuWXZglK3az9PEm0SGiVPemgi-6Xm9elVyYYV1nlWIIjdjTGv6AeHrlVqdFQrp6TTaXphAy5J5MWkjBXIvAZAokUzq9kR5cStPzplPd2BIMWVTUNK2i1l03aVLKJX8MLYnNjIQ',
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Floating Location Badge
          Positioned(
            right: 10,
            top: 60,
            child: GlassCard(
              padding: const EdgeInsets.all(12),
              borderRadius: 12,
              borderColor: Colors.white.withValues(alpha: 0.15),
              child: Row(
                children: [
                  const Icon(Icons.location_on,
                      color: AppColors.primaryFixedDim, size: 20),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Location',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 10,
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                      Text(
                        'Neo-Tokyo',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
