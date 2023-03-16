Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0A320EE
	for <regressions@lists.linux.dev>; Thu, 16 Mar 2023 08:11:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 33BCC41F55
	for <regressions@lists.linux.dev>; Thu, 16 Mar 2023 08:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1678954272; bh=ynEG0gf06OTOI84nJg1tTZ9WazCuda1ZoNZ6js9jczM=;
	h=Date:From:To:Subject:In-Reply-To:References;
	b=gLksGxmMbX2JsleRKOTzry0lkDKOnUiMKfjNc9UdBBpJnoAHy2JaBZ9kCNJ5SuhHY
	 YpL0w3CGcPPor/b26T1Xte72Fo4RXiy9Cvx9i7D+q2m2fm/4dJ/QrR29OnnnNf6qhE
	 B7vTj+BA28XRN04yd3iXzuwrKoXWIi43WAMf1KQKa5u4ozLQH4Zyscxd/I2lSekNNT
	 a7dKxLiyupZDlMRD7rc3A39PEyxWjJOFr2cqrDNHGdxNHDohrGZVTUs5SzA+X1Az9S
	 aOxhriSvoebl/5U2LHH59vRqDcDaHzKbBrLyWdxmczN56vt9wrpJtgXlTVwkOWk8g6
	 NkO88mZNqeynA==
Date: Thu, 16 Mar 2023 17:11:05 +0900
From: "Hector Martin \"marcan\"" <marcan@marcan.st>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: =?US-ASCII?Q?Re=3A_=5Bregression=5D_Bug_217204_-_ASIX_?= =?US-ASCII?Q?AX88179_does_not_work_in_6=2EX_kernel?=
User-Agent: K-9 Mail for Android
In-Reply-To: <abbcc89b-008b-64ae-ed77-20607f9356a8@leemhuis.info>
References: <abbcc89b-008b-64ae-ed77-20607f9356a8@leemhuis.info>
Message-ID: <8A6B7785-4099-4BA8-8735-FDD3BB4D1407@marcan.st>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi, thanks for bringing this up=2E

On 2023=E5=B9=B43=E6=9C=8816=E6=97=A5 15:47:11 JST, "Linux regression trac=
king (Thorsten Leemhuis)" <regressions@leemhuis=2Einfo> wrote:
>Hi, Thorsten here, the Linux kernel's regression tracker=2E
>
>I noticed a regression report in bugzilla=2Ekernel=2Eorg; Hector, apparen=
tly
>it's caused by a commit of yours=2E
>
>As many (most?) kernel developer don't keep an eye on bugzilla, I
>decided to forward it by mail=2E Quoting from
>https://bugzilla=2Ekernel=2Eorg/show_bug=2Ecgi?id=3D217204 :
>
>>  petr=2Ebahula@artisys=2Eaero 2023-03-15 16:04:49 UTC
>>=20
>> After update from kernel 5=2E15=2E80 to 6=2E1=2E12 the USB ETH card ASI=
X AX88179 which is in USB-C dock is not accessible as eth1=2E
>>=20
>> **!!! IMPORTANT !!!
>> If the HW is booted with good kernel and then rebooted (without losing =
power) to bad kernel, it will still work=2E Only if it is booted with bad k=
ernel from cold state (total no power) then it will not work=2E**

Do you have CONFIG_USB_NET_CDC_NCM enabled? If not, enable it=2E Some of t=
hese devices have standard CDC modes that are intended to be driven by the =
class driver, not the device specific one=2E

If it still doesn't work, please post the output of `lsusb -vd 0b95:1970` =
so I can figure out what's going on=2E

