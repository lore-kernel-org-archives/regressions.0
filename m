Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795158982;
	b=V84vrNO1b1dgRE2A+ctC/HrbnKkddF9/ewtSm0uCdEd9VgBc1CknT30Z12rb7rxCSdAI
	 daxtYirH8r1LN3alj57choKq/feqMc0dssuO88dtdat2MuIZ/51+dXOUrceyVXGnkIYev
	 Uze2FvoKjYd97UAf7zFJI8zm02ET5KUkzUll4uoBB0asQU1oyFj6QavDWMM5VppL5dsmM
	 CxDTV8sAw/sDkn5cBcrqgaOAUNPUvYbriWI4LMvEUE8wkhF5OWlqGNiM+TKPfspFukdUd
	 hC0NxsBLb/1qLjMMkxVHDUfL/gsuxHTKIPjOgUhyu7Non5qIl/vgaSya/bFGtSIMy8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158982;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:Received:From:In-Reply-To:References:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=pr8bkjkApTHbP6ovsTmt0oEqwUCGjHFXMihoPuCHWKk=;
	b=P+5DO38SKq+HkVEPXP+GBSvQDX6Xm7pDmxGRrNdPv15lDocgIhGqolplZlgbHcbQdW3X
	 h//+1pB7PaQ6L+uAbjNkMdZ+oY5Nn4NXNWMnpRGt3Ytpx1uctT/KmbCGPnMJ1BQAwIGTW
	 0XFlGV7VeYtXsG8WHkszH/Z+5Fkq0GRNNYn091u7k4b/uu1OXZja7wsYXo3svlKk1roCC
	 IC9EGpT9Pzkob1hR+OVlTsQB3eN8f0u8G8bXLYuzdAmC03R4hS/EVl5rf0rSG7uXP062L
	 NQ9A0A/dRO2eP6gvtOHkPKsOrp7SuUBirNQ1yq2dIQf80aFBin8RBKJt0w1hIu/nn1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starlabs.systems;
	spf=pass smtp.mailfrom=starlabs.systems;
	dkim=pass header.d=starlabs-systems.20260707.gappssmtp.com header.i=@starlabs-systems.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="XJlf8N/M";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636EC606A320
	for <regressions@lists.linux.dev>; Fri, 20 Nov 2026 07:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 636EC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20260707.gappssmtp.com header.i=@starlabs-systems.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XJlf8N/M
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67db3a48dc6so820136d50.3
        for <regressions@lists.linux.dev>; Thu, 19 Nov 2026 23:16:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795158980; cv=none;
        d=google.com; s=arc-20260327;
        b=HFo2ZGMMLGi3Bykx1fzumu0jZ/F05y8pjaf6GoFmIJ+z7iRJzZE/CEz0jxsBwslbQO
         CGVbRkgPFh+PgoU4tIBgozxgsWUD6zBeiTe/zejB1ekC03op52J5s1ZFOEZPUHRsemxI
         BX3iTE1cRsz5ABj9K6E8PQkUc2wzTQNi8D9LLXMtDAMIkpyxeq9MSBoej0oQBE5Vo2H4
         KkBKO5L5w7mj0VGfsmX/plcC9MI1tqJmljXDDGY6olMZXBanuC9nmMw33N5iyvmmQ3/L
         i+V/lN5eotVjz/X84x1OaG7gZNIN1uJjw58Puli3n4/IZNumVfLLTFpQSXuqLkljLKxx
         7SEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=pr8bkjkApTHbP6ovsTmt0oEqwUCGjHFXMihoPuCHWKk=;
        fh=Kz1wHX5lf/IqgPypXhGxSK2Ogvq96OxIx/tuZ7SJbHw=;
        b=MuKnCzj+0shD+BZmYV4IlyXWogMYJLsgqSyz+1zo5jNxcV2uM0K6e1HlhrqdEMfvEv
         wlVKg97EGvI4cxwYz+WFwOw2fSSJ2SxjY2vr+Hn7/wpf/Sf9sKt6qgSk9air0OhETXjk
         O/j+2s5ii30eoF4YCqVmYp1UIkWhZ9Ye9Nt9GV+nilTQ3LSrxRJebqqHKnMCZJOXl6nu
         OGUxVN6WAMxyprwE0W/ip7c3p1yS/8V1IPtRDzxRzMG7BZk+yRFZxwhm+OxEe+RVB4+P
         xa9CEvWtda129UIe3G6hf7txORQ/lTzlcpVnuBmlmuqDaJGwm/SrKMmWZUsOvB6BMqsB
         we6g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20260707.gappssmtp.com; s=20260707; t=1795158980; x=1795763780; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pr8bkjkApTHbP6ovsTmt0oEqwUCGjHFXMihoPuCHWKk=;
        b=XJlf8N/MC+3Lw59irjtDtRy7F9uIsVZ7TirUZth45F2suo7toDqcC4xeZIQUs6cfKy
         PpFLp+QzEQZL1ZI0/XStfRbQTnbINom/sch8ObIEsNoW23XN8eCxCyrNq8BzX3S99Fjq
         sX7IYnwitPx81PgBbgODjOTlCG4EwfF++9OXiU5W33jnLogz8LMx4XgivjozsTLceZYa
         lrC+SgT3Az/rrSsN4S100+M9gmmwWfFHKD6dIdaD3oJvPsTvrvUrdz7AbMKxx9v6I/FD
         BiFKN2lD8//BVfky58w/QP3PEzu+x81ui6UConTa0MlGOrWQgao+BYsNCjaoILYHjyUe
         tYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795158980; x=1795763780;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pr8bkjkApTHbP6ovsTmt0oEqwUCGjHFXMihoPuCHWKk=;
        b=p3dM3wMYLI34LZguwd/yT4UHYe+NTJHj+PNWbiTn7tYGLleTDD4wr+2CkYueA7thRU
         EEb4l+DPvrzukHoYajCaOeIKXuDNYpL01j/67He/4+CbuPz/XhyTFOk3FRkHzMqE3UTh
         0SUfG7oxYwUidON2Fc/p3TFaqHvtT+bGIeXelEF3fR784xZvH56ufFAuCta15lP1n6Yk
         i9R3VSwMoxxUVW7M1CKJJoa69YJfI3BAw1h6H89t5jbnb0deqOKgEr9oHwJxrSkxoq9h
         xjAOGF34aeKl99DBeBRY8UAoL8+hY0I70folXUCSWQWDoV1+RPoctd5rNCM9BmFOME2i
         xn/A==
