import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final PageController _cardPageController = PageController();
  int _currentCardIndex = 0;

  // Mock data for recent activities
  final List<Map<String, dynamic>> _activities = [
    {
      'title': 'Chai & Samosa',
      'subtitle': 'Office Chai Group • Paid by Aman',
      'amount': '₹45.00',
      'isOwed': true,
      'isPersonal': false,
      'category': 'food',
      'date': 'Today, 4:30 PM',
    },
    {
      'title': 'Uber ride to Client Office',
      'subtitle': 'Personal Log',
      'amount': '₹240.00',
      'isOwed': false,
      'isPersonal': true,
      'category': 'travel',
      'date': 'Today, 2:15 PM',
    },
    {
      'title': 'Team Lunch (Pizza)',
      'subtitle': 'Paid by You • Split equally',
      'amount': '₹1,250.00',
      'isOwed': false,
      'isPersonal': false,
      'category': 'food',
      'date': 'Yesterday, 1:10 PM',
    },
    {
      'title': 'Monthly Internet subscription',
      'subtitle': 'Personal Log',
      'amount': '₹799.00',
      'isOwed': false,
      'isPersonal': true,
      'category': 'bills',
      'date': '1 Jun 2026',
    },
    {
      'title': 'Printouts & Stationery',
      'subtitle': 'Office Admin • Paid by Rohit',
      'amount': '₹120.00',
      'isOwed': true,
      'isPersonal': false,
      'category': 'other',
      'date': '30 May 2026',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _cardPageController.dispose();
    super.dispose();
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'food':
        return Icons.restaurant;
      case 'travel':
        return Icons.directions_car;
      case 'bills':
        return Icons.receipt_long;
      default:
        return Icons.category;
    }
  }

  Color _getCategoryColor(String category, bool isDark) {
    switch (category) {
      case 'food':
        return isDark ? AppColors.warning900 : AppColors.warning100;
      case 'travel':
        return isDark ? AppColors.info900 : AppColors.info100;
      case 'bills':
        return isDark ? AppColors.primary900 : AppColors.primary100;
      default:
        return isDark ? AppColors.neutral800 : AppColors.neutral100;
    }
  }

  Color _getCategoryIconColor(String category, bool isDark) {
    switch (category) {
      case 'food':
        return isDark ? AppColors.warning300 : AppColors.warning700;
      case 'travel':
        return isDark ? AppColors.info300 : AppColors.info700;
      case 'bills':
        return isDark ? AppColors.primary300 : AppColors.primary700;
      default:
        return isDark ? AppColors.neutral300 : AppColors.neutral600;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 1));
          },
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              // ── HEADER SECTION ───────────────────────────────────
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good evening, Prem 👋',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: isDark ? AppColors.neutral50 : AppColors.neutral900,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Wednesday, June 3',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: isDark ? AppColors.neutral500 : AppColors.neutral500,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isDark ? AppColors.darkSurface3 : AppColors.neutral200,
                            width: 2,
                          ),
                        ),
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&w=100&q=80',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ── CARD SLIDER (DUAL MODE) ───────────────────────────
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 180,
                        child: PageView(
                          controller: _cardPageController,
                          onPageChanged: (index) {
                            setState(() {
                              _currentCardIndex = index;
                            });
                          },
                          children: [
                            _buildSharedBalanceCard(isDark),
                            _buildPersonalBudgetCard(isDark),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(2, (index) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            height: 6,
                            width: _currentCardIndex == index ? 18 : 6,
                            decoration: BoxDecoration(
                              color: _currentCardIndex == index
                                  ? (isDark ? AppColors.primary400 : AppColors.primary600)
                                  : (isDark ? AppColors.darkSurface3 : AppColors.neutral300),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),

              // ── QUICK ACTIONS ────────────────────────────────────
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildActionButton(
                          context: context,
                          label: 'Add Expense',
                          icon: Icons.add_rounded,
                          color: isDark ? AppColors.primary500 : AppColors.primary600,
                          textColor: AppColors.white,
                          onTap: () {
                            // TODO: Navigate to Add Expense screen
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildActionButton(
                          context: context,
                          label: 'Settle Up',
                          icon: Icons.payment_rounded,
                          color: isDark ? AppColors.darkSurface : AppColors.white,
                          textColor: isDark ? AppColors.neutral50 : AppColors.neutral900,
                          onTap: () {
                            // TODO: Navigate to Settle Up list
                          },
                          border: Border.all(
                            color: isDark ? AppColors.darkSurface3 : AppColors.neutral200,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ── RECENT ACTIVITY HEADER ───────────────────────────
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recent Activity',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: isDark ? AppColors.neutral50 : AppColors.neutral900,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TabBar(
                        controller: _tabController,
                        indicatorSize: TabBarIndicatorSize.tab,
                        dividerColor: Colors.transparent,
                        labelColor: isDark ? AppColors.primary300 : AppColors.primary700,
                        unselectedLabelColor: isDark ? AppColors.neutral500 : AppColors.neutral400,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: isDark ? AppColors.primary900.withOpacity(0.3) : AppColors.primary50,
                        ),
                        tabs: const [
                          Tab(text: 'All'),
                          Tab(text: 'Shared'),
                          Tab(text: 'Personal'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // ── RECENT ACTIVITY LIST ─────────────────────────────
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                sliver: SliverToBoxAdapter(
                  child: AnimatedBuilder(
                    animation: _tabController,
                    builder: (context, _) {
                      // Filter list based on selected tab index
                      final filteredList = _activities.where((activity) {
                        if (_tabController.index == 1) return !activity['isPersonal'];
                        if (_tabController.index == 2) return activity['isPersonal'];
                        return true;
                      }).toList();

                      if (filteredList.isEmpty) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 40),
                            child: Text(
                              'No transactions found',
                              style: TextStyle(
                                color: isDark ? AppColors.neutral600 : AppColors.neutral400,
                              ),
                            ),
                          ),
                        );
                      }

                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: filteredList.length,
                        separatorBuilder: (context, index) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final item = filteredList[index];
                          final isPersonal = item['isPersonal'];
                          final isOwed = item['isOwed'];
                          
                          Color amountColor;
                          String prefix = '';
                          if (isPersonal) {
                            amountColor = isDark ? AppColors.neutral300 : AppColors.neutral800;
                          } else if (isOwed) {
                            amountColor = AppColors.error500;
                            prefix = '-';
                          } else {
                            amountColor = AppColors.success500;
                            prefix = '+';
                          }

                          return Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isDark ? AppColors.darkSurface : AppColors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: isDark ? AppColors.darkSurface2 : AppColors.neutral200,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: _getCategoryColor(item['category'], isDark),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    _getCategoryIcon(item['category']),
                                    color: _getCategoryIconColor(item['category'], isDark),
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['title'],
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: isDark ? AppColors.neutral50 : AppColors.neutral900,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        item['subtitle'],
                                        style: GoogleFonts.plusJakartaSans(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: isDark ? AppColors.neutral500 : AppColors.neutral500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '$prefix${item['amount']}',
                                      style: GoogleFonts.plusJakartaSans(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: amountColor,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      item['date'],
                                      style: GoogleFonts.plusJakartaSans(
                                        fontSize: 10,
                                        color: isDark ? AppColors.neutral600 : AppColors.neutral400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSharedBalanceCard(bool isDark) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? [const Color(0xFF1E2243), const Color(0xFF13152C)]
              : [AppColors.primary600, AppColors.primary800],
        ),
        boxShadow: [
          BoxShadow(
            color: (isDark ? AppColors.black : AppColors.primary500).withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'SHARED OFFICE SPENDS',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  color: AppColors.white.withOpacity(0.6),
                  letterSpacing: 1.5,
                ),
              ),
              const Icon(
                Icons.people_alt_rounded,
                color: AppColors.white,
                size: 20,
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Owed to You',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white.withOpacity(0.8),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '₹1,250.00',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                width: 1,
                color: AppColors.white.withOpacity(0.2),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'You Owe',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white.withOpacity(0.8),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '₹165.00',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: AppColors.warning300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalBudgetCard(bool isDark) {
    const double limit = 10000.00;
    const double spent = 6240.00;
    const double progress = spent / limit;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? [const Color(0xFF0F2C2C), const Color(0xFF0B1919)]
              : [const Color(0xFF0F766E), const Color(0xFF115E59)],
        ),
        boxShadow: [
          BoxShadow(
            color: (isDark ? AppColors.black : const Color(0xFF0F766E)).withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'PERSONAL SPENDING LIMIT',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  color: AppColors.white.withOpacity(0.6),
                  letterSpacing: 1.5,
                ),
              ),
              const Icon(
                Icons.wallet_rounded,
                color: AppColors.white,
                size: 20,
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Spent this month',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '₹6,240.00',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              Text(
                'Limit: ₹10k',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white.withOpacity(0.8),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              backgroundColor: AppColors.white.withOpacity(0.2),
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.warning300),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required String label,
    required IconData icon,
    required Color color,
    required Color textColor,
    required VoidCallback onTap,
    BoxBorder? border,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
            border: border,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: textColor,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
