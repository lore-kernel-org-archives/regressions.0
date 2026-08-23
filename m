Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360D738E8BB
	for <regressions@lists.linux.dev>; Sun, 23 Aug 2026 11:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787485509; cv=pass; b=Ovlt9Q5U39PPvgbP7mIPKa2hGpjr3yglTl+E6pWUlDbaWMeHl3MJgKLYV1b0KufKSD31e+RVGIkbS4XfSXdlWDy3NZp4hy5COAU/QUG0ihqgyMa1pmZqb6tTATxVdfxzJACFC1qeED6bUECMVyq3xQtHUN42WR3/CvOgE7oNN1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787485509; c=relaxed/simple;
	bh=L3zRUhfKWIDxeDi1dPCc0Ayy7qAEWPOx8Eml9mT11e4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ioip0EBcRLRvXQ5iwZSYb2SOcK2xcdboQTCkZ9/0eA6dEGMT2dtf/X4QNO2PHQ6DVkheOph/I7hlx4jvLrGl/SKdrDrBh3ZAhkv0F0+p5GKsxjbBPykzkgAX/OGAbChKnK/hThUz77WAfFK0SiJlXYgpRxs+Ogzn37FsPCytpms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQJbzsA5; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQJbzsA5"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b2a3166398so2601190e87.3
        for <regressions@lists.linux.dev>; Sun, 23 Aug 2026 04:45:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787485505; cv=none;
        d=google.com; s=arc-20260327;
        b=YYkdE17kLYuvzNjTfFOyuh3I+Q29aEYdjZOQbUTEO0ZAFEgmvQoULQJX/o2N17leEZ
         k/XU13dgKOo32Nm1t0KjZUyHJm+xWWGvYLw9fNx6YZRp7OJ7OaAUBn2nNGoalFR0Q6rN
         ENNhki3Vh+s9zHNztvBNho/pFNjZ6oQZ/ym2BR0ym3mq8x4nXkoRIhXQAhmxA/Sn9pQq
         nuvruQ58DNwasKX+1NmZuAToXwxbLtVgYBFUsjO5gdJFWxTe8VastcgtrY6DVVkNUyoI
         wL+2BVgJ/5wPUiUPJUJG7LCnt+P+f8fqGJUvcLjUH+UBAG30xPa9764OA+VKeEVEx37e
         5GRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lLWUar7CbdYKGZb3FGkxL0X2Mwo3sxR4Wu68UThs0tE=;
        fh=DyMnLWk8pOQ9iWCQmaP9b+hgIs9It4fviJoHtDqaqmA=;
        b=rbCOyVEr32/gpn1fgR00lrxxTXtmpEVYr+wZZCcoM8BdzmChG2aN5Dk7NfiAOgKOX9
         XW8l2/dF8hxIKMscQEgyJ7DiA4RdB8QxvfWlyY/WB2/JtVjeRLHT01757JBd+91Qh1Gb
         S2dAE0Ow/7hbUrGxuZYm1BwWRDF91n/XhQN7DLnti1B8m6Oc47v7Z7o+/jc//1bhDYm3
         EhNpKtsTErT6THENn1S4nAugXKVh9P4Dr8ApTe7yEW1YXwt57cq2KJRWz25/7Af4VGFv
         iBTxdZ+t+nQ3vVJiRYzWyUtaEOVcovxoaIvsL+ml2TrKZFCMnXqkwE4ai2MxEwLpJSk8
         ZRSg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787485505; x=1788090305; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lLWUar7CbdYKGZb3FGkxL0X2Mwo3sxR4Wu68UThs0tE=;
        b=PQJbzsA54udwN0Qo4P9o9+D9//wTBRVpGj+dlODiOCUGb3nmRW1wRDUAz+MbVRRrVN
         ziXe3GT4svju1BRBB+Y/pGHXm96CAuGVpzMZeZlbgGGOubCRSMJr9xi6KKIi3+7jYxcn
         erxf30hAOT/RnriahVYO7XhxFQw03rUEsr7VJeXD84kUFOdqURwfrb8qg2feChAXKUtg
         cLAd6KYTy8Xa8R+h+EUiDPota418gmbmxXFWFM+SpmOmBR9wAPWVRISXo9hyYSGjxMNL
         VfoGVCyT9jFS4gOCjDpKEuVEJAp2Wha3sxijLdC3ftMEtTO741aiAdTl6lvlAT+Dy4R6
         ZL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787485505; x=1788090305;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lLWUar7CbdYKGZb3FGkxL0X2Mwo3sxR4Wu68UThs0tE=;
        b=SRkkC3ivYKgj4Jyqfbkg6w8WkcvLVmwskudDUs4ZVCDgU8gwMn3vYfhKX+aiOwYZCA
         WDL6hWxY/TjLDxCT8jzvSTP74nnGojHclHYXDh2W3tOehfYhMxIsrgHE5hAcHc2xfDE3
         7xRbJknZmTtR1AoFqnhvCmIk9eNhKtEP9aFRcXKNJ7Zi/ZTXBKszGDzAJ1h3+3TYqy1n
         bZUZZiIvJ+54MsHWMcEKHCuk2phKOWD08vpch+zolhcq1B01vfZ8GfcWPrDVYxv99jK5
         ZEYJlwpocaFBc2/rZ+135ahWtAmlOsuqjIdU/6Vud29vVu/JUn0LhdeAulkHC16NS1jN
         3Uhg==