>>=20
>> ```
>> Bisecting: 2 revisions left to test after this (roughly 2 steps)
>> [a41b17ff9dacd22f5f118ee53d82da0f3e52d5e3] dccp: put dccp_qpolicy_full(=
) and dccp_qpolicy_push() in the same lock
>> Bisecting: 0 revisions left to test after this (roughly 1 step)
>> [f56530dcdb0684406661ac9f1accf48319d07600] net: usb: make USB_RTL8153_E=
CM non user configurable
>> c67cc4315a8e605ec875bd3a1210a549e3562ddc is the first bad commit
>> commit c67cc4315a8e605ec875bd3a1210a549e3562ddc
>> Author: Hector Martin <marcan@marcan=2Est>
>> Date:   Sun Jul 31 16:22:09 2022 +0900
>>=20
>>     net: usb: ax88179_178a: Bind only to vendor-specific interface
>>    =20
>>     The Anker PowerExpand USB-C to Gigabit Ethernet adapter uses this
>>     chipset, but exposes CDC Ethernet configurations as well as the
>>     vendor specific one=2E This driver tries to bind by PID:VID
>>     unconditionally and ends up picking up the CDC configuration, which
>>     is supposed to be handled by the class driver=2E To make things eve=
n
>>     more confusing, it sees both of the CDC class interfaces and tries
>>     to bind twice, resulting in two broken Ethernet devices=2E
>>    =20
>>     Change all the ID matches to specifically match the vendor-specific
>>     interface=2E By default the device comes up in CDC mode and is boun=
d by
>>     that driver (which works fine); users may switch it to the vendor
>>     interface using sysfs to set bConfigurationValue, at which point th=
e
>>     device actually goes through a reconnect cycle and comes back as a
>>     vendor specific only device, and then this driver binds and works t=
oo=2E
>>    =20
>>     The affected device uses VID/PID 0b95:1790, but we might as well ch=
ange
>>     all of them for good measure, since there is no good reason for thi=
s
>>     driver to bind to standard CDC Ethernet interfaces=2E
>>    =20
>>     v3: Added VID/PID info to commit message
>>    =20
>>     Signed-off-by: Hector Martin <marcan@marcan=2Est>
>>     Link: https://lore=2Ekernel=2Eorg/r/20220731072209=2E45504-1-marcan=
@marcan=2Est
>>     Signed-off-by: Paolo Abeni <pabeni@redhat=2Ecom>
>>=20
>>  drivers/net/usb/ax88179_178a=2Ec | 26 +++++++++++++-------------
>>  1 file changed, 13 insertions(+), 13 deletions(-)
>> ```
>>=20
>> I've reverted changes made in the c67cc4315a8e605ec875bd3a1210a549e3562=
ddc commit and gentoo-sources-6=2E1=2E12 works correctly now=2E
>>=20
>> Patch which I use for new kernels now:
>> ```
>> pet@petkub ~ $  cat /etc/portage/patches/sys-kernel/gentoo-sources/ASIX=
_AX88179=2Epatch=20
>> --- a/drivers/net/usb/ax88179_178a=2Ec    2022-12-11 23:15:18=2E0000000=
00 +0100
>> +++ b/drivers/net/usb/ax88179_178a=2Ec    2023-02-23 10:04:47=2E5340603=
36 +0100
>> @@ -1844,7 +1844,8 @@
>>  static const struct usb_device_id products[] =3D {
>>  {
>>         /* ASIX AX88179 10/100/1000 */
>> -       USB_DEVICE_AND_INTERFACE_INFO(0x0b95, 0x1790, 0xff, 0xff, 0),
>> +       /*USB_DEVICE_AND_INTERFACE_INFO(0x0b95, 0x1790, 0xff, 0xff, 0),=
*/
>> +       USB_DEVICE(0x0b95, 0x1790),
>>         =2Edriver_info =3D (unsigned long)&ax88179_info,
>>  }, {
>>         /* ASIX AX88178A 10/100/1000 */
>> ```
>>=20
>> See also: https://bugs=2Egentoo=2Eorg/895720
>
>See the ticket for more details=2E
>
>
>[TLDR for the rest of this mail: I'm adding this report to the list of
>tracked Linux kernel regressions; the text you find below is based on a
>few templates paragraphs you might have encountered already in similar
>form=2E]
>
>BTW, let me use this mail to also add the report to the list of tracked
>regressions to ensure it's doesn't fall through the cracks:
>
>#regzbot introduced: c67cc4315a8e6
>https://bugzilla=2Ekernel=2Eorg/show_bug=2Ecgi?id=3D217204
>#regzbot title: net: drivers(usb): ASIX AX88179 stopped working
>#regzbot ignore-activity
>
>This isn't a regression? This issue or a fix for it are already
>discussed somewhere else? It was fixed already? You want to clarify when
>the regression started to happen? Or point out I got the title or
>something else totally wrong? Then just reply and tell me -- ideally
>while also telling regzbot about it, as explained by the page listed in
>the footer of this mail=2E
>
>Developers: When fixing the issue, remember to add 'Link:' tags pointing
>to the report (e=2Eg=2E the buzgzilla ticket and maybe this mail as well,=
 if
>this thread sees some discussion)=2E See page linked in footer for detail=
s=2E
>
>Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>--
>Everything you wanna know about Linux kernel regression tracking:
>https://linux-regtracking=2Eleemhuis=2Einfo/about/#tldr
>If I did something stupid, please tell me, as explained on that page=2E
>

--=20
Hector Martin "marcan" (marcan@marcan=2Est)
Public key: https://mrcn=2Est/pub
