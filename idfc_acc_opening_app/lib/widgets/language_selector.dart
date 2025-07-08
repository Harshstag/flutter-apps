import 'package:flutter/material.dart';
import 'package:idfc_acc_opening_app/main.dart';
import 'package:idfc_acc_opening_app/providers/language_provider.dart';

class FancyLanguageSelector extends StatefulWidget {
  final LanguageProvider languageProvider;
  final bool showDropdown;

  const FancyLanguageSelector({
    super.key,
    required this.languageProvider,
    this.showDropdown = false,
  });

  @override
  State<FancyLanguageSelector> createState() => _FancyLanguageSelectorState();
}

class _FancyLanguageSelectorState extends State<FancyLanguageSelector>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  bool _isDropdownOpen = false;
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _removeOverlay();
    super.dispose();
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _toggleDropdown() {
    setState(() {
      _isDropdownOpen = !_isDropdownOpen;
    });

    if (_isDropdownOpen) {
      _animationController.forward();
      _showOverlay();
    } else {
      _animationController.reverse();
      _removeOverlay();
    }
  }

  void _showOverlay() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: offset.dy + size.height,
        left: offset.dx,
        child: Material(
          color: Colors.transparent,
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  alignment: Alignment.topCenter,
                  child: Container(
                    constraints: const BoxConstraints(
                      maxHeight: 250,
                      minWidth: 130,
                      maxWidth: 130,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: LanguageProvider.supportedLanguages
                              .map((language) => _buildLanguageOption(language))
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _selectLanguage(LanguageModel language) {
    widget.languageProvider.changeLanguage(language.locale);
    _toggleDropdown();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: GestureDetector(
        onTap: () {
          if (widget.showDropdown) {
            _toggleDropdown();
          } else {
            widget.languageProvider.toggleLanguage();
          }
        },
        onLongPress: () {
          if (!widget.showDropdown) {
            _toggleDropdown();
          }
        },
        child: Container(
          constraints: const BoxConstraints(minWidth: 130, maxWidth: 130),
          decoration: BoxDecoration(
            borderRadius: _isDropdownOpen
                ? const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )
                : BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [IdfcColors.primary, IdfcColors.primary.withOpacity(0.8)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: IdfcColors.primary.withOpacity(0.0),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: _isDropdownOpen
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )
                  : BorderRadius.circular(15),
              onTap: () {
                if (widget.showDropdown) {
                  _toggleDropdown();
                } else {
                  widget.languageProvider.toggleLanguage();
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.language,
                          color: Colors.white,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          widget.languageProvider.currentLanguageName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    if (widget.showDropdown)
                      AnimatedRotation(
                        duration: const Duration(milliseconds: 300),
                        turns: _isDropdownOpen ? 0.5 : 0.0,
                        child: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageOption(LanguageModel language) {
    final isSelected = widget.languageProvider.currentLocale == language.locale;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _selectLanguage(language),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected
                ? IdfcColors.primary.withOpacity(0.1)
                : Colors.transparent,
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.withOpacity(0.2),
                width: 0.5,
              ),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                language.name,
                style: TextStyle(
                  color: isSelected ? IdfcColors.primary : Colors.black87,
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                ),
              ),
              const Spacer(),
              if (isSelected)
                const Icon(
                  Icons.check_circle,
                  color: IdfcColors.primary,
                  size: 16,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageToggleButton extends StatelessWidget {
  final LanguageProvider languageProvider;

  const LanguageToggleButton({super.key, required this.languageProvider});

  @override
  Widget build(BuildContext context) {
    return FancyLanguageSelector(
      languageProvider: languageProvider,
      showDropdown: true,
    );
  }
}
