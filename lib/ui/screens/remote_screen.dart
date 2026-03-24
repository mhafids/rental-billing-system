import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/remote_viewmodel.dart';
import '../../proto/remotemessage.pbenum.dart';

class RemoteScreen extends StatefulWidget {
  const RemoteScreen({super.key});

  @override
  State<RemoteScreen> createState() => _RemoteScreenState();
}

class _RemoteScreenState extends State<RemoteScreen> {
  final _secretController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<RemoteViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(model.selectedDevice?.name ?? 'Remote'),
            actions: [
              IconButton(
                icon: const Icon(Icons.power_settings_new, color: Colors.redAccent),
                onPressed: () => model.sendKey(RemoteKeyCode.KEYCODE_POWER),
              ),
            ],
          ),
          body: Stack(
            children: [
              // Main Remote UI
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  child: Column(
                    children: [
                      _buildDPad(model),
                      const SizedBox(height: 48),
                      _buildMiddleButtons(model),
                      const SizedBox(height: 48),
                      _buildVolumeButtons(model),
                    ],
                  ),
                ),
              ),

              // Pairing Overlay
              if (model.status == ConnectionStatus.pairing)
                _buildPairingOverlay(context, model),
                
              if (model.status == ConnectionStatus.connecting)
                const Center(child: CircularProgressIndicator()),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPairingOverlay(BuildContext context, RemoteViewModel model) {
    return Container(
      color: Colors.black.withValues(alpha: 0.9),
      padding: const EdgeInsets.all(32),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.security, size: 64, color: Color(0xFF38BDF8)),
            const SizedBox(height: 24),
            const Text(
              'Enter Pairing Code',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Enter the 6-digit code shown on your TV screen.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white60),
            ),
            const SizedBox(height: 32),
            TextField(
              controller: _secretController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.text,
              style: const TextStyle(fontSize: 32, letterSpacing: 16, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: 'XXXXXX',
                hintStyle: const TextStyle(color: Colors.white12),
                filled: true,
                fillColor: Colors.white.withValues(alpha: 0.05),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => model.submitSecret(_secretController.text),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF38BDF8),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text('Connect'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDPad(RemoteViewModel model) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.03),
          shape: BoxShape.circle,
          border: Border.fromBorderSide(BorderSide(color: Colors.white.withValues(alpha:0.05))),
        ),
        child: Stack(
          children: [
            // Up
            Align(
              alignment: const Alignment(0, -0.7),
              child: _NavButton(
                icon: Icons.keyboard_arrow_up,
                onTap: () => model.sendKey(RemoteKeyCode.KEYCODE_DPAD_UP),
              ),
            ),
            // Down
            Align(
              alignment: const Alignment(0, 0.7),
              child: _NavButton(
                icon: Icons.keyboard_arrow_down,
                onTap: () => model.sendKey(RemoteKeyCode.KEYCODE_DPAD_DOWN),
              ),
            ),
            // Left
            Align(
              alignment: const Alignment(-0.7, 0),
              child: _NavButton(
                icon: Icons.keyboard_arrow_left,
                onTap: () => model.sendKey(RemoteKeyCode.KEYCODE_DPAD_LEFT),
              ),
            ),
            // Right
            Align(
              alignment: const Alignment(0.7, 0),
              child: _NavButton(
                icon: Icons.keyboard_arrow_right,
                onTap: () => model.sendKey(RemoteKeyCode.KEYCODE_DPAD_RIGHT),
              ),
            ),
            // Center (OK)
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () => model.sendKey(RemoteKeyCode.KEYCODE_DPAD_CENTER),
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Color(0xFF38BDF8),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(color: Color(0x4438BDF8), blurRadius: 20, spreadRadius: 5),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'OK',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMiddleButtons(RemoteViewModel model) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _FunctionButton(
          icon: Icons.arrow_back,
          label: 'Back',
          onTap: () => model.sendKey(RemoteKeyCode.KEYCODE_BACK),
        ),
        _FunctionButton(
          icon: Icons.home_outlined,
          label: 'Home',
          onTap: () => model.sendKey(RemoteKeyCode.KEYCODE_HOME),
        ),
        _FunctionButton(
          icon: Icons.menu,
          label: 'Menu',
          onTap: () => model.sendKey(RemoteKeyCode.KEYCODE_MENU),
        ),
      ],
    );
  }

  Widget _buildVolumeButtons(RemoteViewModel model) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.volume_down_outlined, size: 28),
            onPressed: () => model.sendKey(RemoteKeyCode.KEYCODE_VOLUME_DOWN),
          ),
          const Text('VOLUME', style: TextStyle(color: Colors.white24, fontWeight: FontWeight.bold)),
          IconButton(
            icon: const Icon(Icons.volume_up_outlined, size: 28),
            onPressed: () => model.sendKey(RemoteKeyCode.KEYCODE_VOLUME_UP),
          ),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _NavButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, size: 40, color: Colors.white),
      onPressed: onTap,
    );
  }
}

class _FunctionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _FunctionButton({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(icon, size: 28),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.white38)),
      ],
    );
  }
}
