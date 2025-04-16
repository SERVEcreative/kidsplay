import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdsService {
  static final AdsService _instance = AdsService._internal();
  factory AdsService() => _instance;
  AdsService._internal();

  static const String _prefsKeyLastInterstitial = 'last_interstitial_time';
  static const int _minimumInterstitialInterval = 60; // seconds

  // Test ad unit IDs
  static const String _bannerAdUnitId = 'ca-app-pub-3940256099942544/6300978111'; // Android test banner
  static const String _interstitialAdUnitId = 'ca-app-pub-3940256099942544/1033173712'; // Android test interstitial
  static const String _rewardedAdUnitId = 'ca-app-pub-3940256099942544/5224354917'; // Android test rewarded

  // iOS test ad unit IDs (uncomment when testing on iOS)
  // static const String _bannerAdUnitId = 'ca-app-pub-3940256099942544/2934735716'; // iOS test banner
  // static const String _interstitialAdUnitId = 'ca-app-pub-3940256099942544/4411468910'; // iOS test interstitial
  // static const String _rewardedAdUnitId = 'ca-app-pub-3940256099942544/1712485313'; // iOS test rewarded

  InterstitialAd? _interstitialAd;
  RewardedAd? _rewardedAd;
  bool _isInterstitialAdReady = false;
  bool _isRewardedAdReady = false;
  bool _isInitialized = false;

  Future<void> initialize() async {
    if (kIsWeb) {
      debugPrint('Ads are not supported on web platform');
      return;
    }

    try {
      await MobileAds.instance.initialize();
      _isInitialized = true;
      _loadInterstitialAd();
      _loadRewardedAd();
    } catch (e) {
      debugPrint('Failed to initialize ads: $e');
    }
  }

  BannerAd? createBannerAd() {
    if (!_isInitialized || kIsWeb) return null;

    return BannerAd(
      adUnitId: _bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {},
        onAdFailedToLoad: (ad, error) {
          debugPrint('Banner ad failed to load: $error');
          ad.dispose();
        },
      ),
    );
  }

  Future<void> _loadInterstitialAd() async {
    if (!_isInitialized || kIsWeb) return;

    try {
      await InterstitialAd.load(
        adUnitId: _interstitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            _interstitialAd = ad;
            _isInterstitialAdReady = true;
            _setupInterstitialCallbacks();
          },
          onAdFailedToLoad: (error) {
            debugPrint('Interstitial ad failed to load: $error');
            _isInterstitialAdReady = false;
            _loadInterstitialAd(); // Retry loading
          },
        ),
      );
    } catch (e) {
      debugPrint('Error loading interstitial ad: $e');
    }
  }

  void _setupInterstitialCallbacks() {
    if (!_isInitialized || kIsWeb) return;

    _interstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        _isInterstitialAdReady = false;
        _loadInterstitialAd(); // Load the next ad
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        debugPrint('Interstitial ad failed to show: $error');
        ad.dispose();
        _isInterstitialAdReady = false;
        _loadInterstitialAd(); // Retry loading
      },
    );
  }

  Future<void> _loadRewardedAd() async {
    if (!_isInitialized || kIsWeb) return;

    try {
      await RewardedAd.load(
        adUnitId: _rewardedAdUnitId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            _rewardedAd = ad;
            _isRewardedAdReady = true;
            _setupRewardedCallbacks();
          },
          onAdFailedToLoad: (error) {
            debugPrint('Rewarded ad failed to load: $error');
            _isRewardedAdReady = false;
            _loadRewardedAd(); // Retry loading
          },
        ),
      );
    } catch (e) {
      debugPrint('Error loading rewarded ad: $e');
    }
  }

  void _setupRewardedCallbacks() {
    if (!_isInitialized || kIsWeb) return;

    _rewardedAd?.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        _isRewardedAdReady = false;
        _loadRewardedAd(); // Load the next ad
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        debugPrint('Rewarded ad failed to show: $error');
        ad.dispose();
        _isRewardedAdReady = false;
        _loadRewardedAd(); // Retry loading
      },
    );
  }

  Future<bool> showInterstitialAdIfReady() async {
    if (!_isInitialized || kIsWeb || !_isInterstitialAdReady) return false;

    try {
      final prefs = await SharedPreferences.getInstance();
      final lastShowTime = prefs.getInt(_prefsKeyLastInterstitial) ?? 0;
      final currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      if (currentTime - lastShowTime < _minimumInterstitialInterval) {
        return false;
      }

      await _interstitialAd?.show();
      await prefs.setInt(_prefsKeyLastInterstitial, currentTime);
      return true;
    } catch (e) {
      debugPrint('Error showing interstitial ad: $e');
      return false;
    }
  }

  Future<bool> showRewardedAdIfReady() async {
    if (!_isInitialized || kIsWeb || !_isRewardedAdReady) return false;

    try {
      await _rewardedAd?.show(
        onUserEarnedReward: (_, reward) {
          // Handle reward here
        },
      );
      return true;
    } catch (e) {
      debugPrint('Error showing rewarded ad: $e');
      return false;
    }
  }

  void dispose() {
    if (!_isInitialized || kIsWeb) return;
    
    _interstitialAd?.dispose();
    _rewardedAd?.dispose();
  }
} 