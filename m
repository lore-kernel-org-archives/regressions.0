Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05olkn2094.outbound.protection.outlook.com [40.92.90.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFBC277CB8
	for <regressions@lists.linux.dev>; Sat, 30 Aug 2025 07:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.90.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756539894; cv=fail; b=CHoDqkrxodTRDFY6Nnt8wyTQic5flEyVt3NL/ulDehUrnvVbdBxh/ZufT4kK3ILS4nMbZzeMIaivSg/WIfVX3cZjndetgbypi1Is5G7KKWupab9xBABshX2KKDGWkYycpcqpJ8BSqms+80vEHj2+xY1jHcsCkAW73XlFT+nInqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756539894; c=relaxed/simple;
	bh=sPEuhBvDrGUoIFW0p+EuG8+Myk4HsIj35e+K3GV7BGg=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=S6lcQRUKlD5/yGFZxF81PbVNnnqDJAChtrCriIk1iLWjYUqXGFrx7uc3M8DIC8f1FE/7RXklONZ6zKP2IidKPZQkSWtnQ/ctYkr6geaPGRouPbYE8doaTFGSAa+Y13ftg88R05EJSnMQF7RkP7cuCHmjrGW2H5BXRv9/d1VoKVU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=g9xgKr0p; arc=fail smtp.client-ip=40.92.90.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="g9xgKr0p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c311oSi5muIUF3mnt1u2zrFS1EFJBf4X2sBkzVYAvDS8R/CPx3hjqTuWWi98Wy6Hreo2oKHQruFsrw1E65UZ+Fk5Twj9mwDW2BaT3TA11HonwRZk6qjWaEtRuDXdSYUK4LEgj26/d6US+c8lhl47ztgRNYZ1ApTDaq937SeH7CrvKIj8Sw8eL0IrsaB7Z1e+XSnn+CC4tjkmQfUDJlI5siDr/CjVbUy6T+8csiMmmBqElqPpICySEJMmWDUPmw0stL8h/H3vhM1p1+j413A3Gkm/jhkIn853XKXL2iuI9F7DqhK36uJyLx7K0O1KMHBHMsSAcRJft/A7XJuzpWuEJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Svac9N2LibWGCxewnyuZeUYI6XADMM90gVPtJj2K/A=;
 b=ZBb/uXicm1gDsD24EZTROs8vjU46aDn5BD9nvXTDc0HwLhnva08WYQtm4T0uZORrj7kLAFf9dLqz3ETf8CWxmF2BfGiVzdGVcLjvU72yilzR58h8ccZYV85rcjtHuCph9jLkjraMe7eJTC6ouu4jwB9D0EELzWw2L1nvPf9Olk+l+FoZRSKFB14v3geUPyZSa2vqvDLEW1Ouujr1fQaC5f00E7IMsLnOmnYSU0umU6L2j7uhuOhu5qh4kiPwXEHxf2T0SDWIGOv3demE4MLITzq7XmcsUcu3EOduQ2t0B2Cmr5EL6ldgxUWKu2KP8yJ2r+ZIruqKU18aZaoI1pYdBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Svac9N2LibWGCxewnyuZeUYI6XADMM90gVPtJj2K/A=;
 b=g9xgKr0pc12BxgArtSN7Y44aU6I4aAdfRMVqwWOtz9tu7TS+rbDnJ9EW4ToJKbXhkSeokGf8d8Crhx3Z3Dssz17m/rhBu0cl4UgvAl//ynma81vrn1URf2A5zauKXH6rNZwsWTfSECUrm7qh1x8pEquJfiNc8B3bsu2MMLHSnqnqAaHD8DVGNdhxzuFOu1BMtF34FaXfnjVDRe1pjbRUY/rwRz91qCwfHEVtGQFaMoK5qOKhdsiWgUMXkN/TcYg+Q+USH2w8eJRN21VQRnr/EyuzGm9GZw7UGUjBASbbU65eyK5aMHSH/4uQvS9VnAxNDrZP3c5lNu8rRvxc5MG4oA==
Received: from PA3P192MB2948.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:4d5::22)
 by GV1P192MB1881.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:5c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.21; Sat, 30 Aug
 2025 07:44:49 +0000
Received: from PA3P192MB2948.EURP192.PROD.OUTLOOK.COM
 ([fe80::397f:aaa6:40ef:b132]) by PA3P192MB2948.EURP192.PROD.OUTLOOK.COM
 ([fe80::397f:aaa6:40ef:b132%3]) with mapi id 15.20.9073.021; Sat, 30 Aug 2025
 07:44:49 +0000
