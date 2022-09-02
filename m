Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC10EA0
	for <regressions@lists.linux.dev>; Fri,  2 Sep 2022 01:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662083659; x=1693619659;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=frcCV1k9oG9oKj3dpUqdJg1PxRT2RSN/XKdLCPjaYaY=;
  b=XCLRcl145dUA3eds1H9iQh0eTNgEDFesNc2dc+qlEJmNBj/wEHTThwpz
   pOKMDm6t4/Bv3ZGQye80Ktk4kM8GB0jfDHiKpEBMZHlK+mlgKHDUZMTeW
   Kl5MCfTkBij7ybkncGJWAipxLO0Z2CF7v3eWjjdmaAoTmV3BLWocRahPR
   TVnMvIdFCDOKYeeBSkyaexRU4S0xZH4DII3sWml7+sI/dG8po41e6F+rk
   1mEfHfofY3nzj74VLzELuykmJ3eYPOKMjWKHSwiIab2cJrbYQXCStOtci
   VtL4HDeIPbPD21yho9b3Nux0BxoY6nle27ja5e9KdpAbqHwM0EopsTFes
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="322026463"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="322026463"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2022 18:54:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; 
   d="scan'208";a="563766126"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga003.jf.intel.com with ESMTP; 01 Sep 2022 18:54:18 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 1 Sep 2022 18:54:17 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 1 Sep 2022 18:54:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 1 Sep 2022 18:54:17 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 1 Sep 2022 18:54:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JCysIB/NOfI72cqjNSRPeOhcoPu+/E6WDjzPz044jiXpJerDRHw3D/scibWfMG7SBV7BDU7gdsZBjyFczPJjlxJh3nnroEajzMrKuYmHmdoupt3R/jllerLNQNPxv0fIZ91l2YZE3rJ1tzG0/dd1mr6Vp/YD6hwNHmD7cxPAR8M7Cme/5c3xyXsIpDZMfZOz7InlIalx9bvzKmLkLuKjQZJi33YheuusMY92zoudCzz55NhzlmHowhSnl8HBVXkqjuPe47qh4fAwu/rCp/v2B2d6J0jwbPYWauwwnMqG5XbCeaH5RDSfTxkmQP4FqdqXvZzzUSSx0uMPcguPDD0f3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
 b=S9yEYjTJh/+a7rxZZMdsuo2/MMlnMxxcdTks/frWjuCB2E5aX2txSh1TxJUrs/9ep1sq9JQ7ASj06TQj1YN5X95VZj+6ANt4xlGo36MttB/JB0vVVjmjPkuAcX9j9CawLSQh1AydO6Qs0EHyaPwKe6cD8go/53Fu7rHSzv0FoIz+fAR1NkwC+tmoPWpweAo0gJzZPX+f4DZe7SkhTGYfLy2ZvqJiir3HRx/OHi901DlrytGUnE8aMDrBOrOGVgB5hgrR4hlO3zH+HDHvy054ywlS3S4BAWbO8pLxO+vxMyCWlsA2P1BEhAYOsuwpoHu43xHcFAnYgeVSW1kQyxQZIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by MW4PR11MB6957.namprd11.prod.outlook.com (2603:10b6:303:22a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Fri, 2 Sep
 2022 01:54:15 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::5482:e4d0:c7d9:e8be]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::5482:e4d0:c7d9:e8be%4]) with mapi id 15.20.5588.012; Fri, 2 Sep 2022
 01:54:15 +0000
