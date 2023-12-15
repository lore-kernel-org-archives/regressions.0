Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20001381B2
	for <regressions@lists.linux.dev>; Fri, 15 Dec 2023 15:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lPKbf3HX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702655060; x=1734191060;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=oF9h1QYgncN0gey8l3FBgy2b1kzfhATvY37D+ZD0wzI=;
  b=lPKbf3HXo3IC9tO72fdmN09J3fqr3+q+639t1oITC7qj0KTCn1TPUGmV
   Dbtjfw2sIRPVcB6HdqXVrv4466XjPtgYKup2eo77/mK2ddoM6DJI4RxiV
   hvuByu2uLOzgWbX5zT1eyb6vv0TaSLO4w14adc2XufHH/Y98lpvZ66gHz
   GHhKMz9klYVG10+X6RpRuaKrssZkVc8/bbHCUjtPpZpehUUSRPnY4EoMS
   dJftbbOKJo8EM8qdoH5cGE+4/n5kPyYCCb7xiWk4TyPLUB6wjMV5xbk4n
   yabm+ZRxQuakz4bVC0ey3ws+FAvbnD6xJCcMNnK73TcdqT74PWsV6H5wR
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="8708965"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="8708965"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 07:44:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="750971325"
X-IronPort-AV: E=Sophos;i="6.04,279,1695711600"; 
   d="scan'208";a="750971325"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Dec 2023 07:44:17 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Dec 2023 07:44:16 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Dec 2023 07:44:16 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Dec 2023 07:44:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1dglmE8PEVgoT2yO7++9ApXBCJzC7wbOU8lhdio+nNuBvxKg9K9sRnAv60e5psn4bYMKHT5TvIe/UI/kc+Yo5eXfwgX1Y+8WlLauWIgh68lDh5UkVg/sF14EMwR634o5dYa13Ho0eiW9qKu1PinX5sPYtnIPG4VOEUOgXOlDYUPXquwuIaRz+Ml1aZy4h5FTRGcmXVvuvMNSA6pkWMbvExIiwmNGYDm6uSsb48fdwJB50/YcRWdezsG5MZclcAGvMfFvpzMDn72uXapaHPs3Blyv/sWJauU7MrtBuNGiW5aBSRtSfRG3NVnQexDg2xAlSfwEhbBlBI/InMjU+LeaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfcUYYifYZ+5vBCd4kWs8EXVAuSU475CuWGjdKNaXbc=;
 b=Sh63bnuG4mixiuq/mjvcy/h8p8Wr1+hWmXtTlGUGAbxo5EoonkXYknn+wjupEMMwgEZ4o2OIxkAKIUjMntWJd6hfF5fNhh6O5jeyGK1pg5asVvjxBBF5DIGIQ5thdrPVIRas8QbE/RLkkFYg2tFhVR2icxeT5Z/dHy4gxUv2AWX8Ld3LX4HtHAX9oxx+NSClmX6dAy2OGafBh2nzEI0aMy1VCHM9+AgOfp2itcZNY4fV3bKgUmP04n0Vt+eVfbI8BwFntvPZDCjD8V3BKk+sWUvnMdYRRDzB60nwhi8JdYCsQqvzbKX1k9X4BJJYTDvQaXVFxSWm9y85zxrLhU8xmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6201.namprd11.prod.outlook.com (2603:10b6:a03:45c::14)
 by PH7PR11MB8275.namprd11.prod.outlook.com (2603:10b6:510:1ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Fri, 15 Dec
 2023 15:44:14 +0000
Received: from SJ1PR11MB6201.namprd11.prod.outlook.com
 ([fe80::6299:dc9f:239:202e]) by SJ1PR11MB6201.namprd11.prod.outlook.com
 ([fe80::6299:dc9f:239:202e%5]) with mapi id 15.20.7091.028; Fri, 15 Dec 2023
 15:44:14 +0000
Date: Fri, 15 Dec 2023 07:41:39 -0800
From: Ashok Raj <ashok.raj@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: Chris Lindee <chris.lindee@gmail.com>, Borislav Petkov <bp@alien8.de>,
	<regressions@lists.linux.dev>, Ingo Molnar <mingo@redhat.com>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "Peter Zijlstra (Intel)"
	<peterz@infradead.org>, David Woodhouse <dwmw@amazon.co.uk>, Ashok Raj
	<ashok.raj@intel.com>
Subject: Re: [PATCH] x86/smpboot/64: Handle X2APIC BIOS inconsistency
 gracefully
Message-ID: <ZXxzs7j3Ag2hBaoP@araj-dh-work.jf.intel.com>
References: <20231210110518.GAZXWbbn9+ZNF5kwQV@fat_crate.local>
 <CA+2tU585yW2z37NtYqjVe+ZMw+oU_vbS4X=Q=sAxME8GrPFDpg@mail.gmail.com>
 <87bkavqykk.ffs@tglx>
 <CA+2tU5_TzDQO2U8SGDYhsVPR8iYh8Q8vTqv9+HUc7LN3cV=2Sg@mail.gmail.com>
 <87bkaup3w2.ffs@tglx>
 <CA+2tU5-RoR8qCGRdsMH0wo5n8v4fV8A_H5yT+mZadsF7E+QkWg@mail.gmail.com>
 <CA+2tU5-18YQSpFzgUKyeZdJXe0Rs0GxtYY2s5QjznzTucJKCiQ@mail.gmail.com>
 <87ttolnu36.ffs@tglx>
 <CA+2tU596G+auWJ2MzYFJ3bv=Y4zP2NSrdtak7SdF9SH6Ht_dzg@mail.gmail.com>
 <87cyv7on8t.ffs@tglx>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87cyv7on8t.ffs@tglx>
X-ClientProxiedBy: MW4PR03CA0040.namprd03.prod.outlook.com
 (2603:10b6:303:8e::15) To SJ1PR11MB6201.namprd11.prod.outlook.com
 (2603:10b6:a03:45c::14)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6201:EE_|PH7PR11MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: ba2725ff-da1b-4b9b-6d87-08dbfd84b0a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: txGT+1ZNTyRBIhHW2NdnAn52O8tPraPm1vgLZI9j4YF+F5G2kVuq/CLDu+dXuHZq7LvsZQbslGbpNpE5xhLpmZLnoQLMv57eqevTA+THT2XDyVzQesA8nbQEu9TQTS9wFK6TWiAZeC6xWLbPR/9Bd8rYhuXKUuioMWDtw5OGRyYAXiOuQSQmHWLTeLYVclMP5wvRkka9tvnLOfoNs4EWArdaoA31ltBYalkLkGYgYOhuKPm0WWcY6hBClFtiOCzqY4wz/bzkePgBuwZjFpAdDjfSQkjpe4pt6VgeUke0DyUjEAyolb+mon11WjRXYCrRQWtorSn+hsqOWO3hpTp+id2OSHJUtXVdQzi3a3dXiuna++qn5Ka6sFBj7JxBkAN78zhb840BD5k352LAYfIqblNXQc7mVtC+bc0+q0W1iyJQ87NQpxl3AIX6UrBEyOpw0LpeUZQMHGhObLOCifb+4gcoYSh9Ge0wg5KQ71wz79/JIX4kao3D7GtBhmg/AmStbhxTlLi9OtujQLbyLbSIywdqySd3sAWumo/2p3wdOS+ulH7wfXOaiSgegh4Ep70i
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6201.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(396003)(346002)(39860400002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(6512007)(6486002)(6666004)(4326008)(83380400001)(54906003)(478600001)(8936002)(8676002)(44832011)(26005)(66556008)(66476007)(6916009)(316002)(66946007)(6506007)(5660300002)(2906002)(82960400001)(41300700001)(86362001)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q70yozD7/1UgLrwuqLDneeeJLJ9Mg0W0W8c2jKsLva8Llf6fBTCN9vX06a1W?=
 =?us-ascii?Q?KS9StIlSV9l8wf4WLPqUsVI16dAV9Lvvi7nmG22kcLrthIUfgbkaLRu4mNiZ?=
 =?us-ascii?Q?1vFUd2prNbLEScQ3dk53HI96xSCShsAbt2wEhHb2TJNwreG1THkcbewb24x2?=
 =?us-ascii?Q?+kcT3ChVQbtsVSpD6kxOw8eWxs+XVKUrJ79Dn2oMfjOGfJsphYrMwXzE22UG?=
 =?us-ascii?Q?EZ9BmttWxA7o1i6y0EGB0wF1QEUKr3972IVyd4wx7UuWtZMxneIGvqGbJAo/?=
 =?us-ascii?Q?/vKMJDD21CWbYl50RDvRibDHDi7jb+iGj0ARYoOYhKPPWzd0ylRMeUvQBsXH?=
 =?us-ascii?Q?Sum+MjbNqz7Mgu0A65Unqfeh5JJI2yojmagwXtHlgoNBPrSJt5Tpk1od2hvv?=
 =?us-ascii?Q?HX7n4sXZnJnpj0PyMBDijlBONGzYP5+8cOBMZWuyMwlCWt8XnDl07TMX9g1b?=
 =?us-ascii?Q?maAjxOXJV7q9xUo0dUNuh7p9jxyelodmBrxM9hLTw2G6Eph85w/dyqZ0P1K1?=
 =?us-ascii?Q?wYOy4yK0vuKQv1j8opZYCdTkOgj5veaWBND/mVRzQ3Bf7dq7JoFT7QEXNCsD?=
 =?us-ascii?Q?fd6S2OGOFO+HKzUm/1el3HTd21j0Ju5MboNdZazo5avPq+FRW+FO3Mbjs0l9?=
 =?us-ascii?Q?uxwR3gsJCJCuJXQnRtZNJLDsQLhhafJZl63IBzraOLAam2AR8560dKSEKaWN?=
 =?us-ascii?Q?60D01fe2LTiHKzatCCckUgTUVTUs9E1uedkCW1f3cwbNhYXNkF3J+kgO9Krc?=
 =?us-ascii?Q?C2Iw5UXC85JReGTgB+lXOXp8uK3XbrjU5YzUKswYhJOLDfdEN258Za/c1KpI?=
 =?us-ascii?Q?8ELNDxNBH+jNEqozRCwHISvZxtA5Asrj0ycKsYu6+uNkqVD4Z5bcOxKlpxdk?=
 =?us-ascii?Q?ooamybXwEu9+sGjv0MW3PUzTPxjJkQpeJmdEzLFJotg67OxpVktsbO4B5n7S?=
 =?us-ascii?Q?vesbPmcpWkNNFp5hvQKo7Hup63J+cm9ePfAfNtPg9lKZPfWoxxLglyNS6+X6?=
 =?us-ascii?Q?kU/tJKvQNs5fN2dAOq6KySYifMIO5nRRFZ/S0G20TYT4MrmxO09b/g6LICY9?=
 =?us-ascii?Q?VG5knLXF3vhHQbgiDRyp6xiFMyM8jBqOo3u6WmWOLfHevxg9NDor07n9yHU/?=
 =?us-ascii?Q?8FvgKX1VeyJhwsQ3++4fcSxG1hmHc5pRrvHvVe/9jHuNP5HY48/ZBaydCq7b?=
 =?us-ascii?Q?MGeLn4hpyX2WCXkplP546hzP/YU4hbekapH3SIZ8+sXxHLpbmXuXiV2345zM?=
 =?us-ascii?Q?EY0t/HvfMIo+cXCFwWc0pI7aysJ2mGj8ToCrg5AOPJzEQ0pPVAdb7M27kbxJ?=
 =?us-ascii?Q?EYJ8fhtVF7Squfumn9wDrxR7DKDNXBzdrragtiZzRmkj/OdQUJWhQ3OCt+2c?=
 =?us-ascii?Q?tGGdS2MsgpwlrojnUZihWciKAf/fuEA78i0TegO0h9n8nm9kFFubmrz9XPXE?=
 =?us-ascii?Q?vRKldTDlSnnGpu0Qwz4p04l0t1szY4/m9BawOJVVJT6p0WJLTsezOYYZEIH2?=
 =?us-ascii?Q?0pszonSk/MK27eiZjJqiQq1QUdnWQo7Rkw1kcphkmyuSxzGzyCkmQS9H0fGW?=
 =?us-ascii?Q?p9RrhcRd0yhwhK7F7pTrBtz8kqVN09Ca1k6KePm8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba2725ff-da1b-4b9b-6d87-08dbfd84b0a4
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6201.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2023 15:44:14.5486
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /tBpsPocpiyre2oc4HNlwzSR47Ex4BBgpJbX+z50OKk0AUPOFVzdeoE+blLCGonLBs5lEILWtMqmJ3gm3ksTNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8275
X-OriginatorOrg: intel.com

On Fri, Dec 15, 2023 at 09:58:58AM +0100, Thomas Gleixner wrote:
> Chris reported that a Dell PowerEdge T340 system stopped to boot when
> upgrading to a kernel which contains the parallel hotplug changes.
> Disabling parallel hotplug on the kernel command line makes it boot again.
> 
> It turns out that the Dell BIOS has x2APIC enabled and the boot CPU comes
> up in X2APIC mode, but the APs come up inconsistently in xAPIC mode.
> 
> Parallel hotplug requires that the upcoming CPU reads out its APIC ID from
> the local APIC in order to map it to the Linux CPU number.
> 
> In this particular case the readout on the APs uses the MMIO mapped
> registers because the BIOS failed to enable x2APIC mode. That readout
> results in a pagefault because the kernel does not have the APIC MMIO space
> mapped when X2APIC mode was enabled by the BIOS on the boot CPU and the
> kernel switched to X2APIC mode early. That page fault can't be handled on
> the upcoming CPU that early and results in a silent boot failure.
> 
> If parallel hotplug is disabled the system boots because in that case
> the APIC ID read is not required as the Linux CPU number is provided to
> the AP in the smpboot control word. When the kernel uses x2APIC mode
> then the APs are switched to x2APIC mode too slightly later in the
> bringup process, but there is no reason to do it that late.
> 
> Cure the BIOS bogosity by checking in the parallel bootup path whether the
> kernel uses x2APIC mode and if so switching over the APs to x2APIC mode
> before the APIC ID readout.
> 
> Fixes: 0c7ffa32dbd6 "x86/smpboot/64: Implement arch_cpuhp_init_parallel_bringup() and enable it"
> Reported-by: Chris Lindee <chris.lindee@gmail.com>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Chris Lindee <chris.lindee@gmail.com>
> Cc: stable@vger.kernel.org
> ---
>  arch/x86/kernel/head_64.S |   16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Ashok Raj <ashok.raj@intel.com>