X-Forwarded-Encrypted: i=1; AHgh+Rpf28acPvIhWY+VnHE3OONbCIw3uC94IeqM7jD5+A/1YzIwJkFhVXvDRCSHdurX4ixIWunagN+NRdEBNg==@lists.linux.dev
X-Gm-Message-State: AFuF++mps8D78I9gW8MW8kCDFnAwYr/37nx1NGCsxwtKLrwhCbq+LU6U
	IQ8Wft6gg+z4UZVOWMUqBqujl03fv8GzlQJgoAbepBce55N9B9gSrz55pdZ47xiBP4KlK5bBemr
	AaSVa4wqFcZhv8qgOEm9xDdfg2EJo0mk=
X-Gm-Gg: AR+sD1000TI9WRt48Fg3sTSQd8E7ORa9SsgBBl7uhbFzXW6Xqe4tdlPQjAWvSZS2gX1
	kMTP3g+vtZlK+/jGqRHai5o/nsXt2ChlCYa+hBpo9NSlD9Jx06mFI72g+maSzFp7Id3f4QHe50Y
	TDJazyMsGNoZloox41jkq739mssJOz/MCs0nxVWHS5NtkE8eGOhgfw6PyI9U8JqiW5O7Wu+D7Pm
	Q/X3Xf/m2IXnqTQSSHzvu9IvvpZcCdcOxQ+oqj+UEbUZ5pukhbEeQ0vLVj1IaeTCFWz5t/TZiQA
	FxtsFzDnL7SZ2J6lInuTg32Jxyo8OSIHtzg+Luby/5w8VxWSXRp/XLYgtsrkqNZQFyezPkoOimf
	D
X-Received: by 2002:a2e:be2b:0:b0:39c:93ff:3672 with SMTP id
 38308e7fff4ca-3a1aec6b889mr42036251fa.9.1787485504882; Sun, 23 Aug 2026
 04:45:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPyJwA_D9qw0T72f8zwM1yKjP+To=maVANbcdsWM7yRmbBxYvw@mail.gmail.com>
 <CAPyJwA9R=p8_uxyYODb00g_nUq26SRsWHBGgAAJnR0YMTRRo4A@mail.gmail.com>
 <CAPyJwA9P48LDcOr7u_iT1WPFBCHxh9w6cxFvyi5GS3syM6crbQ@mail.gmail.com> <07435e6b-ee30-4c85-8c8b-0ce3a4ead1d9@leemhuis.info>