From: "Li, Philip" <philip.li@intel.com>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: subscribe
Thread-Topic: subscribe
Thread-Index: Adi+buaUOSzE3/F3SjSykiwEu0YjXA==
Date: Fri, 2 Sep 2022 01:54:15 +0000
Message-ID: <BL0PR11MB299556EAC4F49200D934DB59E07A9@BL0PR11MB2995.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 643dbe1f-760f-40a7-ebf1-08da8c860a77
x-ms-traffictypediagnostic: MW4PR11MB6957:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KrVw/63NSRieP2HnFvVpVvg9skzO5yfRBn+KFEFhfY30dY4touuO1aYKlctw46urg06607bR4H5Qq8Xb6wOx4FWn7eYk4IkvptxkAIkwfhUhbEl1a1NL7idoJSyNSmVKMdRnIEFC4G7KhzO0VeZdQQ5+Zif2OjLtA3I/Q/KIIZkTro9958+Pbjr93spPZ8O/t6rmfrp4JkgagBHlxAIs2lLsxXEmUEA/Z4o4k579uIApXSSubu/Ce0x45to14oMrdMj/D21Bw1h271wgWKvMaWyeN4DUYj73oVt0GBUg/9v29rU/4E+tQCUoz0N0r9VRfCGyUo0dyhaaAc/15WYim99ltPkJOOGU9294Q+ydL+XgNtJkGbyI33BvTWoiZiWgTrJbQcBRF3CC02+npqGfSDWZIQ8Fppfdw3LOyUHZi1s33Bft7TaDekezVCdD/t/VXYYUVhLTflNPyeGvIoZfAcQgBWFKpxrP6x/RLrGTHVRYUEbNSFzah3UnV5zFmoR9fvyMU+nZmgY+Bh57pkRgLGC3A5ki5Fl5ESIKgDmHxh3Wpym28yERlUS2M1naLyPT
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(39860400002)(376002)(346002)(366004)(6506007)(7696005)(2906002)(4270600006)(9686003)(71200400001)(122000001)(6916009)(316002)(38100700002)(33656002)(7116003)(76116006)(52536014)(8936002)(82960400001)(3480700007)(41300700001)(186003)(621065003)(86362001)(73894004)(26005)(38070700005)(55016003)(478600001)(8676002)(64756008)(66476007)(66556008)(66946007)(66446008)(166393002)(220243001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kL8uXnTal8eLPpGuSEaE04fR+4DI4EGAp3QjUF5XinSaHSoIRi2dXR1qrlZI?=
 =?us-ascii?Q?1Nlsz5CImQwSUIkr8NenqUJ5r+QFhANbHpcfJHQ9Nxus7IOS+zvCilxDcwdC?=
 =?us-ascii?Q?/K2nnWm+dwUbiE8E+tHKZ7YfyO0c+WLiqOrrnl8GK+fWnuFXIEMNL7Vie51G?=
 =?us-ascii?Q?+8c2b0BB54bLXRj4ETA7nG/mpuPcMu3bS76lnxEi7xetxqZcutkpvClPlGo2?=
 =?us-ascii?Q?A5J+JtXc+5fhcjJAc6wUdmKY7uYpxNGS//8yXrHQ9WR3sndQecG8KxIkQLZe?=
 =?us-ascii?Q?1pE9Iq8VU5bsrEgNku+U63Y/k4xdVin1CX5Ak7+hUYakXfP0RL1EY5cmz4WG?=
 =?us-ascii?Q?ljQ4rVkpR9HOLlKdZCL9FSy2qAoGqQAhiLgOfoTGPwX3WWEG5KWY0JtbKCfw?=
 =?us-ascii?Q?eI7ijVwzbolQs8mSftAgxNxG3RSdwKD9QXtv0rvJzi99pKRUjJ4JvdtYGL38?=
 =?us-ascii?Q?aYIyjZPKwyYGUAz5Suo+FjyRmqO84tLcZe3mgt+h1atEytuStXJbxSxKOzvB?=
 =?us-ascii?Q?ogx+ees+IrBXlERqdlYZcRgjwvCAKLyjD3Ve/oekthQhfqGM51i6PQP0EeRi?=
 =?us-ascii?Q?KQKFLc75aytw9Z9R79C5n/T8jMo6wEUo5ppyRp2H3p45iBRzRvm1ksm5TR3M?=
 =?us-ascii?Q?Jm6tnbPJe6BH3kWHS1deMBrAoVCMN9JiEcqfXKqVbm/Tqfw4ZTczo63Au9Um?=
 =?us-ascii?Q?OsNQT+PHNyETgE1RXqAMIajSHA51yWt2P9QWWqLU1wtphR2Pqm/JryMi8y4E?=
 =?us-ascii?Q?IF0pAZCSi6O0ICb8Zty5FBFzmvfGyjvtEOsLhwBurfmGqlCQ1NM99aZviXoK?=
 =?us-ascii?Q?gozSj0i0tPg6h/bkEWnNpVAmD/Ywx8MSUck0mA1Fq4zDWsZw6VhztwgqWuEm?=
 =?us-ascii?Q?8uvMMUl6RqLqcE1E7aEGuU8XiJZVuAAfH8ilkiSTONZEBXZJ4wN4g2hvycvJ?=
 =?us-ascii?Q?t1FoF8GW7Wk00T6p3/pp8EMC4dGdGtn78nlZslNIAKi6Jlbp0SD5EdqYKlXc?=
 =?us-ascii?Q?uVMD6a9loq1jtIIRtLK7v1iCJCIBPBV6MjO2WboOweFjwIThQ131MVvO5bhY?=
 =?us-ascii?Q?Ion3Kv+DzFwdP6NeDA3iS6myiwFSTgjWVeaaLvX5WitWW81vMv/I6bNNRb7h?=
 =?us-ascii?Q?GvSggjwZ7bHXIiLxI+djSzdhBcxFfP94KkvIhP0ciOukxHA/rzr1rip4RNQq?=
 =?us-ascii?Q?aMC8k2n8rIyDoT7RxjGI836kZz0n4A/+bwuo6wXfBdFoU5hYk2+C9lOB45zA?=
 =?us-ascii?Q?0w9hl6eXdmtkWq6ekz6Dp58Ijz+EQbVMRTLMnSDuX34oqCsFffsqrj5jJgTY?=
 =?us-ascii?Q?h7b9nuCnYsHUgRrXRSH+KHbXWHyCToYQgbC5DJ7dPfeWVse1tgxDkuSUJ10t?=
 =?us-ascii?Q?FeEvnM3SsxCxmogXeHKIGcLyIL4WGFr9hYd93wqlLJ9WsCMgG6310X0j1nug?=
 =?us-ascii?Q?N0G0EQTvEqQq/aUjoaD2ecKOqKKLx41GRRDAU4tKbRdA2JEskS5qt8IxdLld?=
 =?us-ascii?Q?+0AmcuacHGhV9Qxs1Indfui+4p98f7iY+DTcDV+lfQC7UZrBFbFsWSiRge4o?=
 =?us-ascii?Q?9jIzhu10hHMrLELNbRzw+fXMb5UjAC6jCJOhXF/F?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 643dbe1f-760f-40a7-ebf1-08da8c860a77
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 01:54:15.5171
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EeP+f9qitwtWJViTHlEl70z3DF3wzUcCOPzViXoM1jZRw8+qB9xmFuh6idpKuRZ8THyL6bv5ZN7C0noRv0IMHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6957
X-OriginatorOrg: intel.com


