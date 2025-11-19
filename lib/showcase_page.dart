import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

class ShowcasePage extends StatelessWidget {
  const ShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF03030C),
      body: Stack(
        children: [
          const _GlassBackdrop(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeading(context),
                  const SizedBox(height: 32),
                  _buildHeroCard(context),
                  const SizedBox(height: 32),
                  _buildFeatureGrid(context),
                  const SizedBox(height: 32),
                  _buildMoodBoard(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeading(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Liquid Glass Studio',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'A minimal desktop scene focused entirely on the beautiful refractions\ncreated by liquid glass.',
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: Colors.white70, height: 1.5),
        ),
      ],
    );
  }

  Widget _buildHeroCard(BuildContext context) {
    return LiquidGlassLayer(
      settings: LiquidGlassSettings(
        ambientStrength: 0.8,
        thickness: 28,
        glassColor: Colors.white.withOpacity(0.08),
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withOpacity(0.15),
              Colors.white.withOpacity(0.04),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.08),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: const Icon(
                    Icons.water_drop_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Artist Workspace',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Hand crafted glass layers with subtle lighting',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            LiquidGlass(
              settings: LiquidGlassSettings(
                ambientStrength: 0.6,
                thickness: 18,
                glassColor: Colors.white.withOpacity(0.18),
              ),
              shape: LiquidRoundedRectangle(
                borderRadius: const Radius.circular(26),
              ),
              glassContainsChild: false,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  border: Border.all(color: Colors.white.withOpacity(0.1)),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.25),
                      Colors.white.withOpacity(0.08),
                    ],
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.auto_awesome,
                      color: Colors.white,
                      size: 32,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Glassmorphism Playground',
                            style: Theme.of(
                              context,
                            ).textTheme.titleMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Combine shapes, intensity and colors to craft your\nown floating glass surfaces.',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureGrid(BuildContext context) {
    final features = <(String, IconData)>[
      ('Crystalline edges', Icons.blur_on_rounded),
      ('Soft gradients', Icons.gradient),
      ('Ambient glow', Icons.light_mode_outlined),
      ('Layered panels', Icons.layers),
      ('Frosted chips', Icons.chair_rounded),
      ('Floating buttons', Icons.radio_button_checked),
    ];

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children:
          features.map((feature) {
            return SizedBox(
              width: 200,
              child: LiquidGlass(
                settings: LiquidGlassSettings(
                  ambientStrength: 0.45,
                  thickness: 16,
                  glassColor: Colors.white.withOpacity(0.12),
                ),
                shape: LiquidRoundedRectangle(
                  borderRadius: const Radius.circular(22),
                ),
                glassContainsChild: false,
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.2),
                        Colors.white.withOpacity(0.05),
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(feature.$2, color: Colors.white),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          feature.$1,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }

  Widget _buildMoodBoard(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Mood board',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: LiquidGlassLayer(
                settings: LiquidGlassSettings(
                  ambientStrength: 0.7,
                  thickness: 20,
                  glassColor: Colors.white.withOpacity(0.09),
                ),
                child: Container(
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF00D2FF), Color(0xFF3A47D5)],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.blur_circular_rounded,
                        color: Colors.white.withOpacity(0.9),
                        size: 48,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Deep glass panel',
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Thick layers + high ambient strength',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                children: [
                  _moodChip(
                    context,
                    title: 'Frosted pill',
                    subtitle: 'Rounded rectangle',
                  ),
                  const SizedBox(height: 16),
                  _moodChip(
                    context,
                    title: 'Glass button',
                    subtitle: 'Ambient glow',
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _moodChip(
    BuildContext context, {
    required String title,
    required String subtitle,
  }) {
    return LiquidGlass(
      settings: LiquidGlassSettings(
        ambientStrength: 0.55,
        thickness: 14,
        glassColor: Colors.white.withOpacity(0.15),
      ),
      shape: LiquidRoundedRectangle(borderRadius: const Radius.circular(22)),
      glassContainsChild: false,
      child: Container(
        height: 100,
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withOpacity(0.25),
              Colors.white.withOpacity(0.07),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.white70,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GlassBackdrop extends StatelessWidget {
  const _GlassBackdrop();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF0F0C29), Color(0xFF302B63), Color(0xFF24243e)],
            ),
          ),
        ),
        Positioned(
          top: -50,
          left: -30,
          child: _glowCircle(const Color(0xFF7F5BFF), 220),
        ),
        Positioned(
          bottom: -60,
          right: -40,
          child: _glowCircle(const Color(0xFF00D2FF), 260),
        ),
        Positioned(
          bottom: 100,
          left: 40,
          child: _glowCircle(const Color(0xFFFF6B6B), 120),
        ),
      ],
    );
  }

  Widget _glowCircle(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.25),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            blurRadius: 120,
            spreadRadius: 40,
          ),
        ],
      ),
    );
  }
}
