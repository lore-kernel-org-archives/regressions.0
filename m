Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazolkn19011007.outbound.protection.outlook.com [52.103.1.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657173822B5
	for <regressions@lists.linux.dev>; Sun, 27 Sep 2026 23:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.1.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790553071; cv=fail; b=T7E4mrE/zTKwNma3XwYvFw2WmgeICqAygHOz9VQT3CxG6swwttVP/bgbx5vHhbXTOo8qz/Fy4t4TStLCtajtI2HjOo7ykwkNaxH94WEMOJHP3sldHz7Zpz5YuozmHD23a535TXwR+t8NdgRLb1yqnhKdxovRSjYGekWRFx1OHSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790553071; c=relaxed/simple;
	bh=S741k6kESJZaiz5nmznXtJgL88O2VeUeN3k3LBSSE3s=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=XDWKfP+rG1lhhtmffcy7pU5bC7rVn86xaq9mmWgYSiRttwQtBk9IEMjpJ/qLhXtmZrTqQ9KwhVn8ztTjySa1MiVZU2DAHHfjbG0x38vWcidRgW2s9GGHgKNqQaXH8vHxvMnPuYMBrzdhcj6C63GEU2x/klx18ua4o9yueHLhw+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=OwXXq6Ti; arc=fail smtp.client-ip=52.103.1.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="OwXXq6Ti"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=InH0YpyWFNw6YyvHZociYUFEPAVSz9I1py5NLyPU4/GM29E5uhD9OJi4WE/EHC2iFjZoNeNmFkV3Pr/WH3dB9k3cnmU+UDYXJM+tETGULdpTkBuO36phHaKGRrqdf0skkfU1g+kjtf4Q9QU+qQGyThSg5VHWMjhLPf34Fo82pAquly2YoHKvyez1/rVoiM9ZIVmYPZWMAuH2MbcaFuazljWEvWu4QjnUcgp3uPaXIKx/+7nKT2Yu9fS2yzIE08tol6Td4SI+l4OsPtWnn+0RVBFmMPMiScznsdGliB+6UNCKZGiVbiW+GU/M438eeVSXmi6xBVdGdBfOHuvBNbq5HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S741k6kESJZaiz5nmznXtJgL88O2VeUeN3k3LBSSE3s=;
 b=C6rJdgL/gdn4qpbM5HS962sGKyOUPF5R102QpFz4dNrXYCk/obaYXcfn5Nqv9XBQD5LbTm/VFHBRgcxiwHXBLVT0OHZaSy19J8YCrGdqvhU6XowkdhlyBjv4f1vwhc+zWQf8CLu8AEgEYosGyH/EuD51LC36cGahzC63WkttQ/1s7uiTzeOv2ynm5tXDREUZws3ePAkW9Dh4+PjSsgWic76CONgWib004qmIqucEPEsP/KoOIrZbf+2kG8HnDH6wpKA0Un5ks6zqaQ1QJRH7JA7lckhn1rWH1a4P2EY2/1zyUA6Mnl3UvC32lyXe9lV2k1BTkYFU/ImGSRs3dIMs5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S741k6kESJZaiz5nmznXtJgL88O2VeUeN3k3LBSSE3s=;
 b=OwXXq6Ti4VO47QcPdQ56ZwQXij/XlOn25aBs/tvQXcaIDN4U6vGMgysmgslxwpdSpQePoAKOd9noWpLLCiWL8DcIl9kfgpsDsXYEuF6n7NUm9qwgj+lgBgRHBNQK9nmzQtH/z9qINZX4QEKWH1iUVgy/0J3Xe0KkPGp+OJekwl83KPf73GUmfI3Gyy6XsTCUosRvJ5mqJcKRJcMpNh0iR7Rx4dovpRu+I6R50DVqCcNRWP+7aUx44Nd+euBCaO5VqH17jR3onbWjhrJnMi1dKywt7HxzjwpFbsYKmAv4wx3Vr7kEMFVUvsQFCKILbo7OmQKSTUUKIo5l3CYZbL5j0A==
Received: from DM6PR02MB5433.namprd02.prod.outlook.com (2603:10b6:5:79::32) by
 SJ0PR02MB8799.namprd02.prod.outlook.com (2603:10b6:a03:3d3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Sun, 27 Sep
 2026 23:51:07 +0000
Received: from DM6PR02MB5433.namprd02.prod.outlook.com
 ([fe80::8766:b6fe:2e51:d829]) by DM6PR02MB5433.namprd02.prod.outlook.com
 ([fe80::8766:b6fe:2e51:d829%3]) with mapi id 15.21.0451.022; Sun, 27 Sep 2026
 23:51:07 +0000
Message-ID:
 <DM6PR02MB5433F3C2A156335B6ED47756EA8E2@DM6PR02MB5433.namprd02.prod.outlook.com>
Date: Sun, 27 Sep 2026 19:51:04 -0400
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de, regressions@lists.linux.dev
From: Dany Patoine <dany_patoine@hotmail.com>
Subject: [REGRESSION 6.14 -> 7.0] ALSA snd-ctxfi: no PCM playback on Creative
 X-Fi Titanium HD (EMU20k2 / SB1270)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0263.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:68::17) To DM6PR02MB5433.namprd02.prod.outlook.com
 (2603:10b6:5:79::32)
X-Microsoft-Original-Message-ID:
 <b079b173-3491-4731-9e12-6c8770b8eac7@hotmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR02MB5433:EE_|SJ0PR02MB8799:EE_
X-MS-Office365-Filtering-Correlation-Id: c37d7f87-91d3-406b-80f5-08df1cf231fb
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|6090799003|8060799015|19110799012|39105399006|20031999006|24021099003|23021999003|37011999003|5062599005|15080799012|25010399006|4140399003|3412199025|440099028|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?azN3UktNMEtQM2dIZmVrcXlrRTljWEJKdEc5a2lKZVBzQy9TQ1pvWHNJMlI4?=
 =?utf-8?B?am85NnNBWjJkV1BqMHFSL01KZm1EMzZFVFg0Nlh0QkxaRTJ2a2lpcDZGa0Ji?=
 =?utf-8?B?RGNMdWNkb1RzeEp0NnRXd0VRRTU4Z0dyaEpkVFJmMkNwV2xqbldTV3pqbFcr?=
 =?utf-8?B?eWhqSnFXSEFRL0ptK0tnck81SVJqR2d1ZXNCbFZOVkkrcTVMM3dUaXFUbXd4?=
 =?utf-8?B?RjJ0MzJpc1FVNXN0Mkp3YklPL3BpakxwbDZJUnlZUkZhSzlHbzFsQW81ZEVZ?=
 =?utf-8?B?RVRyczVCdFhQcldoVmxVR1pEUkpoa0wzQ1JOZGx0cGFudWdvcUx1ZDd5dUds?=
 =?utf-8?B?c0tMa2kxOGFZOEhhT0ZvcHh4Wll1Y2VUTFpDODU5TkZzTEtxYWtkZHQ0aWdw?=
 =?utf-8?B?Z3NaclN4M0E1RGkzakZLbkgyVS92amJMVXdDVFV2ZGV1ZHI0d3lCZ3VURFFT?=
 =?utf-8?B?RDdWbWZYNTZ0UGlPcndHVnJJV01UWWdMYzFxQ2JGSERoa0dsNndrY0k0TDJO?=
 =?utf-8?B?WlhQY2FiR2NJUVIrVDFZL29GS25uRkpkTFQ0UXhsWlFOR0JDaU1wemxORCsy?=
 =?utf-8?B?MWJ4UE04ZWxGQnNBNDYvNno1d1VFWk9Jd1EzQ2FjSUxuRE55RGVjM3pHcjM4?=
 =?utf-8?B?VXZGTTBQSXhzSmtsOGNGbnRjQ2ovSGNvcHJCMDM0MGtEMFNSUko4cGRFYUty?=
 =?utf-8?B?NktBMUJCZitmUG9zOXVvVWkyZVJNcUttOVUrNnMzZmhuZzIrNnhvUDByVC9U?=
 =?utf-8?B?bFlvYUtuUDlpOXBPYlJadmppR1p0OFhZTUJtcnpHNEZ5SFg4VWFhWnpjTytI?=
 =?utf-8?B?OERzUHBjaWJERGNRQlBXNVp0ZE1OQ1hOUFBhZHFlYXhBVWhPY25HQ0c1czBZ?=
 =?utf-8?B?aktjOENFY043NWlPRm56TjRhelBOK09rcSsxWHhMaGNUOW9aK0k5T2o4a3c5?=
 =?utf-8?B?c0pBVk5ubmR1Wjk1MUpXTmlSaTI0OUFxL1I3ZkNFTW02N0paY2huckJUbXZR?=
 =?utf-8?B?Z0dwWjRpOXBlaUFPVjNyUDE4NG9MdTlORlNYbTQ3SURhQ0hIZjh5RmJpM2J2?=
 =?utf-8?B?QVlZNE01ZnlESGlndnVSS3ovcnlPUWZIRXBjcHk2KzFCdnJRT0E5cEhEZ2pu?=
 =?utf-8?B?ajRSdmF0OVF4ODMxTld6aEI0dWNaU3FWckpTdGJ6U0l2V2U2RExmZnNVdCt6?=
 =?utf-8?B?SG9WNXBveWhrR0hFSldpUENzVEdiRkdwUlZwMktVNmhiZy9Bd0RVNkxDeWJo?=
 =?utf-8?B?SG1BYTJqcU0zbmN1VC9JYVdTU3FCc25wT25iczlDbTZMZXdJejcvMEpZWjFu?=
 =?utf-8?B?bU5GaEpoNWdLRzBNSzFoMkhTN3QrRy9zNzVieVVPZGZRNkVhellQL2tMOFp1?=
 =?utf-8?B?Ri9JcjdhdCt5R0NiMXdUZURlSC95V0hKcFJWbGRGLzhWenRUVE8zVHpnWUxE?=
 =?utf-8?Q?cSSDzhgg?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RTZHbEltdkgvdW5JVnVLUVlsRUN5aDFhVXZMTitFVEZHOVJSZnYzUkRZOFhp?=
 =?utf-8?B?eVJDa2hDVDhNWDBlZ2hIdVlENTIyZ0JrbnNJSk04YWhwZnM0TEt2OHNIcStu?=
 =?utf-8?B?dWpsZU1NNXB5MUJnNVFtZFNHMFBFMDhZQ01PWTlJenk4emw3QXlVVnR0bW1M?=
 =?utf-8?B?VG00MjNENWpJYkoySlhhQ3A4akpWLzhPQUlkZEdzS0F4M1Z4WXl3TGE2ODJK?=
 =?utf-8?B?MzlkMXR3K1ZnYi9vVFIyS1BoMXZHNFhZdkxSclkxbEhIRlFMQ0o2eVpqSEgv?=
 =?utf-8?B?cytsamxKb1BHWVBMOWdqNjZyNGdDYjJlNzNHbmZaK0JZVEFSdVBsdlltdThk?=
 =?utf-8?B?QUZSdkNZeDhRMWlhcTRVSUQ4NG1ib0Z1ZloySk9tYW13LytkU3l2WG83VGdO?=
 =?utf-8?B?ZFpVa24rdnAzek56WkozNjJraGhvelhod0c5cDY1TFFmdjcyMW5yNjJJMk8z?=
 =?utf-8?B?Z3g5dXNWT2VGeGFocERDZEI3Y21mc3ZyWkRPR2RJOWs1RDJYYlFLUklzMUxk?=
 =?utf-8?B?bVRCbDJHakxaV1huYlJmR0w5NGQ1Slh6ZmtYNHVjaFQvKy9sSDgyWmpXOTNn?=
 =?utf-8?B?djY5WHdXUlhLY1BVVjg3alh0MkFFM0ZuVnZ4cFQyNVArMGpCQUNRZHJZblI3?=
 =?utf-8?B?MzBKMFZTZHBLWHE1bEJpajRtdkE4OURFQzllRFZ4Zjlrb0l2dkxOMW96aWRY?=
 =?utf-8?B?YkQ4RUNMOFVXMlpaS2VnQklCdlBacjB4NTBuZTQyS0pITzU5K0FvWTRaK0Iv?=
 =?utf-8?B?bVhLSGtSK1NibkZvRFZuWURxRTdvQ3ZBVVFhQitmNWlxazZ0dmFtNkJjV1Y3?=
 =?utf-8?B?SWFFWm12RjR1TTZ0RWc3V2ZPMUMraktlTkR3RCtYc0hqQnB5eU14eDFqR0NB?=
 =?utf-8?B?eTdVZWRFaE9iL3FKMGJ0cXZmK1ZmQkkyZ2ZWbjNmM0YyVndJb2o0eGd3NFhW?=
 =?utf-8?B?U0l2ZVpONHR4TnhVcDFWZ1l0UGUvdW1iOGlSQVpSSXV5WUY5Z2NyMEFERWxu?=
 =?utf-8?B?ZmtjM3VYak5GRUpyTmFJWnRkRHBpWUJLdGJ2ZkdNSWRCaXhZVDI3ajE5c2dE?=
 =?utf-8?B?R0s2VFV1SzJDV0ZWTWxSeVV6MGszalhKMzZ3RDNka2xWeUx2cGI5eWM0dk1D?=
 =?utf-8?B?UEh3VnpEWlFmRHhjT1lXYWFZc2ZBVm1YWjVSblRLa1EzUXA1Qlc0bCs1Sll6?=
 =?utf-8?B?Skw4MDRZUzlLZ0lobFY2K28xNTcyYkhCUzYvTlJvNDd2M1V4OHFVRy90V1lQ?=
 =?utf-8?B?dEZ6NFRZeldlblFrWWR6MGRiM1g3TzEzTU5aNlMxakM5ZVA5b0VHZ0FUZXF0?=
 =?utf-8?B?RXZXZEl0Z21uS0t1T2ZyQkk0em5pbE1MTWhpNTZQY0lnNzUrakZLL3FBNzhG?=
 =?utf-8?B?OTkzcVBiQUgzcDZtYytqRmlDVUE5eE0vdk15eGxoVHJOaE8yaFYwaXVNckRD?=
 =?utf-8?B?ZWgzN2JnSHhMWlBGWThkQTgzMjkwLytKeXdGM3l4eHp0L3BWUEtUa0NoZHFW?=
 =?utf-8?B?WlJJejlQYWJmcXBOdVZEOTRsZk1PWUZWZHRtM2NRTS9jT0R6OUp5eG5ISm9l?=
 =?utf-8?B?ZVQ0UUJ3cFhuZFI1S0tpZ3hPcVhhcGxvRTkrR21tV1QwR1ZoT1pkWWQ0U2Ru?=
 =?utf-8?B?cnV1bUFieHRSS29BMVdSeldON01TNC9HanlQaEY4MVhCWkU5VTBTN2NwMzgy?=
 =?utf-8?B?QjhDRnhpOHRMZTNDbEVxL3V3Snd2bW42L2Z4d01XTFFjemJiVU1CTUlPOUV0?=
 =?utf-8?B?Y09DbnFNbWovcndSNFo4citvK1Zzam42RGthcDZyU3p5cGRwQm9VcnMvZ2Fp?=
 =?utf-8?B?eVV1OHp2YXE4MGYzSjlnS1BsTWhFVXhaTDhTQ1pBYTVCYUNjb0RqaU01TzFQ?=
 =?utf-8?Q?1+ybcpRJ2KMyJ?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-cd312.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: c37d7f87-91d3-406b-80f5-08df1cf231fb
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB5433.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2026 23:51:07.3675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8799

Hello,

I am reporting a playback regression in the snd-ctxfi driver affecting a
Creative Sound Blaster X-Fi Titanium HD. The card works perfectly on kernel
6.14 but produces no audible PCM playback on kernel 7.0.

HARDWARE
- Card:   Creative Sound Blaster X-Fi Titanium HD (model SB1270)
- Chip:   EMU20k2 / CA20K2
- PCI:    02:00.0 Audio device [0403]: Creative Labs EMU20k2
           [Sound Blaster X-Fi Titanium Series] [1102:000b] (rev 03)
- Driver: snd_ctxfi (with module option use_system_timer=1)
- System: ASUS P8H67-M PRO, Intel Core i5-2400, x86_64

SOFTWARE
- Distribution: Linux Mint 22.3 (Ubuntu 24.04 "noble" base)
- Sound server: PipeWire + WirePlumber
- WORKS:  kernel 6.14.0-37-generic  (Ubuntu HWE)
- BROKEN: kernel 7.0.0-31-generic and 7.0.0-34-generic (Ubuntu HWE 7.0)

SYMPTOM
On 7.0, PCM playback produces no audible output, through BOTH paths:

   (a) Direct ALSA, bypassing PipeWire:
         speaker-test -D plughw:CARD=XFi,DEV=0 -c 2 -t sine -f 440
       completes with exit code 0, but no sound is produced.

   (b) The normal PipeWire path (default sink = the X-Fi):
       also completely silent.

Details of the failure mode:
   - kernel 7.0.0-31: truncated / choppy fragments with use_system_timer=1,
     and total silence with use_system_timer=0.
   - kernel 7.0.0-34: total silence with use_system_timer=1.
   - No xrun and no error is logged; playback appears to stall silently.

On kernel 6.14.0-37, the exact same commands and configuration
(use_system_timer=1) produce clean, continuous audio.

RULED OUT (all verified while booted on the failing 7.0 kernel)
   - Card detection: OK. snd_ctxfi loads without error; `aplay -l` lists
     card "XFi [Creative X-Fi]" with all PCM devices (Front/WaveIn,
     Surround, Center/LFE, Side, IEC958 Non-audio).
   - Mixer / routing: Master 98%, PCM 100% (no playback mute), Front [on]
     100%, "Analog Output" = Speakers. PipeWire's default sink is the X-Fi
     at 94% and is not muted.
   - use_system_timer: both values tested (0 and 1), neither gives
     continuous sound on 7.0.

RELATION TO A KNOWN FIX
This appears to be DISTINCT from the EMU20k2 regression fixed by commit
e9418da50d9e ("ALSA: ctxfi: Limit PTP to a single page"): that issue only
affected PulseAudio while direct ALSA (speaker-test) kept working. Here,
direct ALSA is ALSO silent, so it looks like a different problem.

WHAT I CAN PROVIDE
These kernels are Ubuntu-packaged, not vanilla mainline. On request I can:
   - provide full dmesg from a 7.0 boot and `alsa-info.sh` output,
   - test a vanilla mainline 7.0.x / 7.1.x kernel,
   - test any candidate patch,
   - perform a git bisect between 6.14 and 7.0 if that would help.

Thank you for your time.

Dany Patoine

dany_patoine@hotmail.com

