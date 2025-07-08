import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:idfc_acc_opening_app/main.dart';
import 'package:idfc_acc_opening_app/localization/app_localizations.dart';
import 'package:idfc_acc_opening_app/providers/language_provider.dart';
import 'package:idfc_acc_opening_app/widgets/language_selector.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountOpeningApp extends StatefulWidget {
  final LanguageProvider languageProvider;

  const AccountOpeningApp({super.key, required this.languageProvider});

  @override
  State<AccountOpeningApp> createState() => _AccountOpeningAppState();
}

class _AccountOpeningAppState extends State<AccountOpeningApp> {
  String? selectedValue;
  String? sourceOfIncomeValue;
  String? nomineeChoice;
  bool isKycConfirmed = false;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/images/Logo_of_IDFC_First_Bank.png',
              height: 100,
              width: 100,
              fit: BoxFit.contain,
            ),
          ],
        ),
        actions: [
          // Fancy Language Selector with Dropdown
          LanguageToggleButton(languageProvider: widget.languageProvider),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: AlignmentDirectional.centerStart,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 236, 244),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner Section
              Card(
                elevation: 8,
                color: IdfcColors.bannerBackground,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(
                        top: 12.0,
                        left: 16.0,
                        right: 16.0,
                      ),
                      width: double.infinity,
                      child: Image.asset(
                        "assets/images/Banner_en.png",
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        bottom: 6.0,
                        left: 16.0,
                        right: 16.0,
                      ),
                      width: double.infinity,
                      height: 210,
                      child: Container(
                        padding: const EdgeInsets.only(
                          bottom: 26.0,
                          left: 4.0,
                          right: 4.0,
                          top: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: localizations.enjoyZeroFee,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: localizations.zeroFreeBanking,
                                  style: const TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: localizations.onYourSavingsAccount,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                WidgetSpan(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      right: 3.0,
                                      left: 2.0,
                                      top: 2.0,
                                      bottom: 2.0,
                                    ),
                                    child: Icon(
                                      Icons.currency_rupee,
                                      color: Colors.yellow,
                                      size: 12,
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: localizations.impsNeftRtgs,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                WidgetSpan(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      right: 4.0,
                                      left: 2.0,
                                      top: 2.0,
                                      bottom: 2.0,
                                    ),
                                    child: Icon(
                                      Icons.money_rounded,
                                      color: Colors.yellow,
                                      size: 12,
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: localizations.atmTransactions,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                WidgetSpan(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      right: 4.0,
                                      left: 2.0,
                                      top: 2.0,
                                      bottom: 2.0,
                                    ),
                                    child: Icon(
                                      Icons.mobile_friendly_sharp,
                                      color: Colors.yellow,
                                      size: 12,
                                    ),
                                  ),
                                ),
                                TextSpan(
                                  text: localizations.smsAlerts,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(
                                  text: localizations.moreServices,
                                  style: const TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: AlignmentDirectional.centerEnd,
                      padding: const EdgeInsets.only(
                        bottom: 16.0,
                        top: 2,
                        right: 24,
                      ),
                      width: double.infinity,
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: localizations.clickHereToView,
                              style: const TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w500,
                                color: Colors.red,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  final Uri url = Uri.parse(
                                    'https://www.google.com',
                                  );
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                },
                            ),
                            TextSpan(
                              text: localizations.zeroFeeBankingServices,
                              style: const TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 82, 81, 81),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Form Section
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      localizations.enterDetailsToStart,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 20),

                    // Mobile Number Field
                    TextField(
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      decoration: InputDecoration(
                        labelText: localizations.aadhaarLinkedMobile,
                        prefixIcon: Container(
                          padding: const EdgeInsets.all(15),
                          child: const Text(
                            '+91',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        prefixIconConstraints: const BoxConstraints(
                          minWidth: 0,
                          minHeight: 0,
                        ),
                        counterText: "",
                        suffixIcon: const Icon(
                          Icons.phone_android,
                          color: IdfcColors.textSecondary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Date of Birth Field
                    TextField(
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        labelText: localizations.dateOfBirth,
                        suffixIcon: const Icon(
                          Icons.calendar_month_rounded,
                          color: IdfcColors.textSecondary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Email Field
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: localizations.emailAddress,
                        suffixIcon: const Icon(
                          Icons.email,
                          color: IdfcColors.textSecondary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // PAN Field
                    TextField(
                      keyboardType: TextInputType.text,
                      maxLength: 10,
                      decoration: InputDecoration(
                        labelText: localizations.pan,
                        counterText: "",
                        suffixIcon: Icon(
                          Icons.card_membership_outlined,
                          color: IdfcColors.textSecondary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Aadhaar Number Field
                    TextField(
                      keyboardType: TextInputType.number,
                      maxLength: 12,
                      decoration: InputDecoration(
                        labelText: localizations.aadhaarNumber,
                        suffixIcon: const Icon(
                          Icons.document_scanner_outlined,
                          color: IdfcColors.textSecondary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Aadhaar Alternative and OTP Button
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 3,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: localizations.clickHereIfNoAadhaar,
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  TextSpan(
                                    text: localizations.ifYouDontHaveAadhaar,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            flex: 2,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                localizations.getOtp,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60),

                    // Professional Details Section
                    Text(
                      localizations.professionalPersonalDetails,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 30),

                    // Occupation Dropdown
                    DropdownButtonFormField<String>(
                      value: selectedValue,
                      decoration: InputDecoration(
                        labelText: localizations.occupation,
                      ),
                      items: [
                        DropdownMenuItem<String>(
                          value: 'corporate_job',
                          child: Text(localizations.corporateJob),
                        ),
                        DropdownMenuItem<String>(
                          value: 'farmer',
                          child: Text(localizations.farmer),
                        ),
                        DropdownMenuItem<String>(
                          value: 'government_job',
                          child: Text(localizations.governmentJob),
                        ),
                        DropdownMenuItem<String>(
                          value: 'self_employed',
                          child: Text(localizations.selfEmployed),
                        ),
                        DropdownMenuItem<String>(
                          value: 'business',
                          child: Text(localizations.business),
                        ),
                      ],
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return localizations.pleaseSelectOption;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    // Source of Income Dropdown
                    DropdownButtonFormField<String>(
                      value: sourceOfIncomeValue,
                      decoration: InputDecoration(
                        labelText: localizations.sourceOfIncome,
                      ),
                      items: [
                        DropdownMenuItem<String>(
                          value: 'occupation',
                          child: Text(localizations.occupation),
                        ),
                        DropdownMenuItem<String>(
                          value: 'property_rent',
                          child: Text(localizations.propertyRent),
                        ),
                        DropdownMenuItem<String>(
                          value: 'trading',
                          child: Text(localizations.trading),
                        ),
                        DropdownMenuItem<String>(
                          value: 'crypto',
                          child: Text(localizations.crypto),
                        ),
                        DropdownMenuItem<String>(
                          value: 'business',
                          child: Text(localizations.business),
                        ),
                      ],
                      onChanged: (String? newValue) {
                        setState(() {
                          sourceOfIncomeValue = newValue;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return localizations.pleaseSelectOption;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),

                    // Gross Annual Income Field
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: localizations.grossAnnualIncome,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Mother's Name Field
                    TextField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        labelText: localizations.motherFullName,
                      ),
                    ),
                    const SizedBox(height: 30),

                    const Divider(),
                    const SizedBox(height: 30),

                    // Product Selection Section
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: localizations.selectYour,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          TextSpan(
                            text: localizations.product,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Product Benefits Card
                    Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(14, 20, 14, 8),
                            child: Text(
                              localizations.eachProductGives,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  24,
                                  14,
                                  14,
                                  24,
                                ),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: localizations.upTo,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodySmall,
                                      ),
                                      const TextSpan(
                                        text: "7%\n",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                      TextSpan(
                                        text: localizations.paInterest,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  14,
                                  14,
                                  14,
                                  24,
                                ),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: localizations.monthly,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.headlineSmall,
                                      ),
                                      TextSpan(
                                        text: localizations.interestCredit,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  14,
                                  14,
                                  14,
                                  24,
                                ),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: localizations.zeroCharge,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.headlineSmall,
                                      ),
                                      TextSpan(
                                        text: localizations.onAllServices,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Product Cards Section
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          // Benefits Card
                          _buildProductCard(
                            context,
                            width: 160,
                            headerText: localizations.benefits,
                            subHeaderText:
                                localizations.onAverageMonthlyBalance,
                            benefits: [
                              {
                                'icon': Icons.flight,
                                'text': localizations.airportLoungeAccess,
                              },
                              {
                                'icon': Icons.card_membership_outlined,
                                'text': localizations.freeAtmTransaction,
                              },
                              {
                                'icon': Icons.online_prediction,
                                'text': localizations.lockerRentalDiscount,
                              },
                              {
                                'icon': Icons.movie,
                                'text': localizations.instantOnlineDiscounts,
                              },
                              {
                                'icon': Icons.shopping_bag,
                                'text': localizations.purchaseProtection,
                              },
                            ],
                          ),

                          // ₹15,000 Card
                          _buildProductCard(
                            context,
                            width: 140,
                            headerText: '₹15,000',
                            subHeaderText: localizations.freeDebitCard,
                            benefits: [
                              {'icon': Icons.close, 'text': ""},
                              {'text': localizations.unlimited},
                              {'icon': Icons.check, 'text': ""},
                              {'icon': Icons.check, 'text': ""},
                              {'text': "₹50K"},
                            ],
                          ),

                          // ₹25,000 Card
                          _buildProductCard(
                            context,
                            width: 140,
                            headerText: '₹25,000',
                            subHeaderText: localizations.freePremiumDebitCard,
                            benefits: [
                              {'icon': Icons.check, 'text': ""},
                              {'text': localizations.unlimited},
                              {'icon': Icons.check, 'text': ""},
                              {'icon': Icons.check, 'text': ""},
                              {'text': "₹1 Lakh"},
                            ],
                          ),
                        ],
                      ),
                    ),

                    // View All Offers Link
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: localizations.clickHereToViewAllOffers,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              TextSpan(
                                text: localizations.allOffers,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: IdfcColors.primary,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    final Uri url = Uri.parse(
                                      'https://www.google.com',
                                    );
                                    if (await canLaunchUrl(url)) {
                                      await launchUrl(url);
                                    }
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Nominee Section
                    Container(
                      padding: const EdgeInsets.fromLTRB(18, 20, 18, 20),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 254),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                const WidgetSpan(
                                  child: Icon(
                                    Icons.person_2_outlined,
                                    size: 20,
                                    color: IdfcColors.primary,
                                  ),
                                ),
                                TextSpan(
                                  text: localizations.wantToAddNominee,
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineSmall,
                                ),
                                TextSpan(
                                  text: localizations.nomineeRecommendation,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Radio<String>(
                                value: 'yes',
                                groupValue: nomineeChoice,
                                onChanged: (String? value) {
                                  setState(() {
                                    nomineeChoice = value;
                                  });
                                },
                              ),
                              Text(
                                localizations.yesAddNominee,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              const SizedBox(width: 10),
                              Radio<String>(
                                value: 'no',
                                groupValue: nomineeChoice,
                                onChanged: (String? value) {
                                  setState(() {
                                    nomineeChoice = value;
                                  });
                                },
                              ),
                              Expanded(
                                child: Text(
                                  localizations.noDoNotWish,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),

                    const Divider(),
                    const SizedBox(height: 30),

                    // Disclaimer Section
                    Text(
                      localizations.disclaimer,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 20),

                    // KYC Disclaimer
                    Container(
                      alignment: AlignmentDirectional.centerStart,
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.flag, size: 28),
                          const SizedBox(width: 32),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: Theme.of(context).textTheme.bodySmall,
                                children: [
                                  TextSpan(text: localizations.kycConfirmation),
                                  TextSpan(
                                    text: localizations.kycFullText,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Terms & Conditions Checkbox
                    Container(
                      alignment: AlignmentDirectional.centerStart,
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Row(
                        children: [
                          Checkbox(
                            value: isKycConfirmed,
                            onChanged: (bool? value) {
                              setState(() {
                                isKycConfirmed = value ?? false;
                              });
                            },
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                style: Theme.of(context).textTheme.bodySmall,
                                children: [
                                  TextSpan(text: localizations.acceptTerms),
                                  TextSpan(
                                    text: localizations.termsAndConditions,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  TextSpan(text: localizations.termsFullText),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Proceed Button
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    localizations.proceedToOpenAccount,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build product cards
  Widget _buildProductCard(
    BuildContext context, {
    required double width,
    required String headerText,
    required String subHeaderText,
    required List<Map<String, dynamic>> benefits,
  }) {
    return SizedBox(
      width: width,
      height: 400,
      child: Card(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              child: Card(
                elevation: 0,
                color: const Color.fromARGB(255, 243, 130, 130),
                child: Container(
                  height: 80,
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '$headerText\n',
                            style: Theme.of(context).textTheme.headlineSmall
                                ?.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          TextSpan(
                            text: subHeaderText,
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Benefits List
            ...benefits.asMap().entries.map((entry) {
              final index = entry.key;
              final benefit = entry.value;

              return Column(
                children: [
                  Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (benefit['icon'] != null)
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(
                              benefit['icon'],
                              color: Theme.of(context).primaryColor,
                              size: 20,
                            ),
                          ),
                        if (benefit['text'] != null)
                          Flexible(
                            child: Text(
                              benefit['text'],
                              style: benefit['icon'] == null
                                  ? const TextStyle(
                                      color: IdfcColors.primary,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    )
                                  : Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(fontSize: 12),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (index < benefits.length - 1)
                    const Divider(height: 1, thickness: 1),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