X-Forwarded-Encrypted: i=1; AL+hErGHS1jl6B7TqSsD4SPKu+CCJE/q0xTgdsPwjPq52Q4EB0eOCZubzgfEV+FE7TqwNCglIQo1vHy6+t47Ng==@lists.linux.dev
X-Gm-Message-State: APuU4Z+eTYZ2hoo/SOS+HX4085sjYlB+JR4W1Rg8Pu5cn88/DyK4/2WJ
	aQrfCTP3mXc/mqIfcGJqvA36oifAY/USHp6uo1zL3UBKTBXzngOzc4ZIqLwHM2gmt6DaRX7eOtw
	OtZCbAoMBNEateCL9iE3xZKed0s/vhhGSrNVSAD/O
X-Gm-Gg: AZFdTZfvo9q596vdhNHiN63NjdUWN3+eaaG5nFKKpBeUHgrPkbxCRE7/+8hMjN/SLn1
	6Lxa5HMCIZ8+eFolBssYz2sEpGSrSR3rfTJr1kefTiuEbd1Tc4byszNtlC0L8lPZD/66QMXG6i5
	f+ZxAwEmuCo0yxH85hahyZAfM8LZ2xE4S75rvTL4UovX/pTueqMPECgzHdHUsHbkLn7eU8LZN1V
	xqgRHnOcpmdlQeSGKRjNij92TJu7hq9YxwbOBV/5TVcFSN4ub674Bqee9KjGZdlp3kjGbTa89s7
	CpM6Da2rch4IWEXzm/jxsuj3lmvXSB/sTTVIVxx+6MHTPteQfdSkserp4h2plA9Qc3BMu+bIDR6
	oPIWkSIZDEi0buQlgt+aTCuDuZgQD/ysDwdJT/NPxqlTWqkQKjcYUQ4U6uP3S15YUyKeJ1bny+M
	xJMNvXokGz7rz/HFjbjSWpRqu9ab7IVvyXf++JvQ5c8nMFBL5g
X-Received: by 2002:a05:690e:43c6:b0:67b:fd1d:4767 with SMTP id
 956f58d0204a3-67df4446b9dmr530623d50.88.1795158980194; Thu, 19 Nov 2026
 23:16:20 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 19 Nov 2026 23:16:19 -0800
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 19 Nov 2026 23:16:01 -0800
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Thu, 19 Nov 2026 23:15:09 -0800
From: Sean Rhodes <sean@starlabs.systems>
In-Reply-To: <DMZEIO23VCO0.2BB6F5495FHVG@web.de>
References: <523eb7d1cc0811df4a5e4c534538f3dd@web.de> <eb52777b-8607-427b-a709-cf1ab76ef672@leemhuis.info>
 <DMV8DI3F257U.DPLVLW2DZC3Z@web.de> <CABtds-3f_Gcsd6_vgcbqiAoN-9AUwHg5cr71VetRpO5jC4ZxFw@mail.gmail.com>
 <DMZEIO23VCO0.2BB6F5495FHVG@web.de>
