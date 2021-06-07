Feature: Serology

  py-ard is able to map serology to the corresponding alleles and reduce to the desired
  level.

  Scenario Outline:

    Given the serology typing is <Serology>
    When reducing on the <Level> level (ambiguous)
    Then the reduced allele is found to be <Redux Allele>


    Examples: Valid A serology typings
      | Serology | Level | Redux Allele                                                |
      | A10      | G     | A*25:01:01G/A*25:01:02/A*25:01:03/A*25:01:04/A*25:01:05/A*25:01:06/A*25:01:07/A*25:01:08/A*25:01:09/A*25:01:10/A*25:01:11/A*25:02/A*25:03/A*25:04/A*25:05/A*25:06/A*25:08/A*25:09/A*25:10/A*25:11/A*25:13/A*25:14/A*25:15/A*25:16/A*25:17/A*25:18/A*25:19:01/A*25:19:02/A*25:20/A*25:21/A*25:22/A*25:23/A*25:24/A*25:25/A*25:26/A*25:27:01/A*25:27:02/A*25:28/A*25:29/A*25:30/A*25:31/A*25:32/A*25:33/A*25:34/A*25:35/A*25:36/A*25:37/A*25:38/A*25:39/A*25:40/A*25:41/A*25:43/A*25:44/A*25:45/A*26:01:01G/A*26:01:02/A*26:01:03/A*26:01:04/A*26:01:05/A*26:01:06/A*26:01:08/A*26:01:09/A*26:01:10/A*26:01:11/A*26:01:12/A*26:01:13/A*26:01:14/A*26:01:15/A*26:01:16/A*26:01:17/A*26:01:18/A*26:01:19/A*26:01:20/A*26:01:21/A*26:01:22/A*26:01:23/A*26:01:24/A*26:01:26/A*26:01:27/A*26:01:28/A*26:01:29/A*26:01:30/A*26:01:31/A*26:01:33/A*26:01:34/A*26:01:36/A*26:01:37/A*26:01:38/A*26:01:39/A*26:01:41/A*26:01:42/A*26:02:01/A*26:02:02/A*26:03:01/A*26:04/A*26:05/A*26:06/A*26:07:01/A*26:07:02/A*26:08/A*26:09/A*26:10/A*26:12/A*26:13/A*26:14/A*26:15/A*26:16/A*26:17/A*26:18/A*26:19/A*26:20/A*26:21/A*26:22/A*26:23/A*26:27/A*26:28/A*26:29/A*26:30/A*26:31/A*26:32/A*26:33/A*26:34/A*26:35/A*26:36/A*26:37/A*26:38/A*26:39/A*26:40/A*26:41/A*26:42/A*26:43:01/A*26:43:02/A*26:45/A*26:46/A*26:47/A*26:48/A*26:49/A*26:50/A*26:51/A*26:52/A*26:53/A*26:54/A*26:55/A*26:57/A*26:58/A*26:59/A*26:61/A*26:62/A*26:63/A*26:64/A*26:65/A*26:66/A*26:67/A*26:68/A*26:69/A*26:70/A*26:72/A*26:73/A*26:74/A*26:75/A*26:76/A*26:77/A*26:78/A*26:79/A*26:80/A*26:81/A*26:83/A*26:84/A*26:85/A*26:86/A*26:87/A*26:88/A*26:89/A*26:90/A*26:91/A*26:92/A*26:93/A*26:94/A*26:95/A*26:96/A*26:97/A*26:100/A*26:101/A*26:102/A*26:103/A*26:104/A*26:105/A*26:106/A*26:108/A*26:109/A*26:110/A*26:111/A*26:112/A*26:113/A*26:114/A*26:115/A*26:116/A*26:118/A*26:119/A*26:120/A*26:121/A*26:122/A*26:123/A*26:124/A*26:125/A*26:126/A*26:128/A*26:129/A*26:130/A*26:131/A*26:132/A*26:133/A*26:134/A*26:135/A*26:136/A*26:137/A*26:138/A*26:139/A*26:140/A*26:141/A*26:142/A*26:143/A*26:144/A*34:01:01/A*34:01:02/A*34:02:01/A*34:02:02/A*34:02:03/A*34:02:04/A*34:03/A*34:04/A*34:05/A*34:06/A*34:07/A*34:08/A*34:09/A*34:11/A*34:12/A*34:13/A*34:14/A*34:15/A*34:16/A*34:17/A*66:01:01G/A*66:01:02/A*66:01:03/A*66:02/A*66:03:01G/A*66:04/A*66:05/A*66:06/A*66:07/A*66:09/A*66:10/A*66:11/A*66:12/A*66:13/A*66:14/A*66:15/A*66:16/A*66:18/A*66:19/A*66:20/A*66:21/A*66:22/A*66:23/A*66:24/A*66:25/A*66:26Q
      | A10      | lg    | A*25:01g/A*25:02g/A*25:03g/A*25:04g/A*25:05g/A*25:06g/A*25:08g/A*25:09g/A*25:10g/A*25:11g/A*25:13g/A*25:14g/A*25:15g/A*25:16g/A*25:17g/A*25:18g/A*25:19g/A*25:20g/A*25:21g/A*25:22g/A*25:23g/A*25:24g/A*25:25g/A*25:26g/A*25:27g/A*25:28g/A*25:29g/A*25:30g/A*25:31g/A*25:32g/A*25:33g/A*25:34g/A*25:35g/A*25:36g/A*25:37g/A*25:38g/A*25:39g/A*25:40g/A*25:41g/A*25:43g/A*25:44g/A*25:45g/A*26:01g/A*26:02g/A*26:03g/A*26:04g/A*26:05g/A*26:06g/A*26:07g/A*26:08g/A*26:09g/A*26:10g/A*26:12g/A*26:13g/A*26:14g/A*26:15g/A*26:16g/A*26:17g/A*26:18g/A*26:19g/A*26:20g/A*26:21g/A*26:22g/A*26:23g/A*26:27g/A*26:28g/A*26:29g/A*26:30g/A*26:31g/A*26:32g/A*26:33g/A*26:34g/A*26:35g/A*26:36g/A*26:37g/A*26:38g/A*26:39g/A*26:40g/A*26:41g/A*26:42g/A*26:43g/A*26:45g/A*26:46g/A*26:47g/A*26:48g/A*26:49g/A*26:50g/A*26:51g/A*26:52g/A*26:53g/A*26:54g/A*26:55g/A*26:57g/A*26:58g/A*26:59g/A*26:61g/A*26:62g/A*26:63g/A*26:64g/A*26:65g/A*26:66g/A*26:67g/A*26:68g/A*26:69g/A*26:70g/A*26:72g/A*26:73g/A*26:74g/A*26:75g/A*26:76g/A*26:77g/A*26:78g/A*26:79g/A*26:80g/A*26:81g/A*26:83g/A*26:84g/A*26:85g/A*26:86g/A*26:87g/A*26:88g/A*26:89g/A*26:90g/A*26:91g/A*26:92g/A*26:93g/A*26:94g/A*26:95g/A*26:96g/A*26:97g/A*26:100g/A*26:101g/A*26:102g/A*26:103g/A*26:104g/A*26:105g/A*26:106g/A*26:108g/A*26:109g/A*26:110g/A*26:111g/A*26:112g/A*26:113g/A*26:114g/A*26:115g/A*26:116g/A*26:118g/A*26:119g/A*26:120g/A*26:121g/A*26:122g/A*26:123g/A*26:124g/A*26:125g/A*26:126g/A*26:128g/A*26:129g/A*26:130g/A*26:131g/A*26:132g/A*26:133g/A*26:134g/A*26:135g/A*26:136g/A*26:137g/A*26:138g/A*26:139g/A*26:140g/A*26:141g/A*26:142g/A*26:143g/A*26:144g/A*34:01g/A*34:02g/A*34:03g/A*34:04g/A*34:05g/A*34:06g/A*34:07g/A*34:08g/A*34:09g/A*34:11g/A*34:12g/A*34:13g/A*34:14g/A*34:15g/A*34:16g/A*34:17g/A*66:01g/A*66:02g/A*66:03g/A*66:04g/A*66:05g/A*66:06g/A*66:07g/A*66:09g/A*66:10g/A*66:11g/A*66:12g/A*66:13g/A*66:14g/A*66:15g/A*66:16g/A*66:18g/A*66:19g/A*66:20g/A*66:21g/A*66:22g/A*66:23g/A*66:24g/A*66:25g/A*66:26Qg
      | A10      | lgx   | A*25:01/A*25:02/A*25:03/A*25:04/A*25:05/A*25:06/A*25:08/A*25:09/A*25:10/A*25:11/A*25:13/A*25:14/A*25:15/A*25:16/A*25:17/A*25:18/A*25:19/A*25:20/A*25:21/A*25:22/A*25:23/A*25:24/A*25:25/A*25:26/A*25:27/A*25:28/A*25:29/A*25:30/A*25:31/A*25:32/A*25:33/A*25:34/A*25:35/A*25:36/A*25:37/A*25:38/A*25:39/A*25:40/A*25:41/A*25:43/A*25:44/A*25:45/A*26:01/A*26:02/A*26:03/A*26:04/A*26:05/A*26:06/A*26:07/A*26:08/A*26:09/A*26:10/A*26:12/A*26:13/A*26:14/A*26:15/A*26:16/A*26:17/A*26:18/A*26:19/A*26:20/A*26:21/A*26:22/A*26:23/A*26:27/A*26:28/A*26:29/A*26:30/A*26:31/A*26:32/A*26:33/A*26:34/A*26:35/A*26:36/A*26:37/A*26:38/A*26:39/A*26:40/A*26:41/A*26:42/A*26:43/A*26:45/A*26:46/A*26:47/A*26:48/A*26:49/A*26:50/A*26:51/A*26:52/A*26:53/A*26:54/A*26:55/A*26:57/A*26:58/A*26:59/A*26:61/A*26:62/A*26:63/A*26:64/A*26:65/A*26:66/A*26:67/A*26:68/A*26:69/A*26:70/A*26:72/A*26:73/A*26:74/A*26:75/A*26:76/A*26:77/A*26:78/A*26:79/A*26:80/A*26:81/A*26:83/A*26:84/A*26:85/A*26:86/A*26:87/A*26:88/A*26:89/A*26:90/A*26:91/A*26:92/A*26:93/A*26:94/A*26:95/A*26:96/A*26:97/A*26:100/A*26:101/A*26:102/A*26:103/A*26:104/A*26:105/A*26:106/A*26:108/A*26:109/A*26:110/A*26:111/A*26:112/A*26:113/A*26:114/A*26:115/A*26:116/A*26:118/A*26:119/A*26:120/A*26:121/A*26:122/A*26:123/A*26:124/A*26:125/A*26:126/A*26:128/A*26:129/A*26:130/A*26:131/A*26:132/A*26:133/A*26:134/A*26:135/A*26:136/A*26:137/A*26:138/A*26:139/A*26:140/A*26:141/A*26:142/A*26:143/A*26:144/A*34:01/A*34:02/A*34:03/A*34:04/A*34:05/A*34:06/A*34:07/A*34:08/A*34:09/A*34:11/A*34:12/A*34:13/A*34:14/A*34:15/A*34:16/A*34:17/A*66:01/A*66:02/A*66:03/A*66:04/A*66:05/A*66:06/A*66:07/A*66:09/A*66:10/A*66:11/A*66:12/A*66:13/A*66:14/A*66:15/A*66:16/A*66:18/A*66:19/A*66:20/A*66:21/A*66:22/A*66:23/A*66:24/A*66:25/A*66:26Q
      | A19      | G     | A*02:65/A*29:01:01G/A*29:01:02/A*29:01:03/A*29:01:04/A*29:01:06/A*29:01:07/A*29:01:08/A*29:01:09/A*29:02:01G/A*29:02:02/A*29:02:03/A*29:02:04/A*29:02:05/A*29:02:06/A*29:02:08/A*29:02:09/A*29:02:10/A*29:02:11/A*29:02:12/A*29:02:13/A*29:02:14/A*29:02:15/A*29:02:16/A*29:02:17G/A*29:02:18/A*29:02:19/A*29:02:21/A*29:03/A*29:04/A*29:05/A*29:06/A*29:07/A*29:09/A*29:10:01/A*29:10:02/A*29:11/A*29:12/A*29:13/A*29:14/A*29:15/A*29:16/A*29:17/A*29:18/A*29:19/A*29:20/A*29:21/A*29:22/A*29:23/A*29:24/A*29:25/A*29:27/A*29:28/A*29:29/A*29:30/A*29:31/A*29:32/A*29:33/A*29:34/A*29:35/A*29:36/A*29:37/A*29:38/A*29:39/A*29:40/A*29:41/A*29:42/A*29:43/A*29:44/A*29:45/A*29:47/A*29:48/A*29:49/A*29:50/A*29:51/A*29:52/A*29:53/A*29:54/A*29:55/A*29:56/A*29:57/A*29:58/A*29:59/A*29:60/A*29:61/A*29:62/A*29:63/A*29:64/A*29:65/A*29:66/A*29:67/A*29:68/A*29:69/A*29:70/A*29:71/A*29:72/A*29:73/A*29:74/A*29:76/A*29:77/A*29:79/A*29:80/A*29:81/A*29:82/A*29:83/A*29:84/A*29:85/A*29:86/A*29:87/A*29:88/A*29:89/A*29:90/A*29:91/A*29:92/A*29:93/A*29:94/A*29:96/A*29:97/A*29:98/A*29:99/A*29:101/A*29:102/A*29:103/A*30:01:01G/A*30:01:03/A*30:01:04/A*30:01:05/A*30:01:06/A*30:01:07/A*30:01:08/A*30:01:09/A*30:01:10/A*30:01:11/A*30:02:01G/A*30:02:03/A*30:02:04/A*30:02:05/A*30:02:06/A*30:02:07/A*30:02:08/A*30:02:09/A*30:02:10/A*30:02:11/A*30:02:13/A*30:02:14/A*30:02:15/A*30:02:16/A*30:02:17/A*30:02:18/A*30:02:19/A*30:03/A*30:04:01G/A*30:04:02/A*30:06/A*30:07/A*30:08/A*30:09/A*30:10/A*30:11:01/A*30:11:02/A*30:12/A*30:13/A*30:14L/A*30:15/A*30:16/A*30:17/A*30:18/A*30:19/A*30:20/A*30:22/A*30:23/A*30:25/A*30:26/A*30:28/A*30:29/A*30:30/A*30:31/A*30:32/A*30:34/A*30:35/A*30:36/A*30:37/A*30:38/A*30:39/A*30:40/A*30:41/A*30:42/A*30:43/A*30:44/A*30:45/A*30:46/A*30:47/A*30:48/A*30:49/A*30:50/A*30:51/A*30:52/A*30:53/A*30:54/A*30:55/A*30:56/A*30:57/A*30:58/A*30:60/A*30:61/A*30:62/A*30:63/A*30:64/A*30:65/A*30:66/A*30:67/A*30:68/A*30:69/A*30:71/A*30:72/A*30:74/A*30:75/A*30:79/A*30:80/A*30:82/A*30:83/A*30:84/A*30:85/A*30:86/A*30:87/A*30:88/A*30:89/A*30:90/A*30:91/A*30:92/A*30:93/A*30:94/A*30:96/A*30:97/A*30:98/A*30:99/A*30:100/A*30:101Q/A*30:102/A*30:103/A*30:104/A*30:106/A*30:107/A*30:108/A*30:109/A*30:110/A*30:111/A*30:113/A*30:116/A*30:117/A*30:118/A*30:119/A*31:01:02G/A*31:01:03/A*31:01:04/A*31:01:05/A*31:01:06/A*31:01:07/A*31:01:08/A*31:01:09/A*31:01:10/A*31:01:11/A*31:01:12/A*31:01:14/A*31:01:15/A*31:01:16/A*31:01:17/A*31:01:18/A*31:01:19/A*31:01:20/A*31:01:21/A*31:01:22/A*31:01:23/A*31:01:24/A*31:01:25/A*31:02/A*31:03/A*31:04/A*31:05/A*31:06/A*31:07/A*31:08/A*31:09/A*31:10/A*31:11/A*31:12/A*31:13/A*31:15/A*31:16/A*31:17/A*31:18/A*31:19/A*31:20/A*31:21/A*31:22/A*31:24/A*31:25/A*31:26/A*31:27/A*31:28/A*31:29/A*31:30/A*31:31/A*31:32/A*31:33/A*31:34/A*31:35/A*31:36/A*31:37/A*31:38/A*31:39/A*31:40/A*31:41/A*31:42/A*31:43/A*31:44/A*31:45/A*31:47/A*31:49/A*31:50/A*31:51/A*31:52/A*31:53/A*31:54/A*31:57/A*31:58/A*31:61/A*31:62/A*31:63/A*31:64/A*31:65/A*31:66/A*31:67/A*31:68/A*31:69/A*31:70/A*31:73/A*31:74/A*31:75/A*31:76/A*31:77/A*31:78/A*31:79/A*31:80/A*31:82/A*31:83/A*31:84/A*31:85/A*31:86/A*31:87/A*31:88/A*31:89/A*31:90/A*31:91/A*31:92/A*31:93/A*31:94/A*31:96/A*31:97/A*31:98/A*31:99/A*31:100/A*31:101/A*31:102/A*31:103/A*31:104/A*31:105/A*31:106/A*31:107/A*31:108/A*31:109/A*31:110/A*31:112/A*31:113/A*31:114/A*31:115/A*31:116/A*31:117/A*31:118/A*31:120/A*31:121/A*31:122/A*31:123/A*31:124/A*31:127/A*32:01:01G/A*32:01:03/A*32:01:04/A*32:01:05/A*32:01:06/A*32:01:07/A*32:01:08/A*32:01:09/A*32:01:10/A*32:01:11/A*32:01:12/A*32:01:13/A*32:01:14/A*32:01:15/A*32:01:16/A*32:01:17/A*32:01:18/A*32:01:19/A*32:01:20/A*32:01:21/A*32:01:22/A*32:01:24/A*32:01:25/A*32:01:26/A*32:02/A*32:03/A*32:04/A*32:05/A*32:06/A*32:07/A*32:08/A*32:09/A*32:10/A*32:11Q/A*32:12/A*32:13/A*32:14/A*32:15/A*32:16/A*32:17/A*32:18/A*32:20/A*32:21/A*32:22/A*32:23/A*32:24/A*32:25/A*32:26:01/A*32:26:02/A*32:28/A*32:29/A*32:30:01/A*32:30:02/A*32:31/A*32:32/A*32:33:01/A*32:33:02/A*32:34/A*32:35/A*32:36/A*32:37/A*32:38/A*32:39/A*32:40/A*32:41/A*32:42/A*32:43/A*32:44/A*32:46/A*32:47/A*32:49/A*32:50/A*32:51/A*32:52/A*32:55:01/A*32:55:02/A*32:57/A*32:58/A*32:59/A*32:60/A*32:62/A*32:63/A*32:64/A*32:65/A*32:66/A*32:67/A*32:69/A*32:70/A*32:71/A*32:72/A*32:73/A*32:75/A*32:76/A*32:77/A*32:78/A*32:79/A*32:80/A*32:81/A*32:82/A*32:83/A*32:84/A*32:85/A*32:86/A*32:87/A*32:88/A*32:89/A*32:90/A*32:91/A*32:93/A*32:94/A*32:95/A*32:96/A*32:97/A*32:98/A*32:99/A*32:100/A*32:101Q/A*32:102/A*33:01:01G/A*33:01:02/A*33:01:03/A*33:01:04/A*33:01:05/A*33:01:06/A*33:01:07/A*33:01:08/A*33:01:10/A*33:03:01G/A*33:03:02/A*33:03:04/A*33:03:05/A*33:03:06/A*33:03:07/A*33:03:08/A*33:03:09/A*33:03:10/A*33:03:11/A*33:03:12/A*33:03:14/A*33:03:15/A*33:03:16/A*33:03:19/A*33:03:20/A*33:03:21/A*33:03:24/A*33:03:25/A*33:03:26/A*33:03:27/A*33:03:28/A*33:03:29/A*33:03:30/A*33:03:31/A*33:03:32/A*33:04/A*33:05/A*33:06/A*33:07/A*33:08/A*33:09/A*33:10/A*33:11/A*33:12/A*33:13/A*33:14/A*33:16/A*33:17/A*33:18:01/A*33:18:02/A*33:19/A*33:20/A*33:21/A*33:22/A*33:23/A*33:24/A*33:26/A*33:27/A*33:28/A*33:29/A*33:30/A*33:32:01/A*33:32:02/A*33:33/A*33:34/A*33:35/A*33:36/A*33:37/A*33:40/A*33:41/A*33:42/A*33:43/A*33:45/A*33:46/A*33:47/A*33:48/A*33:49/A*33:50/A*33:51/A*33:52/A*33:53/A*33:54/A*33:55/A*33:56/A*33:57/A*33:58/A*33:59/A*33:60/A*33:61/A*33:62/A*33:63/A*33:64/A*33:65/A*33:66/A*33:67/A*33:68/A*33:69/A*33:70/A*33:71/A*33:72/A*33:75/A*33:76/A*33:78/A*33:79/A*33:81/A*33:86/A*33:87/A*33:88/A*33:89/A*33:90/A*33:91/A*33:92/A*33:93/A*33:94/A*33:95/A*33:97/A*33:98/A*33:99/A*33:100/A*33:101/A*33:102/A*33:103/A*33:104/A*33:105/A*33:106/A*33:107/A*33:108/A*33:109/A*33:110/A*33:112/A*33:113/A*33:114/A*33:115/A*33:116/A*33:117/A*33:118/A*33:119/A*33:120/A*33:121/A*33:122/A*33:124/A*33:125/A*33:126/A*33:127/A*33:128/A*33:130/A*74:01:01G/A*74:01:02/A*74:01:03/A*74:01:04/A*74:01:05/A*74:03/A*74:04/A*74:05/A*74:06/A*74:07/A*74:08/A*74:09/A*74:10/A*74:11/A*74:13/A*74:15/A*74:16:01/A*74:16:02/A*74:17/A*74:18/A*74:19/A*74:20/A*74:21/A*74:22/A*74:23/A*74:24/A*74:25/A*74:26/A*74:27/A*74:28
      | DR1403   | G     | DRB1*14:03:01/DRB1*14:03:02
      | DR2      | G     | DRB1*15:01:01G/DRB1*15:01:02/DRB1*15:01:03/DRB1*15:01:04/DRB1*15:01:05/DRB1*15:01:06/DRB1*15:01:07/DRB1*15:01:08/DRB1*15:01:09/DRB1*15:01:10/DRB1*15:01:11/DRB1*15:01:12/DRB1*15:01:13/DRB1*15:01:14/DRB1*15:01:15/DRB1*15:01:16/DRB1*15:01:18/DRB1*15:01:19/DRB1*15:01:20/DRB1*15:01:21/DRB1*15:01:22/DRB1*15:01:23/DRB1*15:01:24/DRB1*15:01:25/DRB1*15:01:26/DRB1*15:01:27/DRB1*15:01:28/DRB1*15:01:29/DRB1*15:01:30/DRB1*15:01:31/DRB1*15:01:33/DRB1*15:02:01G/DRB1*15:02:02/DRB1*15:02:03/DRB1*15:02:04/DRB1*15:02:05/DRB1*15:02:06/DRB1*15:02:07/DRB1*15:02:08/DRB1*15:02:09/DRB1*15:02:10/DRB1*15:02:11/DRB1*15:02:12/DRB1*15:02:13/DRB1*15:02:14/DRB1*15:02:15/DRB1*15:02:16/DRB1*15:02:17/DRB1*15:02:18/DRB1*15:03:01G/DRB1*15:03:02/DRB1*15:04/DRB1*15:05/DRB1*15:06:01/DRB1*15:06:02/DRB1*15:06:03/DRB1*15:07:01/DRB1*15:07:02/DRB1*15:07:03/DRB1*15:08/DRB1*15:09/DRB1*15:10/DRB1*15:11/DRB1*15:12/DRB1*15:13/DRB1*15:14/DRB1*15:15:01/DRB1*15:15:02/DRB1*15:15:03/DRB1*15:16/DRB1*15:18/DRB1*15:19/DRB1*15:20/DRB1*15:21/DRB1*15:22/DRB1*15:23/DRB1*15:24/DRB1*15:25/DRB1*15:26/DRB1*15:27/DRB1*15:28/DRB1*15:29/DRB1*15:30/DRB1*15:31/DRB1*15:32/DRB1*15:33/DRB1*15:34/DRB1*15:35/DRB1*15:36/DRB1*15:37:01/DRB1*15:37:02/DRB1*15:38/DRB1*15:39/DRB1*15:40/DRB1*15:41/DRB1*15:42/DRB1*15:43/DRB1*15:44/DRB1*15:45/DRB1*15:46/DRB1*15:47/DRB1*15:48/DRB1*15:49/DRB1*15:51/DRB1*15:52/DRB1*15:53/DRB1*15:54/DRB1*15:55/DRB1*15:56/DRB1*15:57/DRB1*15:58/DRB1*15:59/DRB1*15:60/DRB1*15:61/DRB1*15:62/DRB1*15:63/DRB1*15:64/DRB1*15:65/DRB1*15:66:01/DRB1*15:66:02/DRB1*15:67/DRB1*15:68/DRB1*15:69/DRB1*15:70/DRB1*15:71/DRB1*15:72/DRB1*15:73/DRB1*15:74/DRB1*15:75/DRB1*15:76/DRB1*15:77/DRB1*15:78/DRB1*15:79/DRB1*15:81/DRB1*15:82/DRB1*15:83/DRB1*15:84/DRB1*15:85/DRB1*15:86/DRB1*15:87/DRB1*15:88/DRB1*15:89/DRB1*15:90/DRB1*15:91/DRB1*15:92/DRB1*15:93/DRB1*15:94/DRB1*15:95/DRB1*15:96/DRB1*15:97/DRB1*15:98/DRB1*15:99/DRB1*15:100/DRB1*15:101/DRB1*15:102/DRB1*15:103/DRB1*15:104:01/DRB1*15:104:02/DRB1*15:105/DRB1*15:106/DRB1*15:107/DRB1*15:108/DRB1*15:109/DRB1*15:110/DRB1*15:111/DRB1*15:112/DRB1*15:114/DRB1*15:116/DRB1*15:117/DRB1*15:118/DRB1*15:119/DRB1*15:120/DRB1*15:121/DRB1*15:122/DRB1*15:123/DRB1*15:124/DRB1*15:125/DRB1*15:126/DRB1*15:127/DRB1*15:128/DRB1*15:130/DRB1*15:131/DRB1*15:132/DRB1*15:133/DRB1*15:135/DRB1*15:136/DRB1*15:139/DRB1*15:142/DRB1*15:143/DRB1*15:144/DRB1*15:147/DRB1*16:01:01/DRB1*16:01:02/DRB1*16:01:03/DRB1*16:01:04/DRB1*16:01:05/DRB1*16:01:06/DRB1*16:01:07/DRB1*16:01:08/DRB1*16:01:09/DRB1*16:01:10/DRB1*16:01:11/DRB1*16:01:12/DRB1*16:01:13/DRB1*16:01:14/DRB1*16:02:01G/DRB1*16:02:02/DRB1*16:02:03/DRB1*16:02:04/DRB1*16:02:05/DRB1*16:02:06/DRB1*16:02:07/DRB1*16:03/DRB1*16:04:01/DRB1*16:04:02/DRB1*16:05:01/DRB1*16:05:02/DRB1*16:07/DRB1*16:08/DRB1*16:09:01/DRB1*16:09:02/DRB1*16:10/DRB1*16:11/DRB1*16:12/DRB1*16:14/DRB1*16:15/DRB1*16:16/DRB1*16:17/DRB1*16:18/DRB1*16:19/DRB1*16:20/DRB1*16:22/DRB1*16:23/DRB1*16:24/DRB1*16:25/DRB1*16:26/DRB1*16:27/DRB1*16:28/DRB1*16:29/DRB1*16:30/DRB1*16:31/DRB1*16:32/DRB1*16:33/DRB1*16:34/DRB1*16:35/DRB1*16:36/DRB1*16:37/DRB1*16:38/DRB1*16:39/DRB1*16:40/DRB1*16:42/DRB1*16:43/DRB1*16:44/DRB1*16:45/DRB1*16:46/DRB1*16:47