In-Reply-To: <07435e6b-ee30-4c85-8c8b-0ce3a4ead1d9@leemhuis.info>
From: Mathieu Fluhr <mathieu.fluhr@gmail.com>
Date: Sun, 23 Aug 2026 13:44:53 +0200
X-Gm-Features: AcwNN1USDXY6BZ3QVJnKPjKNwKTbggFPbEprInzjcDg0VrWNuS71PJD3swwcjl0
Message-ID: <CAPyJwA-eNSbVGV0uhy0-2w2_Gs0dWdOeJLRpBSLVO_a01-ZPxg@mail.gmail.com>
Subject: Re: [REGRESSION] 6.12.36+: usb: hub: post-resume delayed work
 triggers > uncorrected MCE / data fabric sync flood on Threadripper 7970X >
 (bisected to aec11e5f9c45)
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-usb@vger.kernel.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>, 
	Forest <forestix@gaga.casa>, Slavik Dev <developer.slavik@gmail.com>, 
	Michal Pecio <michal.pecio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 23, 2026 at 12:37=E2=80=AFPM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 8/23/26 12:15, Mathieu Fluhr wrote:
> Thx for the report. Side note: mentioning the essence at the top before
> explaining backstory and details is usually the way better approach to
> get people interested in a bug report, especially if it's more that one
> or two paras.

Point taken :)

> Anyway, as you mentioned later and quoted below, your problems are
> caused by a 6.12.y backport of 8f5b7e2bec1c36 ("usb: hub: fix detection
> of high tier USB3 devices behind suspended hubs") [v6.16-rc5 (2025-07-06
> 23:10:26)], authored by Mathias Nyman (now CCed).
>
> There were at least three earlier reports about problems caused by that
> commit, all mentioning adb (which I assume you use, too):

Yes, looking at the reports, this looks definitely related.
What is happening when the emulator starts is that it also starts adbd
if not running on the Linux side, to communicate with the emulator
later on.

So, this could perfectly explain the persistent state after the
"Android 15 priming": Since the Android 15 repo contains a more recent
ADB, where the issue has been eventually wored around, it is started
firs, and later, when 11 starts, it does not kill it, restarting its
older adbd, but instead keep the new one running.

So, long story short, on my side, I was still looking at the "wrong
side" of the problem, trying to find what QEMU was doing wrong, where
in the end, it was more the interactions that adb was doing with the
USB bus during C2 state that was causing the issue.

>
> https://lore.kernel.org/all/qc0nhk9c6l0a08bkfeplrm3qjssgrjkvkp@sonic.net/
> https://lore.kernel.org/all/CAGQo=3DTJXef-QzbkFEpTcJ138j0k6WYnV4=3DtNY8Q7=
s3U7DUOY+Q@mail.gmail.com/
> https://bugzilla.kernel.org/show_bug.cgi?id=3D221103
>
> FWIW, https://bugzilla.kernel.org/show_bug.cgi?id=3D221103#c16 mentions
> the workaround you apparently found, too. The patch Mario (now CCed,
> just like the authors of the two mailed reports linked above; and
> Michael, too, who seems to be involved) proposed in the last comment of
> that ticket apparently didn't help. And no other fix is in sight, or am
> I missing something?
>
> Mathias reverting the culprit in mainline a option to resolve this (I
> assume it is not, but I'm asking just to be sure)?

Ok, here you lost me a little: Looking to all the links provided, yes,
this looks very similar to what I am experiencing. But (and correct me
if I am wrong)
1. reverting the "bad commit" is not really an option, since it was
originally authored for a specific purpose (other than annoying AMD
owners :)
2. the patch that Mario proposed is very recent, and would address the
issue not on the USB but on the PCI level?

Thanks again for the swift answer here and all the informative links!
I must admit that I researched a lot debugging this issue, but I never
thought about looking to the USB side of the problem, focusing more on
the CPU side.

Kind Regards,
Mathieu

>
> Ciao, Thorsten
>
> >>> As an AOSP developer I am compiling daily different versions of AOSP =
on it,
> >>> mostly building an Android (Automotive) emulator for quick "code-buil=
d-test"
> >>> runs. I use Ubuntu 24.04 LTS for that, updating to the latest HWE ker=
nels that
> >>> Ubuntu provide there (6.8, 6.11, 6.14 etc. until 7.0 recently), with =
no manual
> >>> modifications applied.
> >>>
> >>> 3 weeks ago, I needed to analyze and issue happening inside Android 1=
1,
> >>> building an emulator for a simple Android phone [1]. But when I start=
ed using
> >>> this emulator, first with the latest 7.0 kernel I noticed several har=
d crashes,
> >>> sometimes just freezing my workstation (with fans full on, but someti=
mes fans
> >>> full off), but also sometimes automatically rebooting it.
> >>>
> >>> After a few days of deep investigations (To be honest, I first suspec=
ted an
> >>> issue with the nivida driver), I found out that a pattern to reproduc=
e this
> >>> quickly was to let the computer idle with the emulator running. The c=
rash was
> >>> always occurring under 20/25 minutes, most of the time letting it idl=
e for less
> >>> than 10 was even sufficient.
> >>>
> >>> This made me a bit curious, and looking a bit deeper (and with a litt=
le help
> >>> of AI) I was able to find a workaround. forbidding my CPU to enter C2=
 state,
> >>> using "processor.max_cstate=3D1" argument. Using this, I was not able=
 to
> >>> reproduce the crash for more than an hour, but I did not pursue there=
 very
> >>> much: As a developer I hate workarounds :)
> >>>
> >>> I instead started to get "back in time" on a clean and up-to-date fre=
sh Ubuntu
> >>> 24.04 install, reverting back to "good old" kernel versions, since I =
could not
> >>> convince myself that first my CPU was dying and second that the issue=
 has always
