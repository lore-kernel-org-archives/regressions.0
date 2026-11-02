Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.37
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793623658;
	b=U46AG0l/s4CgUKE8ahiRC1vWb644S6EXUUlZ0KUu75waMr/LDpuVF/B0WvgBIg3Xv4hX
	 SmHpYW9mKCZvHgrv9HDmwwLSXTVzu22Na5yaE+hDI1gF/6k2xqO8c/3OiuEvjMVmXt74B
	 Ghbt7yQkrqeT3lAWShKfWrTzIOmor6pJzG73ndvkGHo8zlILZUm0AY8h8lqOShMrNOGmB
	 K7ChvHhm3HlTR01hwFIbpbGDT20v7CktmKx8V2dx8VqnhmIW5Ue9LI9eYN55t4Rpji6Jv
	 +BQlFu0IJwmrQSfhzIirH+Ic9yvshHRJ32JsLBfhrkasGde8DzL+SplqXBfuRR88fjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623658;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:From:Subject:To:Content-Language:Cc:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:
	 X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=yM3WLZg0hL7g9JJ4eP+0oX7v6Qa/JKWsu5NCE5imFWk=;
	b=QwNW3Gz1jbuGoSBsRYwvnmoinIt0luiSPtHNewfaz5jTuYx+LjGebPdf/u8/4PDnwtki
	 ctiIkbpVd+b4X5sO+m/pnMfA4LDxhKDrsd1mOC/F2K/tWJPz+gQushJZvWNYLwuxkR/BQ
	 25zDR43je1IM5z2RT45yq/V6ZI/qc4GmzXv3LBkMDYhpM1nq2Wq1/qS0jhBYfsjmx1unA
	 NuW9i1WD8JPpKtHPOgKoIIg77TLIjJrJTota5xm8EUkgzeC+8bF7PhIFaS+/xv2dI/TZg
	 dwC60u0f1nOsTF73BXqeBeW/gAJ2o7+oMsAhHa52wZWtx+wgtkTrGfRnZiXKjEuLDzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.kr;
	spf=pass smtp.mailfrom=outlook.kr;
	dkim=pass header.d=OUTLOOK.KR header.i=@OUTLOOK.KR header.a=rsa-sha256 header.s=selector1 header.b=PRxdTg7l;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.43.37
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazolkn19011037.outbound.protection.outlook.com [52.103.43.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1E0606A32E
	for <regressions@lists.linux.dev>; Mon,  2 Nov 2026 12:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA1E0606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=OUTLOOK.KR header.i=@OUTLOOK.KR header.a=rsa-sha256 header.s=selector1 header.b=PRxdTg7l
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=phGOCmWjDRd9XRXDYdkswjSMUvS6bUtJtN5oXQARN5Ukvr9d3wcWAJZ4c+jf9Cimqm39hNHg9WUVDMWeMRoJGdunnmjUS0J0k4tDnuxlaVoC9/ZAZ9R+1yFKlGSBjNjjh9q0QsGEoxxbFzkbeQGFJsDXK2IRVWcZTufu5HvsJ8/YgX7qW1DsAobYC4wda4blt4hUaQXBUNJoZ7lmDMnpMiwag3q1Qu499dNO54w+RRKojqVoXfOfkyVfkyhdGeADOCbGn/n1SY2sxkLYjW7MauyXensPnfO0r6borgg3eiKOJEAH90x/CxIcyhDUq0YxNyOvoKROH5hUbhf7OdhQeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yM3WLZg0hL7g9JJ4eP+0oX7v6Qa/JKWsu5NCE5imFWk=;
 b=S+jw2aJ2lze/vxPE8BqlSiQZIL84Nc/M5CWI3jjRl5KVB8C7Oey1YiciT8vFEDO5vui8YWL/vcGj4c2/LKEmJ9fXOAQ0F6Ae+sPi5sTRz6MxylV/affq2stsPHNwWmDl46v9bpUVv1xtEkUVi8lB/r5W22ZvJubPKHew27gXROYUNXcCIf9uf76RObH8BJjUV5/fomy6T1yKcoJGqiP4sjK0XXpVmkOFjqN0A+MrB4cq/LZErQtf/ViHqaG16ayBAQ0+nzYuDKK1z78HwUOcJI2lylDj5gdoMV42WtKb+EcsBo9FkibyJ+ccE7rqxZkEW+hbTx99KcqO/52gl+Wcsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.KR;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yM3WLZg0hL7g9JJ4eP+0oX7v6Qa/JKWsu5NCE5imFWk=;
 b=PRxdTg7l5S90NuZNWmy3poS0Kr8AYbX+23Ryvjr4+UiGhf3nyKNrWxY5ftCJfvpihlT3L36ECYvCtl9t9WF+VMKAz9OgSWqQ09Hp2I8hbzGYU7hJ8FfJUIF0C0Z+1abudkuCJiT/zOrJ0+PilqVdnX45B+tI/1KfApJ3YN4GUNgvNDd8U55ExPBOT9KCFVZUr53rd1bsYeFra0c68CeOs8U+BUSH72YqHQkQpHFCidg0TySBjlC0qZQ96KYh0uVI6DzMU8VGPs7f88JG8LYt9mqLK7aH0FnSbgyJMLi/NUhP7vriyt3hWayLNvlONgz3POR7Ocdl/Apfq6kiX9TtPw==
Received: from OS7PR01MB13914.jpnprd01.prod.outlook.com
 (2603:1096:604:36b::13) by TYYPR01MB12708.jpnprd01.prod.outlook.com
 (2603:1096:405:15f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 12:47:32 +0000
Received: from OS7PR01MB13914.jpnprd01.prod.outlook.com
 ([fe80::641e:83cf:743b:85bc]) by OS7PR01MB13914.jpnprd01.prod.outlook.com
 ([fe80::641e:83cf:743b:85bc%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 12:47:32 +0000
Message-ID:
 <OS7PR01MB1391484D564CF93DFBB4C1DCE966A2@OS7PR01MB13914.jpnprd01.prod.outlook.com>
Date: Mon, 2 Nov 2026 21:47:28 +0900
User-Agent: Mozilla Thunderbird
From: Eric Kim <seohyun.kim@outlook.kr>
Subject: [REGRESSION] drm/nouveau: NULL pointer dereference in
 drm_atomic_commit during GP107 initialization
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Language: en-US
Cc: lyude@redhat.com, dakr@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0114.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c9::12) To OS7PR01MB13914.jpnprd01.prod.outlook.com
 (2603:1096:604:36b::13)
X-Microsoft-Original-Message-ID:
 <356c308a-339b-4da0-97b1-f4d7812068c7@outlook.kr>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS7PR01MB13914:EE_|TYYPR01MB12708:EE_
X-MS-Office365-Filtering-Correlation-Id: e24ce84d-15a6-42c9-cc0a-08df38df75f4
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|25010399006|41001999006|8022599003|6090799003|5072599009|15080799012|23021999003|8060799015|12121999013|25031999004|19110799012|3071699003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aGtLZ2NFUlNxRGdjVVdMWDBONUhMVFRkVnJZVUM1RkV3RTBlRTZyRHBnSUtG?=
 =?utf-8?B?WThXY25UWmhkUXM5RWs2RWFPVk9KclUrSXpncG1sZ3FLSzZkNnJkWmdOWjhT?=
 =?utf-8?B?QVZ4N1QxSnhldTdjazJpNU5pNmw3eGZ6cWs2RzIzUncrMDI2WVhCVjE5dnNq?=
 =?utf-8?B?MVJXQk9vQ2RwS2F6S0draTlPRlYzNWxsaFVkRUx2RWZpRFh5NFg0YVB1Mmdi?=
 =?utf-8?B?YUczT09XcXE0SmdJZVBreU1NaVpNZjFvalBEc08xcStaMDlxUTlCNHYrZ2R6?=
 =?utf-8?B?YnhLWk9lRFhKL0RBSU1aNG0vbGh6YmhCemY2d0g4L1F3TFpzeU1BaWZHSFdM?=
 =?utf-8?B?bnhEUnFXUm5FWnYwZE1EMkdxdngzeDRDWnNmTmJTWFcrdWNrY3hGdnIxcFJo?=
 =?utf-8?B?QmFJMzVQTzZEZTVLbnRBOHFzNVoyZmJ6c1BycXFodmtCd1FISVVXeGp3VGJi?=
 =?utf-8?B?ZnpzU1BCMXRwNUc2TUhPOC9lQjJTVGo4V2hjeUlUUDBaTk9sZG5IZ0dvb1Ny?=
 =?utf-8?B?eXV6STBmalVoNEdOa2xoVUVSZmJkVzIwT0tiQ0JkUDlqbEtyaUNuSmZJMjFN?=
 =?utf-8?B?cHY2a29TUGM4SkwrU1g5VVNFUmlwN1VSS1pqUFJGUVgwOEczT2thQ1lCZzJk?=
 =?utf-8?B?MEUxT0pUajA1SWFTQU5aeEhMOFh4UjJpUGdIK3pCaDg4V1QySGlPOHBHdUU3?=
 =?utf-8?B?ODlxTlJCSzA4Nnh6MmtmNHVSZXJpSXVLVVIvTDJQVXZCVEVZQ25zZlJFaHlJ?=
 =?utf-8?B?SlJMMHBITnYvc2o5NFQ5WHU2VC9GUTd1S0QvRXZ1Y2N6cHdHNGZPMW04TUhY?=
 =?utf-8?B?WDNhbjhOOVFJam5vZmsrMFJLUFY3NjlpUVB1dUtjWVNjdXc0VUhWNlBoM1lL?=
 =?utf-8?B?NFBxT3BkOHpyR0ZQRWJEcHNBQ2pTM3hQUys3UmloeEtjQ28rNVNHbHh6KzFF?=
 =?utf-8?B?OG1nWnpUWmpVSWp6ZzVWZ0g3MVh2UE5PWm85M2dJUDBIamtZdzk1N2JkM0Rw?=
 =?utf-8?B?MWlEeWtjdmtwTW9iaTh4a0Q4ZkRpelFrUUlRVElZckN2RnhuVkt4dExrNEo4?=
 =?utf-8?B?bmx5UDR2UW9xTUdCWHY2K1JoMVFsejV5VW11ZzhtT0QyeDBkaEdHR3dDcFpI?=
 =?utf-8?B?ek0wM1RLUS8xTGNSZlV4dm8wZnV2d21tMlkwajVtR1ZxN1NmL3puQ21ZKzEy?=
 =?utf-8?B?NmVtbXNjZzl2ZjNIVHFUKzRWV3VNcGxjT1FsWWV3ZTlCYWFxQWlGekY3OVMr?=
 =?utf-8?B?OWlyaWxsNFVBTmFLNE1halZuMWR0OFd1UHg0b2dnakJRaERDR2V4TDczaXFY?=
 =?utf-8?B?c1JlQnB6bk93WnRoWkZ3TURLODdWMjBUWkRNdFptNUpZemJzb1NQWkxVeC9m?=
 =?utf-8?B?ZFRsU2o0OC84Z2E3ZnhOOHh3MWhHeGpScGZId3ZSKzBWbUExY1BnVWJac0Z5?=
 =?utf-8?Q?vn/feIH4?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UmdkRmNHUUhpT3BNZXFtVFhPY2dhdUFIV3A4NGdlbEs1ZHYyYkJVL3k0VzBm?=
 =?utf-8?B?UFZsaEluaWc5THhzTlgxY1RhUlFHWW15VldFOTloWndoUXA3Ym95bVpqamtB?=
 =?utf-8?B?TkFKenFpdFdncThFYUdINXB0Zk14VWNWZzhBcnBSK2dNYWpiOEhhTnBQaDR6?=
 =?utf-8?B?UEZrdEhjbEQvODlDVU9GZVFMMktYMExJUTBYQmxucUJMaURBTnkwV1BXWjEv?=
 =?utf-8?B?bzRxYzRZc1V1LzNQZ09BazFLZEF6QnlnSVB0dnR5MnQ1S2tFaWt5QXVVbkZt?=
 =?utf-8?B?VFpualYxWmI5MXJqMllzdzIvWHFWVUtvc1l2ZHB3dU1Oc3BKMUQrVUMxclNu?=
 =?utf-8?B?SXNCOXphUzR5WkJXeFg3UXQ0a2ptMHNiUVdsbGhCM1V5ajFKdHpybWVJVFhx?=
 =?utf-8?B?cE01cEt4NnNiL0FhSGxIZ0VVMEk3c2pOUFdLL3p1QTZOUlhyTTNjeFArN0pY?=
 =?utf-8?B?dTdwQ0t1QXQvbE03MWYwdDBqNW1LbEJhN0NoL2Y0Z1lRci85L2VTNDFxT3lq?=
 =?utf-8?B?My9GZ2ZNTGdqN25PcUF0ZkN0L3JFV2FvbEY4aU9uV0l5eUV2eERGR3Q0MmVH?=
 =?utf-8?B?eFZrczh2dXlYUG14VXZhem5tbXZqeU9JYlZONHRmZ2ZsQkN4WWFWL011VVd4?=
 =?utf-8?B?UW5tM0NWeTFlQ3NoVTgxSVhWUWZSeFBjME9ESm1nOHErbmlxdEpZeExEYkNm?=
 =?utf-8?B?UTNSMFcxTnF0OXBqL1dxKy9GRURtNUdtM1ZuV3RieURoajZ3YkNncWppRHVY?=
 =?utf-8?B?SlFKWlNQU0NoOHRFek5NUlNYUGRMN293eUo4MHJEcXE3eCtIa1ZwNW5uS2FS?=
 =?utf-8?B?N3c1bDBad1FsOGRFRUtUV2ZiRWNOU1ZqbjBxSm9FaTExV010eHVvejJFSFR4?=
 =?utf-8?B?ZFJTUFNJVnhrUG1GbHlVSUwycjNqd1JCbjEvN0JiSElqZnNHSXVXa1g2TlZ0?=
 =?utf-8?B?eWFDUDVEUE5WOXo4Lyt6UnNTMVhEZUg4aDkxZmtYTHlPaXkzMkdTeWowdE5l?=
 =?utf-8?B?NmNmcjZrbG9iTW1QOVAyWms1WjVXOWRrb3lXNDFvQnFMajNteXpUd0pBWE9G?=
 =?utf-8?B?cThtWjlMaFV4UWx2cTZlU0hrM1R5RUZnb3pXVXR0UVBCNmh2d3BNV3JOUVVa?=
 =?utf-8?B?Tm5vYU12eG0wN0o2N2hUYWdpb0ZwQnUzWm1VZXVPL1Fac0h1RDZMSUsxdFcv?=
 =?utf-8?B?NW1BaGNXb1MvRGVON254bUtvRmlLSHFyekUxUWVaZnN0bjNiTnZ0YlBtcG9o?=
 =?utf-8?B?anZCNjMvZGlWbjFtZDJHOVVCZWFwQjQ4NlFoamRGQ3N6UGl6QVlpWStVTWM3?=
 =?utf-8?B?aU9nemI5akJoNGQxeGFxRmhvVTVjMnlVTDY1UGxaaUoxSEdxRmtOMmk4SVN1?=
 =?utf-8?B?UUlQTTZyQy9PTE10V2FkV2xOOTV6M1pjWUp1N2dZVjJ2MUtNOHhleHRJRmNs?=
 =?utf-8?B?aExmM3c1dEE5dzgzZW1kNFVGQmlob0lTYTZ1WHpNaGdEN0Z5elI3MHV1VC9D?=
 =?utf-8?B?Y3hMM3FYQ0pwcU1HbkxyUG9GcmRvczkzc3gvZ29jRC9TU0dPemovK3JVTUFv?=
 =?utf-8?B?aDJ5NzBzZWxLV21MdFNuaFNIUFRoanFWWnowNzNTcE0rUkk2RDVrN2RIN1Q5?=
 =?utf-8?B?M3FGdkdEQTFwTjBCSzBQUmdQS1djUTJUeXFFZFNCYXloeDExamRweDRMT3dz?=
 =?utf-8?B?TFpHcS8rdkpKejhMYmFRT0pVV2ZqOGU2K01uUHFjaEp4OTdPdkVteG5MT25i?=
 =?utf-8?B?UXR4RWlGNDFGUGRRb1piTVZJQTkybHRSQ3ZFNXhxNkoxWHg1WmpjZFpDdVQr?=
 =?utf-8?B?NmFJMGZuZ3ZBc255TkFtRUNnRnFYM1FpYUNmczZSTTNhc1pwa1JsM2ZQUWVD?=
 =?utf-8?Q?FG3bUaKt4NKLf?=
X-OriginatorOrg: sct-15-20-9412-3-msonline-outlook-b83fc.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: e24ce84d-15a6-42c9-cc0a-08df38df75f4
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB13914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 12:47:32.1835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12708

Hi,

On my laptop, which has GP107 GPU with intel graphics and uses nouveau 
driver, booting kernels after commit 
2652aca460dcfdd0d169bbfa358aa15804dc736b causes NULL pointer dereference 
at initialization.

[   17.556328] [drm] Initialized nouveau 1.4.3 for 0000:01:00.0 on minor 0
[   17.556364] nouveau 0000:01:00.0: [drm] No compatible format found
[   17.556792] nouveau 0000:01:00.0: [drm] Cannot find any crtc or sizes
[   17.557237] BUG: kernel NULL pointer dereference, address: 
0000000000000000
[   17.583880] #PF: supervisor instruction fetch in kernel mode
[   17.598078] #PF: error_code(0x0010) - not-present page
[   17.601475] PGD 0 P4D 0 [   17.608839] Oops: Oops: 0010 [#1] SMP PTI
[   17.608914] CPU: 6 UID: 0 PID: 1443 Comm: modprobe Not tainted 7.3.0+ 
#1 PREEMPT(lazy) [   17.608954] Hardware name: SAMSUNG ELECTRONICS CO., 
LTD. 800G5M/800G5W/NT800G5M-X78W, BIOS P11RDV.075.170829.XJ 08/29/2017
[   17.608990] RIP: 0010:0x0
[   17.609090] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[   17.610081] RSP: 0018:ffffca4d86537828 EFLAGS: 00010246
[   17.610135] RAX: 0000000000000000 RBX: ffff89b74dcf1180 RCX: 
ffffffffa97d8091
[   17.610172] RDX: 0000000000000000 RSI: ffff89b74dcf1180 RDI: 
ffff89b74c466800
[   17.610207] RBP: ffff89b74c466800 R08: ffff89b74dcf1180 R09: 
0000000000000000
[   17.610245] R10: 0000000000000010 R11: ffffffffa9b65410 R12: 
ffff89b74c466800
[   17.610283] R13: 0000000000000001 R14: ffff89b74c466800 R15: 
ffff89b77f1a2400
[   17.610320] FS:  00007fc4a888d780(0000) GS:ffff89bac4364000(0000) 
knlGS:0000000000000000
[   17.610357] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   17.610414] CR2: ffffffffffffffd6 CR3: 0000000144b20004 CR4: 
00000000003726f0
[   17.610448] Call Trace:
[   17.610483]  <TASK>
[   17.610521]  drm_atomic_commit+0xb1/0xe0
[   17.610558]  ? __pfx___drm_printfn_info+0x10/0x10
[   17.610590]  drm_client_modeset_commit_atomic+0x25c/0x2d0
[   17.610618]  drm_client_modeset_commit_locked+0x5a/0x170
[   17.610647]  ? drm_master_internal_acquire+0x1d/0x40
[   17.610675]  drm_client_modeset_commit+0x25/0x40
[   17.610700]  drm_fb_helper_single_fb_probe+0x1aa/0x1c0
[   17.610729]  __drm_fb_helper_initial_config_and_unlock+0xa8/0x1b0
[   17.610754]  drm_fbdev_client_hotplug+0x79/0xb0
[   17.610782]  ? drm_client_init+0x13e/0x180
[   17.610811]  drm_client_register+0x79/0xc0
[   17.610839]  drm_fbdev_client_setup+0xc9/0x1c0
[   17.610867]  drm_client_setup+0x6a/0x90
[   17.610893]  nouveau_drm_probe+0x15b/0x1e0 [nouveau]
[   17.610922]  local_pci_probe+0x4a/0x90
[   17.610951]  ? cpu_hotplug_disable+0x15/0x30
[   17.610977]  pci_call_probe+0x5a/0x1a0
[   17.611009]  pci_device_probe+0xdb/0x180
[   17.611060]  call_driver_probe+0x23/0x100
[   17.611104]  ? driver_sysfs_add+0x55/0xc0
[   17.611137]  really_probe+0xd7/0x2d0
[   17.611171]  ? __pm_runtime_resume+0x50/0x60
[   17.611220]  __driver_probe_device+0x9c/0x1b0
[   17.611261]  driver_probe_device+0x1f/0x80
[   17.611297]  ? __pfx___driver_attach+0x10/0x10
[   17.611335]  __driver_attach+0xcc/0x200
[   17.611373]  ? __pfx___driver_attach+0x10/0x10
[   17.611409]  bus_for_each_dev+0x97/0x100
[   17.611451]  bus_add_driver+0x1d0/0x280
[   17.611493]  ? __pfx_init_module+0x10/0x10 [nouveau]
[   17.611530]  ? __pfx_init_module+0x10/0x10 [nouveau]
[   17.611567]  driver_register+0x75/0xe0
[   17.611602]  nouveau_drm_init+0x60/0xff0 [nouveau]
[   17.611633]  do_one_initcall+0x89/0x3d0
[   17.611667]  do_init_module+0x8e/0x290
[   17.611703]  init_module_from_file+0xc8/0x180
[   17.611736]  idempotent_init_module+0x23e/0x360
[   17.611773]  __x64_sys_finit_module+0x7f/0x110
[   17.611805]  do_syscall_64+0xbe/0x470
[   17.611844]  ? do_syscall_64+0x37/0x470
[   17.611883]  entry_SYSCALL_64_after_hwframe+0x76/0x7e

It boots without this problem when booting with nouveau.atomic=0
kernel parameter.

My guess is that atomic_(commit|check) operation is not present in 
nouveau_mode_config_funcs, and commit
2652aca460dcfdd0d169bbfa358aa15804dc736b enabled
atomic modesetting by default for NV50+ gpus caused
the problem.

Also, drm_helper_(commit|check) was added to nouveau_mode_config_funcs
at commit 604826acb3f53c6648a7ee99a3914ead680ab7fb, but it was
reverted at commit 6c65db809796717f0a96cf22f80405dbc1a31a4b due to
unreliability.

I hope this problem can be fixed at one of the next releases.

Thanks,
Eric Kim

#regzbot introduced: 2652aca460dc