From: labhras loughran <dr_labhras_loughran@hotmail.com>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
CC: "miriam.rachel.korenblit@intel.com" <miriam.rachel.korenblit@intel.com>
Subject: [REGRESSION] iwlwifi: Centrino Advanced-N 6230 causes kernel BUG in
 6.16-rc7 (works in 6.1)
Thread-Topic: [REGRESSION] iwlwifi: Centrino Advanced-N 6230 causes kernel BUG
 in 6.16-rc7 (works in 6.1)
Thread-Index: AQHcGYGQNnh73p2fgUCi34siOk8vxg==
Date: Sat, 30 Aug 2025 07:44:49 +0000
Message-ID:
 <PA3P192MB2948B29D87DBEEDFAE211DDEBA05A@PA3P192MB2948.EURP192.PROD.OUTLOOK.COM>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3P192MB2948:EE_|GV1P192MB1881:EE_
x-ms-office365-filtering-correlation-id: acc3b621-03d8-4703-4277-08dde7991902
x-microsoft-antispam:
 BCL:0;ARA:14566002|31061999003|461199028|15080799012|15030799006|8060799015|8062599012|19110799012|440099028|40105399003|3412199025|102099032|26104999006;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?3xBv4rSIPxgCtdA8Y9wZUafwoqNgGg3UaCol1GOjVzy5ckaCRq0ZeXod7r?=
 =?iso-8859-1?Q?lw2MUprqzn0yeBLXKALYIJMPq9BopNxChc8HoJnVDMLnYu/sD3rfpEVLS3?=
 =?iso-8859-1?Q?wFkjXllOk5CCGedenSKF1EhFgUUKZqmweLgFC91XTXeh2GF+hfiXkVoQoO?=
 =?iso-8859-1?Q?W+rSPUqPZh8r1alTOzj+G5EW2K9lbt49AOK3pdhGFiilU3EbsukCDR2kMP?=
 =?iso-8859-1?Q?RAc3VUpe9WMizuPCsAo4SM3hyTv/HrQ5Hz+v1Xs+HQuL6+UGJNmCtCk5PX?=
 =?iso-8859-1?Q?rpcVzGLSf6himdvGefdTGZr+aqJN8dxCeR1FGHQnQjmVOv+VqwGM7XYrBl?=
 =?iso-8859-1?Q?q3WKFHfX+9seT5pZrvP3/0mAPV4g6TDCzh0cdPVeQjO6irHkbiwe0/RFn6?=
 =?iso-8859-1?Q?IVHZwK6EeifYUxRWmQM3KaSNvRHT8oCEbKVOXLb0FQ/W8kvLFFzwlmxTql?=
 =?iso-8859-1?Q?OsBssI6TUudUL81KohbWyd3OBkoaYww5iQXbwiFTvcPqur2zpjEyb95E9H?=
 =?iso-8859-1?Q?IFkaQwec8B6Da4/WNLaUEqWmnTzHq6eSlStbOXuoKOp9H1xAxbVii3qZz0?=
 =?iso-8859-1?Q?FJmUJqM167SObo/3YuQLLFY2PLtT5ya+5F31QD5HmLaaNsxXavkeV56Lmr?=
 =?iso-8859-1?Q?q42p8VexL85axyNHZQRFZxSsqLoc5KJUUYOgLpPCklERBZYEegd7i1u9xJ?=
 =?iso-8859-1?Q?3dQ9IFyVdemPTywOVH6jsQGUQliODchu+233iD90ykNPyawYYyUqsyCb12?=
 =?iso-8859-1?Q?5r8hlZ/GaRpHJTng7oGqZRHiIHhV76Hl3drPBWUMSx1TFFv9yOWWIR3R+P?=
 =?iso-8859-1?Q?2YirbHjkOuIHEbaugoPseYxa5VrkxNHgQwv5kpQzsRnKIjzY0pIJAMhmSz?=
 =?iso-8859-1?Q?quRUG0DVxmI41R/jIvyOuxXVrS5EnJhYLHY57E7iIyUY5niPYds/dHF1wy?=
 =?iso-8859-1?Q?wdxqvA3krWbnV5zuoS6CopqGaoqXsEnGXwnd4p8XYAXiSQWOEDfLJUqZSJ?=
 =?iso-8859-1?Q?rgiBUfsLIP4pJIcKlp8YMUiId/RVz4FhVBDr2tNSKZB4t3x/qwKpdiiQIU?=
 =?iso-8859-1?Q?hNIHRG3SbnwWXliSeIVliY5xXQhWnpfa9amX16oLJMj3kw1hZODuHtsNPv?=
 =?iso-8859-1?Q?VuM147/8txSnkj4PRZvyBNkqZpzk/oAd3nClD62BYZv/y8Zxmx9kjHTyDG?=
 =?iso-8859-1?Q?Zx4Qq3XVf6USdmeneezDcySpY9OowIKjwVzGOVLLTkF5DJJ9JpRQPqszxK?=
 =?iso-8859-1?Q?9XgT46dlOFhVKHkQW4Qw=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?RFdhOBZ4/gQ+TauPlds4zF1hcWgg6K/6ML8xZ77KfdTnHIS1UiQtGMaCaM?=
 =?iso-8859-1?Q?34O4YsLfmhnd0O9svoeYpfhrXb7XsGPFgn2RqdhrL/ysWFzykWJfW0PeaZ?=
 =?iso-8859-1?Q?60c/fAOW8Zjjiz7fCNdxe5YiAYYGVyhvCh0+k7TbhJV32LCwfIA2lcHv0P?=
 =?iso-8859-1?Q?Rsz//M37J4Qn7IWRWbiLlOyFQ2O0v8Tp36sb7/RMpR6ZEzcC937VwhRERb?=
 =?iso-8859-1?Q?riDyDM/0yCN4cnnaBe+wom0hECtq9DJMBnRRH0cHz+pahqruXAyCBAqdlb?=
 =?iso-8859-1?Q?sysgTYdh2B+IH05VtSCAnAsytqa/MdJBk+GO4dDZV3s+v/iUXFinQklah5?=
 =?iso-8859-1?Q?NmMYmf5gL3W4lnf4lp4R8ZEVPbm0YU7SA/sRMkw8QukX4wxiLxtY5GXR8e?=
 =?iso-8859-1?Q?Y5cpu6812gJGMn1EiUPYGTbkUoXUITsfwpp7AF3dDzVUtwiHGwhoOY7KkP?=
 =?iso-8859-1?Q?teRO1QpJx0IUxjXDbMcTNcYHmQuen+j3PMxJoq5lzt81lBhxyjmDUiXP26?=
 =?iso-8859-1?Q?klZBD3lhn20ChWYlSem3MQGhPQkdULoqm60Qnj0aZTtGLR2FbrNTfMdgHc?=
 =?iso-8859-1?Q?VMXFCH4mdwBZngGtI+R+wHA37kg2sWu9ZDmjkqCak8FjAesxEJIEQTBGx6?=
 =?iso-8859-1?Q?49OP+DoPruYDJ2XoqdKbKDZRek3AXyCMkUceYpJjOTUD9u6FLt3gmquZpc?=
 =?iso-8859-1?Q?XDS3pnZKWMYzNz/08mIX/cONB+jHJ+ZumaUjeJhpbYsKiLlnf0Et4xMfZ7?=
 =?iso-8859-1?Q?0maQOSsDhVHrqNt83SgB5+Z/jAQ2dXVRb0UCkRPIlyMiH75F2jxcVHk/I2?=
 =?iso-8859-1?Q?V00sO7k+oZ7HoE0wSG/xWa5lFLxDPdNVVn7PvRZbFNHq3y3VMS70Joiv6x?=
 =?iso-8859-1?Q?NS3BH1dtdatR9SebjvqLU1QN4c3doDe/eR/ho2M9wPG/YGV5gX9FO8G/MU?=
 =?iso-8859-1?Q?sqUHsqDqKS60siwDC7P9I9i/jffxTFHbN4AhrgRVYZA1LCOSg6RSOZfYpP?=
 =?iso-8859-1?Q?TNsT0rpMHwXOi93DyQ0TB7h5KRgW5oSNDQHQ6zdfvzAEf1jnJXrahtOd6R?=
 =?iso-8859-1?Q?MrHIDjxoYQJFApHjkFbXp0GL0MF+vpAA1/+hIbF5fIF4iCAl05+N02L7BX?=
 =?iso-8859-1?Q?h5tVmtuSBNVfMbZT9yj543Hwdp/tdXGh81zw5mKLJVbK9OYI5l08wmOxFT?=
 =?iso-8859-1?Q?0CHERL9pD1X9RmWzBxudY9pKGZYwfOgoU3AuLHJBRspaLKvSuEMY+eLny8?=
 =?iso-8859-1?Q?Jb/tmTfJk/G+41X1jKHcuIVgEJiwmZjpwAPZKWrCs4HmNipPqI3dO/3v0V?=
 =?iso-8859-1?Q?LdvA1R8tzfzg/TC5xGvHJlJYX24ycU+qIi0RELfsrN6pLMVPmXi6EfJPib?=
 =?iso-8859-1?Q?5MEPdGdjqd?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-f44ed.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3P192MB2948.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: acc3b621-03d8-4703-4277-08dde7991902
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2025 07:44:49.1694
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P192MB1881