> >>> been there. I confirmed that 6.8 and 6.11 (again Ubuntu HWE packages)=
 work
> >>> fine, but the crash was reproducible using 6.14 and above.
> >>>
> >>> I then got my hands dirty, and started to test different mainline ker=
nel
> >>> prebuilt packages up to a point where I confirmed that 6.12.35 worked=
 fine, but
> >>> 6.12.40 not. I then bisected both versions, ensuring a good case mean=
t the
> >>> emulator was idling without any crash for 1 hour minimum. This lead a=
t the end
> >>> to the following commit:
> >>>
> >>>   aec11e5f9c452ef64e2c113637ab89a67a5ceb62
> >>>   ("usb: hub: fix detection of high tier USB3 devices behind suspende=
d hubs")
> >>>   [mainline: 8f5b7e2bec1c36578fdaa74a6951833541103e27]
> >>>
> >>> Being quite astonished that something related to C2 state was trigger=
ed by an
> >>> USB patch, I then tested the latest 7.0 kernel, this time using the
> >>> "usbcore.autosuspend=3D-1" argument instead. To my surprise, I could =
not
> >>> reproduce the crash, even with the exact same emulator idling for 2 h=
ours.
> >>>
> >>> Also, something very astonishing, that I still cannot fully understan=
d today:
> >>>  1. "priming" my system with a 30 seconds (!) run of a modern Android
> >>>      emulator [2] cleared the issue: After closing the 15 emulator an=
d starting
> >>>      the 11, I could let it idle for again more than an hour. It seem=
s even not
> >>>      be related to the 'kvm' kernel modules, since removing the modul=
e and
> >>>      re-inserting it between both emulator did not change a thing.
> >>>  2. A few times (I did not really invest debugging this TBH), the cra=
sh even
> >>>     occurred shortly (2-3 minutes) after I closed the Android 11 emul=
ator.
> >>>
> >>> Now, the technical details of my setup...
> >>>
> >>> Hardware / software
> >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>
> >>> CPU:        AMD Ryzen Threadripper 7970X (Storm Peak, family 19h)
> >>> Microcode:  0x0a10810c
> >>> Board:      ASUS Pro WS TRX50-SAGE WIFI, BIOS 1203 and 1317 (both aff=
ected)
> >>> Memory:     128 GB DDR5 ECC RDIMM @ 4800 MT/s (JEDEC, no XMP/EXPO)
> >>> GPU:        NVIDIA RTX 3080 Ti (also reproduced with RTX 5080)
> >>> Distro:     Ubuntu 24.04 and 26.04 with 595-open NVIDIA driver
> >>> USB:        8 onboard xHCI controllers; only a USB keyboard and mouse
> >>>             attached
> >>>
> >>> Error signature
> >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>
> >>> On the boot following each crash I could always see the following lin=
es in
> >>> the dmesg logs:
> >>> ---8<----------------------------------------------------------------=
---------
> >>>   x86/amd: Previous system reset reason [0x88000800]: an uncorrected
> >>>            error caused a data fabric sync flood event
> >>>   x86/amd: Previous system reset reason [0x88000800]: a software sync
> >>>            flood event occurred
> >>> ---8<----------------------------------------------------------------=
---------
> >>>
> >>> When I was fortunate enough and had an automatic reboot, this was als=
o inside:
> >>> ---8<----------------------------------------------------------------=
---------
> >>>   [Hardware Error]: event severity: fatal
> >>>   [Hardware Error]:   section_type: IA32/X64 processor error
> >>>   [Hardware Error]:    Error Structure Type: cache error
> >>>   [Hardware Error]:    Check Information: 0x000000000602001f
> >>>   [Hardware Error]:     Transaction Type: 2, Generic
> >>>   [Hardware Error]:     Level: 0
> >>>   [Hardware Error]:     Processor Context Corrupt: true
> >>>   [Hardware Error]:     Uncorrected: true
> >>>   mce: [Hardware Error]: CPU 34: Machine Check: 0 Bank 5: aea00000000=
00108
> >>>   mce: [Hardware Error]: TSC 0 ADDR 1ffffff98e8ee38 MISC d0150fff0000=
0000
> >>>        SYND 4d000000 IPID 500b020049b00
> >>> ---8<----------------------------------------------------------------=
---------
> >>>
> >>> The signature is bit-identical across every occurrence except for the
> >>> reporting CPU, which varies (observed on CPUs 1, 3, 7, 16, 32, 34, 35=
).
> >>>
> >>>
> >>> Reproducer
> >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>
> >>> 1. Boot an affected kernel with default idle settings (C2 available,
> >>>    no max_cstate restriction).
> >>> 2. Start an old and/or 32/64-bit Android emulator (QEMU/KVM guest) an=
d leave it
> >>>    idle on the launcher screen. Nothing else running.
> >>> 3. System hard-resets within 20 minutes.
> >>>
> >>> Under sustained CPU load the fault never occurs; it requires the syst=
em to be
> >>> idle. turbostat confirms ~99% C2 residency across all cores in the cr=
ashing
> >>> condition.
> >>>
> >>>
> >>> Bisection
> >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>
> >>> ---8<----------------------------------------------------------------=
---------
> >>> git bisect start
> >>> # status: waiting for both good and bad commits
> >>> # good: [783cd2c3dca8b6c434e955b84c20c8940588dc68] Linux 6.12.35
> >>> git bisect good 783cd2c3dca8b6c434e955b84c20c8940588dc68
> >>> # status: waiting for bad commit, 1 good commit known
> >>> # bad: [d90ecb2b1308b3e362ec4c21ff7cf0a051b445df] Linux 6.12.40
> >>> git bisect bad d90ecb2b1308b3e362ec4c21ff7cf0a051b445df
> >>> # good: [3ce57d493dd81ecc27033c7a918cc0d0ddaa8edc] ata: libata-acpi:
> >>> Do not assume 40 wire cable if no devices are enabled
> >>> git bisect good 3ce57d493dd81ecc27033c7a918cc0d0ddaa8edc
> >>> # good: [bbd385b65f9e56cab1243e753510a99a59110083] net/mlx5e: Add new
> >>> prio for promiscuous mode
> >>> git bisect good bbd385b65f9e56cab1243e753510a99a59110083
> >>> # good: [2a76bc2b24ed889a689fb1c9015307bf16aafb5b] smb: client: fix
> >>> use-after-free in crypt_message when using async crypto
> >>> git bisect good 2a76bc2b24ed889a689fb1c9015307bf16aafb5b
> >>> # good: [95a13b0a6b042ac5333b67f59af1dffe7b71137b] riscv:
> >>> traps_misaligned: properly sign extend value in misaligned load
> >>> handler
> >>> git bisect good 95a13b0a6b042ac5333b67f59af1dffe7b71137b
> >>> # good: [40b5b4ba8ed87c0bfb6268c10589777652ebde4c] drm/mediatek: Add
> >>> wait_event_timeout when disabling plane
> >>> git bisect good 40b5b4ba8ed87c0bfb6268c10589777652ebde4c
> >>> # bad: [affb46db59f908474a211f23953c3b9109f0d647] net: libwx: fix
> >>> multicast packets received count
> >>> git bisect bad affb46db59f908474a211f23953c3b9109f0d647
> >>> # good: [ee56da95f8962b86fec4ef93f866e64c8d025a58] btrfs: fix block
> >>> group refcount race in btrfs_create_pending_block_groups()
> >>> git bisect good ee56da95f8962b86fec4ef93f866e64c8d025a58
> >>> # bad: [bf71baa3cfe754c6e99ad62711b9fb3e3da33517] usb: hub: Fix
> >>> flushing of delayed work used for post resume purposes
> >>> git bisect bad bf71baa3cfe754c6e99ad62711b9fb3e3da33517
> >>> # bad: [e11359640090ab26e4153cce583f50e0b8979f0d] usb: hub: Fix
> >>> flushing and scheduling of delayed work that tunes runtime pm
> >>> git bisect bad e11359640090ab26e4153cce583f50e0b8979f0d
> >>> # bad: [aec11e5f9c452ef64e2c113637ab89a67a5ceb62] usb: hub: fix
> >>> detection of high tier USB3 devices behind suspended hubs
> >>> git bisect bad aec11e5f9c452ef64e2c113637ab89a67a5ceb62
> >>> # first bad commit: [aec11e5f9c452ef64e2c113637ab89a67a5ceb62] usb:
> >>> hub: fix detection of high tier USB3 devices behind suspended hubs
> >>> ---8<----------------------------------------------------------------=
---------
> >>>
> >>> (Please note that I did not perform a full "revert test", since the a=
ec11e5f9c45
> >>> commit could not be cleanly reverted on both 6.12.40 and 7.0.0)
> >>>
> >>>
> >>> Workarounds
> >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>
> >>> Either of these prevents the crash on an affected kernel:
> >>>   usbcore.autosuspend=3D-1     (disables USB runtime PM)
> >>>   processor.max_cstate=3D1     (prevents C2 entry)
> >>>
> >>>
> >>> Ruled out
> >>> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>>
> >>> - GPU/driver: reproduced with RTX 5080 (595-open module) and RTX 3080=
 Ti
> >>>               (both 595-open and 595 proprietary modules)
> >>> - ASUS USB4 PCIe add-in card: reproduces in ~5 min with the card phys=
ically
> >>>                               removed
> >>> - AVIC: kvm_amd avic=3DN on both good and bad kernels
> >>> - TSA mitigation: tsa=3Doff verified applied
> >>>   (/sys/devices/system/cpu/vulnerabilities/tsa =3D "Vulnerable"), sti=
ll crashes
> >>> - Memory: stock JEDEC 4800, no XMP/EXPO, no ECC errors logged
> >>>   (ras-mc-ctl reports zero CE/UE)
> >>> - Thermal/power: ~47-50 C at time of crash, system idle; 1600W Season=
ic PSU
> >>> - Hardware health: multi-hour AOSP compiles (all 64 threads, heavy ca=
che
> >>>   load) and repeated GPU stress runs complete without error
> >>>
> >>>
> >>> I hope this gives you enough details to start looking at what could c=
ause this
> >>> weird behavior. Just FYI, when asked about hardware damage, AI sugges=
ted more
> >>> something like "a CPU-level microcode erratum in the deep-idle path o=
n this
> >>> platform", but being old-school, I tend to always triple-check what A=
I tells
> >>> before claiming it myself :)
> >>>
> >>> Thanks and Kind Regards,
> >>> Mathieu
> >>>
> >>> ------
> >>> [1] using android-11.0.0_r46 release tag and "sdk_phone_x86_64" as lu=
nch target
> >>> [3] using android-15.0.0_r32 release tag and "sdk_phone64_x86_64" as =
lunch
> >>>     target this time, since Google only releases 64-bit only today
> >
>
