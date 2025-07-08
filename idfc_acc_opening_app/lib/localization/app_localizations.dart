import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const List<Locale> supportedLocales = [
    Locale('en', 'US'),
    Locale('hi', 'IN'),
    Locale('mr', 'IN'), // Marathi
    Locale('gu', 'IN'), // Gujarati
  ];

  // Banner and Hero Section
  String get enjoyZeroFee =>
      _localizedValues[locale.languageCode]!['enjoy_zero_fee']!;
  String get zeroFreeBanking =>
      _localizedValues[locale.languageCode]!['zero_free_banking']!;
  String get onYourSavingsAccount =>
      _localizedValues[locale.languageCode]!['on_your_savings_account']!;
  String get impsNeftRtgs =>
      _localizedValues[locale.languageCode]!['imps_neft_rtgs']!;
  String get atmTransactions =>
      _localizedValues[locale.languageCode]!['atm_transactions']!;
  String get smsAlerts => _localizedValues[locale.languageCode]!['sms_alerts']!;
  String get moreServices =>
      _localizedValues[locale.languageCode]!['more_services']!;
  String get clickHereToView =>
      _localizedValues[locale.languageCode]!['click_here_to_view']!;
  String get zeroFeeBankingServices =>
      _localizedValues[locale.languageCode]!['zero_fee_banking_services']!;

  // Form Fields
  String get enterDetailsToStart =>
      _localizedValues[locale.languageCode]!['enter_details_to_start']!;
  String get aadhaarLinkedMobile =>
      _localizedValues[locale.languageCode]!['aadhaar_linked_mobile']!;
  String get dateOfBirth =>
      _localizedValues[locale.languageCode]!['date_of_birth']!;
  String get emailAddress =>
      _localizedValues[locale.languageCode]!['email_address']!;
  String get pan => _localizedValues[locale.languageCode]!['pan']!;
  String get aadhaarNumber =>
      _localizedValues[locale.languageCode]!['aadhaar_number']!;
  String get clickHereIfNoAadhaar =>
      _localizedValues[locale.languageCode]!['click_here_if_no_aadhaar']!;
  String get ifYouDontHaveAadhaar =>
      _localizedValues[locale.languageCode]!['if_you_dont_have_aadhaar']!;
  String get getOtp => _localizedValues[locale.languageCode]!['get_otp']!;

  // Professional Details
  String get professionalPersonalDetails =>
      _localizedValues[locale.languageCode]!['professional_personal_details']!;
  String get occupation =>
      _localizedValues[locale.languageCode]!['occupation']!;
  String get sourceOfIncome =>
      _localizedValues[locale.languageCode]!['source_of_income']!;
  String get grossAnnualIncome =>
      _localizedValues[locale.languageCode]!['gross_annual_income']!;
  String get motherFullName =>
      _localizedValues[locale.languageCode]!['mother_full_name']!;

  // Occupation Options
  String get corporateJob =>
      _localizedValues[locale.languageCode]!['corporate_job']!;
  String get farmer => _localizedValues[locale.languageCode]!['farmer']!;
  String get governmentJob =>
      _localizedValues[locale.languageCode]!['government_job']!;
  String get selfEmployed =>
      _localizedValues[locale.languageCode]!['self_employed']!;
  String get business => _localizedValues[locale.languageCode]!['business']!;
  String get propertyRent =>
      _localizedValues[locale.languageCode]!['property_rent']!;
  String get trading => _localizedValues[locale.languageCode]!['trading']!;
  String get crypto => _localizedValues[locale.languageCode]!['crypto']!;

  // Product Selection
  String get selectYour =>
      _localizedValues[locale.languageCode]!['select_your']!;
  String get product => _localizedValues[locale.languageCode]!['product']!;
  String get eachProductGives =>
      _localizedValues[locale.languageCode]!['each_product_gives']!;
  String get upTo => _localizedValues[locale.languageCode]!['up_to']!;
  String get paInterest =>
      _localizedValues[locale.languageCode]!['pa_interest']!;
  String get monthly => _localizedValues[locale.languageCode]!['monthly']!;
  String get interestCredit =>
      _localizedValues[locale.languageCode]!['interest_credit']!;
  String get zeroCharge =>
      _localizedValues[locale.languageCode]!['zero_charge']!;
  String get onAllServices =>
      _localizedValues[locale.languageCode]!['on_all_services']!;

  // Product Benefits
  String get benefits => _localizedValues[locale.languageCode]!['benefits']!;
  String get onAverageMonthlyBalance =>
      _localizedValues[locale.languageCode]!['on_average_monthly_balance']!;
  String get airportLoungeAccess =>
      _localizedValues[locale.languageCode]!['airport_lounge_access']!;
  String get freeAtmTransaction =>
      _localizedValues[locale.languageCode]!['free_atm_transaction']!;
  String get lockerRentalDiscount =>
      _localizedValues[locale.languageCode]!['locker_rental_discount']!;
  String get instantOnlineDiscounts =>
      _localizedValues[locale.languageCode]!['instant_online_discounts']!;
  String get purchaseProtection =>
      _localizedValues[locale.languageCode]!['purchase_protection']!;
  String get freeDebitCard =>
      _localizedValues[locale.languageCode]!['free_debit_card']!;
  String get freePremiumDebitCard =>
      _localizedValues[locale.languageCode]!['free_premium_debit_card']!;
  String get unlimited => _localizedValues[locale.languageCode]!['unlimited']!;
  String get clickHereToViewAllOffers =>
      _localizedValues[locale.languageCode]!['click_here_to_view_all_offers']!;
  String get allOffers => _localizedValues[locale.languageCode]!['all_offers']!;

  // Nominee Section
  String get wantToAddNominee =>
      _localizedValues[locale.languageCode]!['want_to_add_nominee']!;
  String get nomineeRecommendation =>
      _localizedValues[locale.languageCode]!['nominee_recommendation']!;
  String get yesAddNominee =>
      _localizedValues[locale.languageCode]!['yes_add_nominee']!;
  String get noDoNotWish =>
      _localizedValues[locale.languageCode]!['no_do_not_wish']!;

  // Disclaimer
  String get disclaimer =>
      _localizedValues[locale.languageCode]!['disclaimer']!;
  String get kycConfirmation =>
      _localizedValues[locale.languageCode]!['kyc_confirmation']!;
  String get kycFullText =>
      _localizedValues[locale.languageCode]!['kyc_full_text']!;
  String get acceptTerms =>
      _localizedValues[locale.languageCode]!['accept_terms']!;
  String get termsAndConditions =>
      _localizedValues[locale.languageCode]!['terms_and_conditions']!;
  String get termsFullText =>
      _localizedValues[locale.languageCode]!['terms_full_text']!;

  // Buttons
  String get proceedToOpenAccount =>
      _localizedValues[locale.languageCode]!['proceed_to_open_account']!;
  String get pleaseSelectOption =>
      _localizedValues[locale.languageCode]!['please_select_option']!;

  // Language Toggle
  String get language => _localizedValues[locale.languageCode]!['language']!;
  String get english => _localizedValues[locale.languageCode]!['english']!;
  String get hindi => _localizedValues[locale.languageCode]!['hindi']!;
  String get marathi => _localizedValues[locale.languageCode]!['marathi']!;
  String get gujarati => _localizedValues[locale.languageCode]!['gujarati']!;

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'app_title': 'IDFC Account Opening',
      'language': 'Language',
      'english': 'English',
      'hindi': 'हिंदी',
      'marathi': 'मराठी',
      'gujarati': 'ગુજરાતી',
      'others': 'Others',

      // Banner and Hero Section
      'enjoy_zero_fee': 'Enjoy ',
      'zero_free_banking': 'Zero Free Banking',
      'on_your_savings_account': '\non your Savings Account\n\n',
      'imps_neft_rtgs': 'IMPS, NEFT, RTGS\n\n',
      'atm_transactions': 'ATM Transactions, Debit Card\n\n',
      'sms_alerts': 'SMS Alerts &',
      'more_services': ' 30 more services',
      'click_here_to_view': 'Click here',
      'zero_fee_banking_services': ' to view Zero-Fee Banking Services',

      // Form Fields
      'enter_details_to_start':
          'Enter details to start your savings journey now!',
      'aadhaar_linked_mobile': 'Aadhaar linked mobile',
      'date_of_birth': 'Date of birth',
      'email_address': 'Email address',
      'pan': 'PAN',
      'aadhaar_number': '12-digit Aadhaar number',
      'click_here_if_no_aadhaar': 'Click here\n',
      'if_you_dont_have_aadhaar': 'if you don\'t have Aadhaar',
      'get_otp': 'Get OTP',

      // Professional Details
      'professional_personal_details':
          'Please enter your professional & personal details',
      'occupation': 'Occupation',
      'source_of_income': 'Source of income',
      'gross_annual_income': 'Gross Annual Income in Rupees',
      'mother_full_name': 'Mother\'s Full Name',

      // Occupation Options
      'corporate_job': 'Corporate job',
      'farmer': 'Farmer',
      'government_job': 'Government job',
      'self_employed': 'Self employed',
      'business': 'Business',
      'property_rent': 'Property rent',
      'trading': 'Trading',
      'crypto': 'Crypto',

      // Product Selection
      'select_your': 'Select Your ',
      'product': 'Product',
      'each_product_gives': 'Each product gives you',
      'up_to': 'Up to ',
      'pa_interest': 'p.a. interest',
      'monthly': 'Monthly\n',
      'interest_credit': 'interest credit',
      'zero_charge': 'Zero Charge\n',
      'on_all_services': 'on all services',

      // Product Benefits
      'benefits': 'Benefits',
      'on_average_monthly_balance': 'On Average Monthly Balance',
      'airport_lounge_access': 'Airport Lounge\nAccess',
      'free_atm_transaction': 'Free ATM\nTransaction',
      'locker_rental_discount': 'Locker Rental\nDiscount',
      'instant_online_discounts': 'Instant Online\nDiscounts',
      'purchase_protection': 'Purchase\nProtection',
      'free_debit_card': 'Free Debit\nCard',
      'free_premium_debit_card': 'Free Premium\nDebit Card',
      'unlimited': 'Unlimited',
      'click_here_to_view_all_offers': 'Click here to view ',
      'all_offers': 'All Offers',

      // Nominee Section
      'want_to_add_nominee': ' You want to add a Nominee?\n\n',
      'nominee_recommendation':
          'We strongly recommend that you add a nominee to secure deposit settlements.\n\nIn event of account holder\'s death, the amount of deposit in the account will be returned to the nominee by IDFC FIRST Bank Ltd\n\nWe advocate that you consider the advantages of nomination and the consequences of not nominating anyone to your account.',
      'yes_add_nominee': 'Yes, Add nominee',
      'no_do_not_wish': 'No, I do not wish to',

      // Disclaimer
      'disclaimer': 'Disclaimer',
      'kyc_confirmation': 'I confirm that ',
      'kyc_full_text':
          'I will complete full KYC within 30 days. In case of failure in doing so, bank reserves a right to initiate closure of my savings account.',
      'accept_terms': 'I accept all ',
      'terms_and_conditions': 'terms & conditions',
      'terms_full_text':
          ' related to IDFC First Bank and confirm that I am a citizen of India only, born in India and a tax resident of India only',

      // Buttons
      'proceed_to_open_account': 'Proceed to open account',
      'please_select_option': 'Please select an option',
    },
    'hi': {
      'app_title': 'IDFC खाता खोलना',
      'language': 'भाषा',
      'english': 'English',
      'hindi': 'हिंदी',
      'marathi': 'मराठी',
      'gujarati': 'ગુજરાતી',
      'others': 'अन्य',

      // Banner and Hero Section
      'enjoy_zero_fee': 'आनंद लें ',
      'zero_free_banking': 'शून्य शुल्क बैंकिंग',
      'on_your_savings_account': '\nअपने बचत खाते पर\n\n',
      'imps_neft_rtgs': 'IMPS, NEFT, RTGS\n\n',
      'atm_transactions': 'ATM लेनदेन, डेबिट कार्ड\n\n',
      'sms_alerts': 'SMS अलर्ट और',
      'more_services': ' 30 अधिक सेवाएं',
      'click_here_to_view': 'यहां क्लिक करें',
      'zero_fee_banking_services': ' शून्य शुल्क बैंकिंग सेवाएं देखने के लिए',

      // Form Fields
      'enter_details_to_start':
          'अपनी बचत यात्रा शुरू करने के लिए विवरण दर्ज करें!',
      'aadhaar_linked_mobile': 'आधार लिंक्ड मोबाइल',
      'date_of_birth': 'जन्म तिथि',
      'email_address': 'ईमेल पता',
      'pan': 'PAN',
      'aadhaar_number': '12-अंकीय आधार संख्या',
      'click_here_if_no_aadhaar': 'यहां क्लिक करें\n',
      'if_you_dont_have_aadhaar': 'यदि आपके पास आधार नहीं है',
      'get_otp': 'OTP प्राप्त करें',

      // Professional Details
      'professional_personal_details':
          'कृपया अपने व्यावसायिक और व्यक्तिगत विवरण दर्ज करें',
      'occupation': 'व्यवसाय',
      'source_of_income': 'आय का स्रोत',
      'gross_annual_income': 'रुपयों में कुल वार्षिक आय',
      'mother_full_name': 'माता का पूरा नाम',

      // Occupation Options
      'corporate_job': 'कॉर्पोरेट नौकरी',
      'farmer': 'किसान',
      'government_job': 'सरकारी नौकरी',
      'self_employed': 'स्वरोजगार',
      'business': 'व्यापार',
      'property_rent': 'संपत्ति का किराया',
      'trading': 'व्यापार',
      'crypto': 'क्रिप्टो',

      // Product Selection
      'select_your': 'अपना चुनें ',
      'product': 'उत्पाद',
      'each_product_gives': 'प्रत्येक उत्पाद आपको देता है',
      'up_to': 'तक ',
      'pa_interest': 'प्रति वर्ष ब्याज',
      'monthly': 'मासिक\n',
      'interest_credit': 'ब्याज क्रेडिट',
      'zero_charge': 'शून्य शुल्क\n',
      'on_all_services': 'सभी सेवाओं पर',

      // Product Benefits
      'benefits': 'लाभ',
      'on_average_monthly_balance': 'औसत मासिक बैलेंस पर',
      'airport_lounge_access': 'एयरपोर्ट लाउंज\nपहुंच',
      'free_atm_transaction': 'मुफ्त ATM\nलेनदेन',
      'locker_rental_discount': 'लॉकर किराया\nछूट',
      'instant_online_discounts': 'तत्काल ऑनलाइन\nछूट',
      'purchase_protection': 'खरीद\nसुरक्षा',
      'free_debit_card': 'मुफ्त डेबिट\nकार्ड',
      'free_premium_debit_card': 'मुफ्त प्रीमियम\nडेबिट कार्ड',
      'unlimited': 'असीमित',
      'click_here_to_view_all_offers': 'देखने के लिए यहां क्लिक करें ',
      'all_offers': 'सभी ऑफर',

      // Nominee Section
      'want_to_add_nominee': ' आप एक नामांकित व्यक्ति जोड़ना चाहते हैं?\n\n',
      'nominee_recommendation':
          'हम दृढ़ता से सुझाव देते हैं कि आप जमा निपटान को सुरक्षित करने के लिए एक नामांकित व्यक्ति जोड़ें।\n\nखाता धारक की मृत्यु की स्थिति में, खाते में जमा राशि IDFC FIRST Bank Ltd द्वारा नामांकित व्यक्ति को वापस कर दी जाएगी।\n\nहम सुझाव देते हैं कि आप नामांकन के फायदों और अपने खाते में किसी को नामांकित न करने के परिणामों पर विचार करें।',
      'yes_add_nominee': 'हां, नामांकित व्यक्ति जोड़ें',
      'no_do_not_wish': 'नहीं, मैं नहीं चाहता',

      // Disclaimer
      'disclaimer': 'अस्वीकरण',
      'kyc_confirmation': 'मैं पुष्टि करता हूं कि ',
      'kyc_full_text':
          'मैं 30 दिनों के भीतर पूर्ण KYC पूरा करूंगा। ऐसा न करने की स्थिति में, बैंक मेरे बचत खाते को बंद करने का अधिकार सुरक्षित रखता है।',
      'accept_terms': 'मैं सभी स्वीकार करता हूं ',
      'terms_and_conditions': 'नियम और शर्तें',
      'terms_full_text':
          ' IDFC First Bank से संबंधित और पुष्टि करता हूं कि मैं केवल भारत का नागरिक हूं, भारत में जन्मा हूं और केवल भारत का कर निवासी हूं',

      // Buttons
      'proceed_to_open_account': 'खाता खोलने के लिए आगे बढ़ें',
      'please_select_option': 'कृपया कोई विकल्प चुनें',
    },
    'mr': {
      'app_title': 'IDFC खाते उघडणे',
      'language': 'भाषा',
      'english': 'English',
      'hindi': 'हिंदी',
      'marathi': 'मराठी',
      'gujarati': 'ગુજરાતી',
      'others': 'इतर',

      // Banner and Hero Section
      'enjoy_zero_fee': 'आनंद घ्या ',
      'zero_free_banking': 'शून्य शुल्क बँकिंग',
      'on_your_savings_account': '\nतुमच्या बचत खात्यावर\n\n',
      'imps_neft_rtgs': 'IMPS, NEFT, RTGS\n\n',
      'atm_transactions': 'ATM व्यवहार, डेबिट कार्ड\n\n',
      'sms_alerts': 'SMS अलर्ट आणि',
      'more_services': ' ३० अधिक सेवा',
      'click_here_to_view': 'येथे क्लिक करा',
      'zero_fee_banking_services': ' शून्य शुल्क बँकिंग सेवा पाहण्यासाठी',

      // Form Fields
      'enter_details_to_start':
          'तुमचा बचत प्रवास सुरू करण्यासाठी तपशील प्रविष्ट करा!',
      'aadhaar_linked_mobile': 'आधार जोडलेला मोबाइल',
      'date_of_birth': 'जन्म तारीख',
      'email_address': 'ईमेल पत्ता',
      'pan': 'PAN',
      'aadhaar_number': '१२-अंकी आधार क्रमांक',
      'click_here_if_no_aadhaar': 'येथे क्लिक करा\n',
      'if_you_dont_have_aadhaar': 'जर तुमच्याकडे आधार नसेल',
      'get_otp': 'OTP मिळवा',

      // Professional Details
      'professional_personal_details':
          'कृपया तुमचे व्यावसायिक आणि वैयक्तिक तपशील प्रविष्ट करा',
      'occupation': 'व्यवसाय',
      'source_of_income': 'उत्पन्नाचा स्रोत',
      'gross_annual_income': 'रुपयांमध्ये एकूण वार्षिक उत्पन्न',
      'mother_full_name': 'आईचे पूर्ण नाव',

      // Occupation Options
      'corporate_job': 'कॉर्पोरेट नोकरी',
      'farmer': 'शेतकरी',
      'government_job': 'सरकारी नोकरी',
      'self_employed': 'स्वयंरोजगार',
      'business': 'व्यवसाय',
      'property_rent': 'मालमत्तेचे भाडे',
      'trading': 'व्यापार',
      'crypto': 'क्रिप्टो',

      // Product Selection
      'select_your': 'तुमचे निवडा ',
      'product': 'उत्पादन',
      'each_product_gives': 'प्रत्येक उत्पादन तुम्हाला देते',
      'up_to': 'पर्यंत ',
      'pa_interest': 'प्रति वर्ष व्याज',
      'monthly': 'मासिक\n',
      'interest_credit': 'व्याज क्रेडिट',
      'zero_charge': 'शून्य शुल्क\n',
      'on_all_services': 'सर्व सेवांवर',

      // Product Benefits
      'benefits': 'फायदे',
      'on_average_monthly_balance': 'सरासरी मासिक शिल्लकीवर',
      'airport_lounge_access': 'विमानतळ लाउंज\nप्रवेश',
      'free_atm_transaction': 'मोफत ATM\nव्यवहार',
      'locker_rental_discount': 'लॉकर भाडे\nसूट',
      'instant_online_discounts': 'तत्काळ ऑनलाइन\nसूट',
      'purchase_protection': 'खरेदी\nसंरक्षण',
      'free_debit_card': 'मोफत डेबिट\nकार्ड',
      'free_premium_debit_card': 'मोफत प्रीमियम\nडेबिट कार्ड',
      'unlimited': 'अमर्यादित',
      'click_here_to_view_all_offers': 'पाहण्यासाठी येथे क्लिक करा ',
      'all_offers': 'सर्व ऑफर',

      // Nominee Section
      'want_to_add_nominee': ' तुम्ही नामनिर्देशित व्यक्ती जोडू इच्छिता?\n\n',
      'nominee_recommendation':
          'ठेव सेटलमेंट सुरक्षित करण्यासाठी नामनिर्देशित व्यक्ती जोडण्याची आम्ही दृढपणे शिफारस करतो.\n\nखातेधारकाच्या मृत्यूच्या वेळी, खात्यातील ठेवीची रक्कम IDFC FIRST Bank Ltd द्वारे नामनिर्देशित व्यक्तीला परत केली जाईल\n\nआम्ही तुम्हाला नामांकनाचे फायदे आणि तुमच्या खात्यासाठी कोणालाही नामनिर्देशित न करण्याचे परिणाम विचारात घेण्याची शिफारस करतो.',
      'yes_add_nominee': 'होय, नामनिर्देशित व्यक्ती जोडा',
      'no_do_not_wish': 'नाही, मला नको आहे',

      // Disclaimer
      'disclaimer': 'अस्वीकरण',
      'kyc_confirmation': 'मी पुष्टी करतो की ',
      'kyc_full_text':
          'मी ३० दिवसांत पूर्ण KYC पूर्ण करेन. असे न केल्यास, बँकेकडे माझे बचत खाते बंद करण्याचा अधिकार राहील.',
      'accept_terms': 'मी सर्व स्वीकारतो ',
      'terms_and_conditions': 'नियम आणि अटी',
      'terms_full_text':
          ' IDFC First Bank संबंधित आणि पुष्टी करतो की मी फक्त भारताचा नागरिक आहे, भारतात जन्मलेला आहे आणि फक्त भारताचा कर निवासी आहे',

      // Buttons
      'proceed_to_open_account': 'खाते उघडण्यासाठी पुढे जा',
      'please_select_option': 'कृपया एक पर्याय निवडा',
    },
    'gu': {
      'app_title': 'IDFC ખાતું ખોલવું',
      'language': 'ભાષા',
      'english': 'English',
      'hindi': 'हिंदी',
      'marathi': 'मराठी',
      'gujarati': 'ગુજરાતી',
      'others': 'અન્ય',

      // Banner and Hero Section
      'enjoy_zero_fee': 'આનંદ લો ',
      'zero_free_banking': 'શૂન્ય ફી બેંકિંગ',
      'on_your_savings_account': '\nતમારા બચત ખાતા પર\n\n',
      'imps_neft_rtgs': 'IMPS, NEFT, RTGS\n\n',
      'atm_transactions': 'ATM વ્યવહારો, ડેબિટ કાર્ડ\n\n',
      'sms_alerts': 'SMS અલર્ટ અને',
      'more_services': ' ૩૦ વધુ સેવાઓ',
      'click_here_to_view': 'અહીં ક્લિક કરો',
      'zero_fee_banking_services': ' શૂન્ય ફી બેંકિંગ સેવાઓ જોવા માટે',

      // Form Fields
      'enter_details_to_start':
          'તમારી બચત યાત્રા શરૂ કરવા માટે વિગતો દાખલ કરો!',
      'aadhaar_linked_mobile': 'આધાર લિંક થયેલ મોબાઇલ',
      'date_of_birth': 'જન્મ તારીખ',
      'email_address': 'ઇમેઇલ સરનામું',
      'pan': 'PAN',
      'aadhaar_number': '૧ૢ-આંકડાનો આધાર નંબર',
      'click_here_if_no_aadhaar': 'અહીં ક્લિક કરો\n',
      'if_you_dont_have_aadhaar': 'જો તમારી પાસે આધાર નથી',
      'get_otp': 'OTP મેળવો',

      // Professional Details
      'professional_personal_details':
          'કૃપા કરીને તમારી વ્યાવસાયિક અને વ્યક્તિગત વિગતો દાખલ કરો',
      'occupation': 'વ્યવસાય',
      'source_of_income': 'આવકનો સ્રોત',
      'gross_annual_income': 'રૂપિયામાં કુલ વાર્ષિક આવક',
      'mother_full_name': 'માતાનું પૂર્ણ નામ',

      // Occupation Options
      'corporate_job': 'કોર્પોરેટ નોકરી',
      'farmer': 'ખેડૂત',
      'government_job': 'સરકારી નોકરી',
      'self_employed': 'સ્વરોજગાર',
      'business': 'વ્યવસાય',
      'property_rent': 'મિલકતનું ભાડું',
      'trading': 'વેપાર',
      'crypto': 'ક્રિપ્ટો',

      // Product Selection
      'select_your': 'તમારું પસંદ કરો ',
      'product': 'ઉત્પાદન',
      'each_product_gives': 'દરેક ઉત્પાદન તમને આપે છે',
      'up_to': 'સુધી ',
      'pa_interest': 'વાર્ષિક વ્યાજ',
      'monthly': 'માસિક\n',
      'interest_credit': 'વ્યાજ ક્રેડિટ',
      'zero_charge': 'શૂન્ય ચાર્જ\n',
      'on_all_services': 'બધી સેવાઓ પર',

      // Product Benefits
      'benefits': 'ફાયદાઓ',
      'on_average_monthly_balance': 'સરેરાશ માસિક બેલેન્સ પર',
      'airport_lounge_access': 'એરપોર્ટ લાઉન્જ\nપ્રવેશ',
      'free_atm_transaction': 'મફત ATM\nવ્યવહાર',
      'locker_rental_discount': 'લોકર ભાડું\nછૂટ',
      'instant_online_discounts': 'તાત્કાલિક ઓનલાઇન\nછૂટ',
      'purchase_protection': 'ખરીદી\nસુરક્ષા',
      'free_debit_card': 'મફત ડેબિટ\nકાર્ડ',
      'free_premium_debit_card': 'મફત પ્રીમિયમ\nડેબિટ કાર્ડ',
      'unlimited': 'અમર્યાદિત',
      'click_here_to_view_all_offers': 'જોવા માટે અહીં ક્લિક કરો ',
      'all_offers': 'બધી ઓફર',

      // Nominee Section
      'want_to_add_nominee': ' તમે નામાંકિત વ્યક્તિ ઉમેરવા માંગો છો?\n\n',
      'nominee_recommendation':
          'અમે દૃઢતાથી સુઝાવ આપીએ છીએ કે તમે થાપણ સેટલમેન્ટ સુરક્ષિત કરવા માટે નામાંકિત વ્યક્તિ ઉમેરો.\n\nખાતેધારકના મૃત્યુની સ્થિતિમાં, ખાતામાં થાપણની રકમ IDFC FIRST Bank Ltd દ્વારા નામાંકિત વ્યક્તિને પરત કરવામાં આવશે\n\nઅમે સુઝાવ આપીએ છીએ કે તમે નામાંકનના ફાયદાઓ અને તમારા ખાતા માટે કોઈને નામાંકિત ન કરવાના પરિણામો વિશે વિચાર કરો.',
      'yes_add_nominee': 'હા, નામાંકિત વ્યક્તિ ઉમેરો',
      'no_do_not_wish': 'ના, હું નથી ઇચ્છતો',

      // Disclaimer
      'disclaimer': 'અસ્વીકરણ',
      'kyc_confirmation': 'હું પુષ્ટિ કરું છું કે ',
      'kyc_full_text':
          'હું ૩૦ દિવસમાં સંપૂર્ણ KYC પૂર્ણ કરીશ. આવું ન કરવાની સ્થિતિમાં, બેંક મારા બચત ખાતાને બંદ કરવાનો અધિકાર અનામત રાખે છે.',
      'accept_terms': 'હું બધું સ્વીકારું છું ',
      'terms_and_conditions': 'નિયમો અને શરતો',
      'terms_full_text':
          ' IDFC First Bank સંબંધિત અને પુષ્ટિ કરું છું કે હું ફક્ત ભારતનો નાગરિક છું, ભારતમાં જન્મેલો છું અને ફક્ત ભારતનો કર નિવાસી છું',

      // Buttons
      'proceed_to_open_account': 'ખાતું ખોલવા માટે આગળ વધો',
      'please_select_option': 'કૃપા કરીને એક વિકલ્પ પસંદ કરો',
    },
  };
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppLocalizations.supportedLocales.any(
      (supportedLocale) => supportedLocale.languageCode == locale.languageCode,
    );
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