Hello=0A=
=0A=
My 12-year-old dell XPS 13  laptop freezes after a period of time, an hour =
or two. Particularly if it is coming out of sleep mode. =0A=
By freeze is meant =3D the keyboard and mouse not work. So only way to get =
back control is to power cycle.=0A=
=0A=
If you need me to, I can try and bisect the problem by trying a release int=
ermediate between the two below. =0A=
=0A=
Here is detailed info on versions and the log messages:=0A=
=0A=
// version info =0A=
XPS 13 L321X=0A=
chip model - Centrino advanced-n 6230. =0A=
kernels =0A=
failed kernel  /boot/vmlinuz-6.16.0-rc7+=0A=
working kernel  /boot/vmlinuz-6.1.0-31-amd64=0A=
wifi firmware is same version for both kernels =0A=
[    5.753606] iwlwifi 0000:02:00.0: loaded firmware version 18.168.6.1 600=
0g2b-6.ucode op_mode iwldvm=0A=
=0A=
// logs =0A=
root@labhras-Dell-System-XPS13:~# journalctl -b -1 -p err=0A=
Aug 20 12:39:09 labhras-Dell-System-XPS13 kernel: Error: Driver 'pcspkr' is=
 already registered, aborting...=0A=
Aug 20 12:39:10 labhras-Dell-System-XPS13 kernel: Bluetooth: hci0: unexpect=
ed event for opcode 0x0000=0A=
Aug 20 12:39:10 labhras-Dell-System-XPS13 bluetoothd[473]: src/plugin.c:plu=
gin_init() Failed to init vcp plugin=0A=
Aug 20 12:39:10 labhras-Dell-System-XPS13 bluetoothd[473]: src/plugin.c:plu=
gin_init() Failed to init mcp plugin=0A=
Aug 20 12:39:10 labhras-Dell-System-XPS13 bluetoothd[473]: src/plugin.c:plu=
gin_init() Failed to init bap plugin=0A=
Aug 20 12:39:11 labhras-Dell-System-XPS13 bluetoothd[473]: profiles/sap/ser=
ver.c:sap_server_register() Sap driver initialization failed.=0A=
Aug 20 12:39:11 labhras-Dell-System-XPS13 bluetoothd[473]: sap-server: Oper=
ation not permitted (1)=0A=
Aug 20 12:39:24 labhras-Dell-System-XPS13 gdm-password][1069]: gkr-pam: una=
ble to locate daemon control file=0A=
Aug 20 12:39:27 labhras-Dell-System-XPS13 systemd[1089]: Failed to start ap=
p-gnome-im\x2dlaunch-1475.scope - Application launched by gnome-s>=0A=
Aug 20 12:39:30 labhras-Dell-System-XPS13 gdm-launch-environment][593]: GLi=
b-GObject: g_object_unref: assertion 'G_IS_OBJECT (object)' failed=0A=
Aug 20 14:35:39 labhras-Dell-System-XPS13 kernel: Bluetooth: hci0: unexpect=
ed event for opcode 0x0000=0A=
Aug 20 14:35:39 labhras-Dell-System-XPS13 bluetoothd[473]: profiles/sap/ser=
ver.c:sap_server_register() Sap driver initialization failed.=0A=
Aug 20 14:35:39 labhras-Dell-System-XPS13 bluetoothd[473]: sap-server: Oper=
ation not permitted (1)=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Mic=
rocode SW error detected.  Restarting 0x2000000.=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Loa=
ded firmware version: 18.168.6.1 6000g2b-6.ucode=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Sta=
rt IWL Error Log Dump:=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Sta=
tus: 0x0000044C, count: 6=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0001030 | ADVANCED_SYSASSERT          =0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
000C5F0 | uPc=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
000C5E8 | branchlink1=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
000C5E8 | branchlink2=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
000DBEA | interruptlink1=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000000 | interruptlink2=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
01A0072 | data1=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000000 | data2=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000800 | line=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x9=
300A2E1 | beacon time=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x3=
3607D1F | tsf low=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0001E46 | tsf hi=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000B59 | time gp1=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
399D2A8 | time gp2=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000000 | time gp3=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x7=
54312A8 | uCode version=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
00000B0 | hw version=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0488700 | board version=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
101001C | hcmd=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0xA=
7F63004 | isr0=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x1=
1C1C000 | isr1=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000F1A | isr2=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
143F0C0 | isr3=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000000 | isr4=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x1=
0008112 | isr_pref=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
002443C | wait_event=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
00000C4 | l2p_control=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000B78 | l2p_duration=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000007 | l2p_mhvalid=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0101042 | l2p_addr_match=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000015 | lmpm_pmg_sel=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x1=
3011136 | timestamp=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
000F808 | flow_handler=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Sta=
rt IWL Event Log Dump: nothing in log=0A=
Aug 20 14:36:44 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Dev=
ice error - SW reset=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Mic=
rocode SW error detected.  Restarting 0x2000000.=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Loa=
ded firmware version: 18.168.6.1 6000g2b-6.ucode=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Sta=
rt IWL Error Log Dump:=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Sta=
tus: 0x0000044C, count: 6=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0001030 | ADVANCED_SYSASSERT          =0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
000C5F0 | uPc=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
000C5E8 | branchlink1=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
000C5E8 | branchlink2=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
000DBEA | interruptlink1=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000000 | interruptlink2=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
01A0072 | data1=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000000 | data2=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000800 | line=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x3=
2006F4C | beacon time=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x3=
ADF70B4 | tsf low=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0001E46 | tsf hi=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000B59 | time gp1=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
779DB1E | time gp2=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000000 | time gp3=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x7=
54312A8 | uCode version=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
00000B0 | hw version=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0488700 | board version=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
103001C | hcmd=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0xA=
7F63004 | isr0=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x1=
1C18000 | isr1=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000F1A | isr2=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
147F0C0 | isr3=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000000 | isr4=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x1=
0008112 | isr_pref=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
002443C | wait_event=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
00000C4 | l2p_control=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000B78 | l2p_duration=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000007 | l2p_mhvalid=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0101042 | l2p_addr_match=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000015 | lmpm_pmg_sel=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x1=
3011136 | timestamp=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
000C8D0 | flow_handler=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Sta=
rt IWL Event Log Dump: nothing in log=0A=
Aug 20 14:38:49 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Dev=
ice error - SW reset=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Mic=
rocode SW error detected.  Restarting 0x2000000.=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Loa=
ded firmware version: 18.168.6.1 6000g2b-6.ucode=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Sta=
rt IWL Error Log Dump:=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Sta=
tus: 0x0000044C, count: 6=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0001030 | ADVANCED_SYSASSERT          =0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
000C5F0 | uPc=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
000C5E8 | branchlink1=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
000C5E8 | branchlink2=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
000DBEA | interruptlink1=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000000 | interruptlink2=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
015005E | data1=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000000 | data2=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000800 | line=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x7=
C0031E2 | beacon time=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x6=
36CEE1E | tsf low=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0001E46 | tsf hi=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000B59 | time gp1=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x2=
88872A9 | time gp2=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000000 | time gp3=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x7=
54312A8 | uCode version=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
00000B0 | hw version=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0488700 | board version=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
102001C | hcmd=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0xA=
7F63004 | isr0=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x1=
1C1E000 | isr1=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000F1A | isr2=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
147FCC1 | isr3=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000000 | isr4=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x1=
0008112 | isr_pref=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0026D36 | wait_event=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
00000C4 | l2p_control=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000B78 | l2p_duration=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000007 | l2p_mhvalid=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0101042 | l2p_addr_match=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000015 | lmpm_pmg_sel=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x1=
3011136 | timestamp=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0002830 | flow_handler=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Sta=
rt IWL Event Log Dump: nothing in log=0A=
Aug 20 14:50:10 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Dev=
ice error - SW reset=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Mic=
rocode SW error detected.  Restarting 0x2000000.=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Loa=
ded firmware version: 18.168.6.1 6000g2b-6.ucode=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Sta=
rt IWL Error Log Dump:=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Sta=
tus: 0x0000044C, count: 6=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0001030 | ADVANCED_SYSASSERT          =0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
000C5F0 | uPc=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
000C5E8 | branchlink1=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
000C5E8 | branchlink2=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
000DBEA | interruptlink1=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000000 | interruptlink2=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
015005E | data1=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000000 | data2=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000800 | line=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
F40E0E7 | beacon time=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x6=
3D1CF19 | tsf low=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0001E46 | tsf hi=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000B5A | time gp1=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
05FC4C3 | time gp2=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000000 | time gp3=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x7=
54312A8 | uCode version=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
00000B0 | hw version=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0488700 | board version=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
102001C | hcmd=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0xA=
7F63006 | isr0=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x1=
1818000 | isr1=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000E1A | isr2=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x8=
143F0C1 | isr3=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000000 | isr4=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x1=
0808112 | isr_pref=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0026D36 | wait_event=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
00000C4 | l2p_control=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000B78 | l2p_duration=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000007 | l2p_mhvalid=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0101042 | l2p_addr_match=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000015 | lmpm_pmg_sel=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x1=
3011136 | timestamp=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000010 | flow_handler=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Sta=
rt IWL Event Log Dump: nothing in log=0A=
Aug 20 14:50:16 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Dev=
ice error - SW reset=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Mic=
rocode SW error detected.  Restarting 0x2000000.=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Loa=
ded firmware version: 18.168.6.1 6000g2b-6.ucode=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Sta=
rt IWL Error Log Dump:=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Sta=
tus: 0x0000044C, count: 6=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0001030 | ADVANCED_SYSASSERT          =0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
000C5F0 | uPc=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
000C5E8 | branchlink1=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
000C5E8 | branchlink2=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
000DBEA | interruptlink1=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000000 | interruptlink2=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
015005E | data1=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000000 | data2=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000800 | line=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
100F3F3 | beacon time=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x6=
3DE3C0D | tsf low=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0001E46 | tsf hi=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000B32 | time gp1=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0074814 | time gp2=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000000 | time gp3=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x7=
54312A8 | uCode version=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
00000B0 | hw version=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0488700 | board version=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
100001C | hcmd=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0xA=
7F63006 | isr0=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
1818000 | isr1=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000E1A | isr2=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
146B0C1 | isr3=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000000 | isr4=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x1=
0008112 | isr_pref=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0026D36 | wait_event=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
00000C4 | l2p_control=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000B50 | l2p_duration=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000007 | l2p_mhvalid=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0101042 | l2p_addr_match=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
0000015 | lmpm_pmg_sel=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x1=
3011136 | timestamp=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: 0x0=
000B0C0 | flow_handler=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Sta=
rt IWL Event Log Dump: nothing in log=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Dev=
ice error - reprobe!=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Q: =
2, freed 0=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Com=
mand REPLY_LEDS_CMD failed: FW Error=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Com=
mand REPLY_LEDS_CMD failed: FW Error=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Com=
mand REPLY_TXFIFO_FLUSH failed: FW Error=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: flu=
sh request fail=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Com=
mand REPLY_ADD_STA failed: FW Error=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Com=
mand REPLY_ADD_STA failed: FW Error=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Com=
mand REPLY_ADD_STA failed: FW Error=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Com=
mand REPLY_ADD_STA failed: FW Error=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: wlp2s0: failed to remove =
key (0, 3c:52:a1:94:cd:45) from hardware (-5)=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Com=
mand REPLY_QOS_PARAM failed: FW Error=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Fai=
led to update QoS=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Com=
mand REPLY_RXON failed: FW Error=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Err=
or clearing ASSOC_MSK on BSS (-5)=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Com=
mand REPLY_RXON failed: FW Error=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Err=
or clearing ASSOC_MSK on BSS (-5)=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Com=
mand REPLY_RXON failed: FW Error=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Err=
or clearing ASSOC_MSK on BSS (-5)=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Com=
mand REPLY_RXON failed: FW Error=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Err=
or clearing ASSOC_MSK on BSS (-5)=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Com=
mand REPLY_ADD_STA failed: FW Error=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: wlp2s0: failed to remove =
key (1, ff:ff:ff:ff:ff:ff) from hardware (-5)=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Com=
mand REPLY_RXON failed: FW Error=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Err=
or clearing ASSOC_MSK on BSS (-5)=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: iwlwifi 0000:02:00.0: Fai=
ling on timeout while stopping DMA channel 8 [0x07fd0001]=0A=
Aug 20 14:50:17 labhras-Dell-System-XPS13 kernel: kernel BUG at mm/slub.c:5=
46=0A=
=0A=