Date: Thu, 19 Nov 2026 23:16:19 -0800
X-Gm-Features: AclHuK-rodRypXzXRwd_0Z1gPSs3n7Ipa9IRXGAJ2v7akGndaL_kFCK2Sj9nNWg
Message-ID: <CABtds-2rtzrB4mrcTnGXCTcbxG345-+ODcrAhd8=8WuV+11wJg@mail.gmail.com>
Subject: Re: [REGRESSION] rtsx_usb_sdmmc: RTS5129 (0bda:0129) no longer
 detects SD card
To: Philipp Jonas <pjjonas@web.de>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, linux-mmc@vger.kernel.org, 
	regressions@lists.linux.dev, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Ulf Hansson <ulfh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi

Thanks - I don't have any cards that old to test with, but the attached
should work (borrowed from the old driver that was removed)

Sean

On Thu, 19 Nov 2026 at 18:53, Philipp Jonas <pjjonas@web.de> wrote:

> On Thu Nov 19, 2026 at 3:35 PM CET, Sean Rhodes wrote:
> > Hi
> >
> > Could you share the trace from a failing 7.3.4? And what card was it?
> >
> > Thanks
> >
> > Sean
> >
> > On Sat, 14 Nov 2026 at 20:54, Philipp Jonas <pjjonas@web.de> wrote:
> >
> >> On Wed Nov 11, 2026 at 10:06 AM CET, Thorsten Leemhuis wrote:
> >> > On 11/8/26 19:51, Philipp wrote:
> >> >>
> >> >> the SD card in the internal Realtek RTS5129 USB card reader
> >> >> (0bda:0129) of my Lenovo V110-15IKB is no longer detected.
> >> >>
> >> >> Works:  6.12.116, 7.2.x
> >> >> Broken: 6.18.x, 7.3.3
> >> >>
> >> >> On broken kernels rtsx_usb and rtsx_usb_sdmmc load and the platform
> >> >> devices rtsx_usb_sdmmc.0.auto / rtsx_usb_ms.1.auto exist, but no
> >> >> mmc host/card appears (no mmc0, no mmcblk0) and there are no errors
> >> >> in dmesg. Reloading rtsx_usb / rtsx_usb_sdmmc, re-inserting the card
> >> >> and disabling USB autosuspend (power/control=on) do not help.
> >> >>
> >> >> Since 7.2.x worked but 6.18.x does not, I suspect a change that was
> >> >> backported to stable.
> >> >
> >> > Might, but might not -- and I wonder if you have two bugs, some race,
> or
> >> > if some .config setting is disturbing something. Overall this
> situations
> >> > is somewhat puzzling. The best way to bring some light into this is
> >> afaics:
> >> >
> >> > Check if 7.2 is working; if it is, bisect between that and 7.3.3; of
> >> > not, bisect between 7.2 and 7.2.x to find what fixes things. And
> ensure
> >> > to use the same .config as a base during the bisection, as explained
> >> here:
> >> >
> >>
> https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.html
> >> >
> >> > dmesg outputs from a working and a not-that-different version that is
> >> > broken (say 7.2 and 7.3.3) would be helpful, too.
> >> >
> >> > Ciao, Thorsten
> >>
> >> I found the culprit:
> >>
> >>   7185b6d33b17 ("mmc: rtsx_usb_sdmmc: suppress false CD after init
> >> timeout")
> >>
> >> Reverting just that commit on top of 7.3.4 fixes it. Same kernel
> >> version and config, the revert being the only difference:
> >>
> >>   7.3.4:           card not detected
> >>   7.3.4 + revert:  card detected again
> >>
> >> dmesg with the revert:
> >>
> >> [    4.133620] usbcore: registered new interface driver rtsx_usb
> >> [    5.582812] mmc0: new high speed SD card at address b368
> >> [    5.638774] mmcblk0: mmc0:b368 SD 1.90 GiB
> >>
> >> Without the revert, nothing card related shows up after the
> >> rtsx_usb line.
> >>
> >> Hardware: Lenovo V110-15IKB, internal Realtek RTS5129 (0bda:0129),
> >> no tray, plain SD slot. The card is permanently inserted and holds
> >> a LUKS key, so it has to be detected during boot.
> >>
> >> Judging from the commit message, I assume an init command times out
> >> before the card is attached, suppress_cd gets set, and as the card
> >> is never removed, raw SD_CD never drops and the suppression is never
> >> cleared. Note that physically removing and re-inserting the card on
> >> 7.3.3 did not bring it back either, so the clearing path does not
> >> seem to work here as intended.
> >>
> >> Sean, Greg, Ulf: CCing you as author/acker/committer.
> >> Happy to test patches.
> >>
> >> #regzbot introduced: 7185b6d33b17
> >>
> >> Philipp
> >>
>
> Hi,
>
> Attached is the full dmesg from an unpatched 7.3.4, booted with
> rtsx_usb_sdmmc.dyndbg=+p rtsx_usb.dyndbg=+p mmc_core.dyndbg=+p
> The card was inserted the whole time.
>
> The relevant part:
>
> [    4.273107] mmc0: starting CMD0 arg 00000000 flags 000000c0
> [    4.274391] mmc0: req done (CMD0): 0: 00000000 00000000 00000000
> 00000000
> [    4.277087] mmc0: starting CMD8 arg 000001aa flags 000002f5
> [    4.909018] rtsx_usb_sdmmc rtsx_usb_sdmmc.0.auto: rtsx_usb_get_rsp
> failed (err = -110)
> [    4.909149] mmc0: req done (CMD8): -110: 00000000 00000000 00000000
> 00000000
> [    4.909157] mmc0: starting CMD55 arg 00000000 flags 000000f5
> [    4.909313] rtsx_usb_sdmmc rtsx_usb_sdmmc.0.auto: cmd->error = -123
>
> After the CMD8 timeout every further command (CMD55, CMD1, and the
> retries at 300 and 250 kHz) fails immediately with -ENOMEDIUM. The
> same pattern repeats at ~82s after runtime resume.
>
> The card is a 2 GB standard capacity SD card, so most likely SD 1.x,
> which per spec does not respond to CMD8 at all. On 7.2 the core then
> simply continued with CMD55/ACMD41. With 7185b6d33b17 that CMD8
> timeout is treated as "no media", so I suspect all pre-SD 2.0 cards
> are affected, not just mine.
>
> Philipp
>

From e4226badb674c1b566efb8959bda6c0d89dd7529 Mon Sep 17 00:00:00 2001
From: Sean Rhodes <sean@starlabs.systems>
Date: Thu, 19 Nov 2026 21:51:26 +0000
Subject: [PATCH] mmc: rtsx_usb_sdmmc: allow legacy SD init after CMD8 timeout

According to the rts5139 staging driver, SD 1.x cards do not respond
to SD_SEND_IF_COND. On an RTS5129, a preinserted 2 GB SD card times
out on that command and the driver then rejects CMD55 and subsequent
initialization requests with -ENOMEDIUM. This prevents MMC core from
trying the legacy SD path.

Do not suppress card detection on a timeout from a no-data CMD8.
MMC SEND_EXT_CSD uses the same opcode with a data transfer, so retain
the existing timeout handling for that command. Keep refreshing the
physical card state and retain suppression on other discovery timeouts
to stop repeated probes of an empty tray.

Probably might maybe fix: 7185b6d33b17 ("mmc: rtsx_usb_sdmmc: suppress
false CD after init timeout")
Reported-by: Philipp Jonas <pjjonas@web.de>
Link: https://lore.kernel.org/r/523eb7d1cc0811df4a5e4c534538f3dd@web.de
Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 drivers/mmc/host/rtsx_usb_sdmmc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/rtsx_usb_sdmmc.c
b/drivers/mmc/host/rtsx_usb_sdmmc.c
index bf37fab233cf..55fb83f29328 100644
--- a/drivers/mmc/host/rtsx_usb_sdmmc.c
+++ b/drivers/mmc/host/rtsx_usb_sdmmc.c
@@ -879,10 +879,12 @@ static void sdmmc_request(struct mmc_host *mmc,
struct mmc_request *mrq)
 finish_detect_card:
 	if (cmd->error) {
 		/*
-		 * detect card when fail to update card existence state and
-		 * speed up card removal when retry
+		 * SD 1.x cards can time out on SEND_IF_COND. Leave card
+		 * detection enabled for the legacy initialization sequence.
+		 * MMC SEND_EXT_CSD shares the opcode but carries data.
 		 */
-		if (!mmc->card && cmd->error == -ETIMEDOUT)
+		if (!mmc->card && cmd->error == -ETIMEDOUT &&
+		    (cmd->opcode != SD_SEND_IF_COND || data))
 			WRITE_ONCE(host->suppress_cd, true);
 		sdmmc_get_cd(mmc);
 		dev_dbg(sdmmc_dev(host), "cmd->error = %d\n", cmd->error);
-- 
2.53.0
