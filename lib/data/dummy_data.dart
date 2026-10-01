import '../models/shoe.dart';
import '../models/category.dart';
import '../models/banner.dart';


// ===============================
// DUMMY LOGIN USER
// ===============================

final dummyUsers = [
  {
    'email': 'user@vans.com',
    'password': '123456',
    'name': 'Vans User',
  },
];


// ===============================
// CATEGORIES
// ===============================

final List<Category> dummyCategories = [
  Category(
    id: 'all',
    name: 'All',
  ),

  Category(
    id: 'classic',
    name: 'Classic',
  ),

  Category(
    id: 'skate',
    name: 'Skate',
  ),

  Category(
    id: 'casual',
    name: 'Casual',
  ),

  Category(
    id: 'high-top',
    name: 'High Top',
  ),
];


// ===============================
// BANNERS
// ===============================

final List<BannerData> dummyBanners = [
  BannerData(
    id: 'banner_1',
    title: 'OFF THE WALL',
    subtitle: 'Find your next favorite pair.',
    image:
        'https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77',
  ),

  BannerData(
    id: 'banner_2',
    title: 'NEW SEASON',
    subtitle: 'Step into something new.',
    image:
        'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
  ),

  BannerData(
    id: 'banner_3',
    title: 'YOUR STYLE',
    subtitle: 'Make every step your own.',
    image:
        'https://images.unsplash.com/photo-1552346154-21d32810aba3',
  ),
];


// ===============================
// SHOES
// ===============================

final dummyShoes = [
  Shoe(
    id: 'shoe_001',
    brand: 'Vans',
    name: 'Old Skool',
    category: 'Classic',
    description:
        'Vans Old Skool adalah sneakers klasik dengan desain ikonik yang cocok untuk aktivitas sehari-hari. Nyaman digunakan dan mudah dipadukan dengan berbagai gaya.',
    price: 999000,
    oldPrice: 1199000,
    rating: 4.8,
    reviewCount: 124,
    image:
        'https://assets.vans.com/images/t_img/c_fill,g_center,f_auto,h_573,e_unsharp_mask:100,w_458/dpr_2.0/v1781130470/VN000EG5BMB-ALT1/Skate-SlipOn-Shoe-VANS-ALT1.png',
    detailImages: [
      'https://assets.vans.com/images/t_img/c_fill,g_center,f_auto,h_573,e_unsharp_mask:100,w_458/dpr_2.0/v1781130470/VN000EG5BMB-ALT1/Skate-SlipOn-Shoe-VANS-ALT1.png',
      'https://assets.vans.com/images/t_img/c_fill,g_center,f_auto,h_573,e_unsharp_mask:100,w_458/dpr_2.0/v1781130473/VN000EG5BMB-ALT2/Skate-SlipOn-Shoe-VANS-ALT2.png',
      'https://assets.vans.com/images/t_img/c_fill,g_center,f_auto,h_573,e_unsharp_mask:100,w_458/dpr_2.0/v1781130474/VN000EG5BMB-ALT3/Skate-SlipOn-Shoe-VANS-ALT3.png',
    ],
    isNew: true,
    isPopular: true,
  ),

  Shoe(
    id: 'shoe_002',
    brand: 'Vans',
    name: 'Harris Tweed',
    category: 'Casual',
    description:
        'Harris Tweed menghadirkan tampilan chunky yang lebih modern dengan karakter Vans yang tetap kuat. Cocok untuk gaya casual sehari-hari.',
    price: 1299000,
    oldPrice: 1499000,
    rating: 4.7,
    reviewCount: 98,
    image:
        'https://assets.vans.com/images/t_img/c_fill,g_center,f_auto,h_573,e_unsharp_mask:100,w_458/dpr_2.0/v1784233566/VN000E8VBIP-ALT1/Premium-Old-Skool-36-Harris-Tweed-Shoe-VANS-ALT1.png',
    detailImages: [
      'https://assets.vans.com/images/t_img/c_fill,g_center,f_auto,h_573,e_unsharp_mask:100,w_458/dpr_2.0/v1784233566/VN000E8VBIP-ALT1/Premium-Old-Skool-36-Harris-Tweed-Shoe-VANS-ALT1.png',
      'https://assets.vans.com/images/t_img/c_fill,g_center,f_auto,h_573,e_unsharp_mask:100,w_458/dpr_2.0/v1784233605/VN000E96BJN-ALT1/Premium-Classic-Harris-Tweed-SlipOn-Shoe-VANS-ALT1.png',
      'https://assets.vans.com/images/t_img/c_fill,g_center,f_auto,h_573,e_unsharp_mask:100,w_458/dpr_2.0/v1785884542/VN000Y8MCYL-ALT1/Premium-Harris-Tweed-Loafer-53-Shoe-VANS-Tweed-Brown-ALT1.png',
    ],
    isPopular: true,
  ),

  Shoe(
    id: 'shoe_003',
    brand: 'Vans',
    name: 'Slip-On Shoe',
    category: 'High Top',
    description:
        'Slip-On Shoe merupakan sneakers high-top ikonik dengan desain klasik dan tampilan yang khas. Dirancang untuk memberikan gaya sekaligus kenyamanan.',
    price: 1399000,
    oldPrice: 1599000,
    rating: 4.8,
    reviewCount: 86,
    image:
        'https://assets.vans.com/images/t_img/c_fill,g_center,f_auto,h_573,e_unsharp_mask:100,w_458/dpr_2.0/v1767048664/VN000EAC2VZ-ALT1/Classic-SlipOn-Shoe-VANS-ALT1.png',
    detailImages: [
      'https://assets.vans.com/images/t_img/c_fill,g_center,f_auto,h_573,e_unsharp_mask:100,w_458/dpr_2.0/v1767048664/VN000EAC2VZ-ALT1/Classic-SlipOn-Shoe-VANS-ALT1.png',
      'https://assets.vans.com/images/t_img/c_fill,g_center,f_auto,h_573,e_unsharp_mask:100,w_458/dpr_2.0/v1767048725/VN000EAC2VZ-ALT2/Classic-SlipOn-Shoe-VANS-ALT2.png',
      'https://assets.vans.com/images/t_img/c_fill,g_center,f_auto,h_573,e_unsharp_mask:100,w_458/dpr_2.0/v1767048664/VN000EAC2VZ-ALT3/Classic-SlipOn-Shoe-VANS-ALT3.png',
    ],
    isNew: true,
  ),

  Shoe(
    id: 'shoe_004',
    brand: 'Vans',
    name: 'Authentic',
    category: 'Classic',
    description:
        'Vans Authentic memiliki desain low-profile yang sederhana dan timeless. Pilihan yang cocok untuk penggunaan sehari-hari.',
    price: 899000,
    oldPrice: 1099000,
    rating: 4.6,
    reviewCount: 76,
    image:
        'https://assets.vans.com/images/t_img/c_fill,g_center,f_auto,h_573,e_unsharp_mask:100,w_458/dpr_2.0/v1753917813/VN0A38G1P0S-ALT1/Old-Skool-Checkerboard-Shoe-VANS-BlackWhite-ALT1.png',
    detailImages: [
      'https://assets.vans.com/images/t_img/c_fill,g_center,f_auto,h_573,e_unsharp_mask:100,w_458/dpr_2.0/v1753917813/VN0A38G1P0S-ALT1/Old-Skool-Checkerboard-Shoe-VANS-BlackWhite-ALT1.png',
      'https://assets.vans.com/images/t_img/c_fill,g_center,f_auto,h_573,e_unsharp_mask:100,w_458/dpr_2.0/v1753918158/VN0A38G1P0S-ALT2/Old-Skool-Checkerboard-Shoe-VANS-BlackWhite-ALT2.png',
      'https://assets.vans.com/images/t_img/c_fill,g_center,f_auto,h_573,e_unsharp_mask:100,w_458/dpr_2.0/v1753917817/VN0A38G1P0S-ALT3/Old-Skool-Checkerboard-Shoe-VANS-BlackWhite-ALT3.png',
    ],
  ),

  Shoe(
    id: 'shoe_005',
    brand: 'Vans',
    name: 'Classic Slip-On',
    category: 'Casual',
    description:
        'Classic Slip-On memberikan pengalaman memakai sneakers yang praktis tanpa tali dengan desain Vans yang ikonik.',
    price: 949000,
    oldPrice: 1099000,
    rating: 4.7,
    reviewCount: 112,
    image:
        'https://assets.vans.com/images/t_img/c_fill,g_center,f_auto,h_573,e_unsharp_mask:100,w_458/dpr_2.0/v1780679366/VN000ED2CJF-ALT1/KPop-Demon-Hunters-x-Vans-Classic-SlipOn-Shoe-VANS-ALT1.png',
    detailImages: [
      'https://assets.vans.com/images/t_img/c_fill,g_center,f_auto,h_573,e_unsharp_mask:100,w_458/dpr_2.0/v1780679366/VN000ED2CJF-ALT1/KPop-Demon-Hunters-x-Vans-Classic-SlipOn-Shoe-VANS-ALT1.png',
      'https://assets.vans.com/images/t_img/c_fill,g_center,f_auto,h_573,e_unsharp_mask:100,w_458/dpr_2.0/v1780679497/VN000ED2CJF-ALT2/KPop-Demon-Hunters-x-Vans-Classic-SlipOn-Shoe-VANS-ALT2.png',
      'https://assets.vans.com/images/t_img/c_fill,g_center,f_auto,h_573,e_unsharp_mask:100,w_458/dpr_2.0/v1780678962/VN000ED2CJF-ALT3/KPop-Demon-Hunters-x-Vans-Classic-SlipOn-Shoe-VANS-ALT3.png',
    ],
    isPopular: true,
  ),

  Shoe(
    id: 'shoe_006',
    brand: 'Vans',
    name: 'Old Skool Platform',
    category: 'Classic',
    description:
        'Old Skool Platform memberikan sentuhan modern pada siluet klasik dengan platform sole yang lebih tinggi.',
    price: 1199000,
    oldPrice: 1399000,
    rating: 4.7,
    reviewCount: 64,
    image:
        'https://assets.vans.com/images/t_img/c_fill,g_center,f_auto,h_573,e_unsharp_mask:100,w_458/dpr_2.0/v1775579179/VN000D6Y4MG-ALT1/Classic-SlipOn-Checkerboard-Shoe-VANS-ALT1.png',
    detailImages: [
      'https://assets.vans.com/images/t_img/c_fill,g_center,f_auto,h_573,e_unsharp_mask:100,w_458/dpr_2.0/v1775579179/VN000D6Y4MG-ALT1/Classic-SlipOn-Checkerboard-Shoe-VANS-ALT1.png',
      'https://assets.vans.com/images/t_img/c_fill,g_center,f_auto,h_573,e_unsharp_mask:100,w_458/dpr_2.0/v1775579179/VN000D6Y4MG-ALT2/Classic-SlipOn-Checkerboard-Shoe-VANS-ALT2.png',
      'https://assets.vans.com/images/t_img/c_fill,g_center,f_auto,h_573,e_unsharp_mask:100,w_458/dpr_2.0/v1775579178/VN000D6Y4MG-ALT3/Classic-SlipOn-Checkerboard-Shoe-VANS-ALT3.png',
    ],
    isNew: true,
  ),
];