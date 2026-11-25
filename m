Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795648672;
	b=TQzbtK1qxl0EwcQnC7vWzU9wrfotdCfcjhdsgs5K65HCmjsUY9LQZafzNcnTlTxnwtVo
	 /ceA80pTAO0yjcWwmcKXbc+hAiTpXfO1+8CmFNDNgG1WetydW6yjGieHDY1TOXmdV+Qmy
	 RmBwQ9n7HnmVCMnrZMMpRE3My0ibGAhVx9lvr8v2eZs/C8RnBWDcomx792NJwAX90//Xv
	 sDSUooZrQtw6GMiHFEZh5hD4gIj7s3wlvIAs8ocKfLXNz/T2rqGWYbIdQqJEW7cGzUl0w
	 q69HcDX5pkASv24bZqihiK6pto3OtDtLUTttw7hPRkZfc3lCw6bxRy087EGVdERjNKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SPmmmW8/OqRNbcYGmJPG6LaUxAYxeNGXCP0krZQQU4s=;
	b=ped+nwiwYJAzqEge3Y02zlxwYIpOnTUiIWuzpy+5xsW6KPeqvbJ3xfoC6A6dAc2YC+1c
	 WOgABUIsAqifEjZj/RIrBtu2U0cZXxEg1FcPUNf7ULZoBAr0Q3RfUBwlirPxv4TH16bxv
	 GL+/Nax2Fw4xodqpLcsR2f9byMPbGWrYDVgi/Xri3FzJehb1wJJv1i6owY833z9qTcOan
	 +R7ZnqMtS8s7avB6ifkY/5SWcqOk88hG7B9VnQ6Mcgwdhjoy9R8DJfl+E8t4oizVScXSr
	 C63q9q+LLsE768D+5EfdoE9nSMe4vQbUm7izMjomvnGNe6z1H6+aCWxRgWKAiN/GQwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VxsflaMw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AAE606A321
	for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 23:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67AAE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VxsflaMw
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f0213202fdso34316865ad.3
        for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 15:17:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795648672; cv=none;
        d=google.com; s=arc-20260327;
        b=V+j7TF44WGZc9J6aVVoYEZvh7gXfmyACtapiIoB5mAqE20SasuLtRNyFnAfDcydEwr
         yOHW9ybvC+/jNE8rpiSZXekOeOeApIjulQpM+n6aT+l/pQq30Csi9dgGp9S07WlYbcwO
         /3O0QkRKTgfEY2N11QTy6OjrR+x1xpeloji8H8KixAbKoTrFJX1iyg69oAcOX+FyzCLF
         +89MfXDjD45U4P7c830tZ2x9g6V0E46ubUkTiypL8OA1AkUipMdVl1NmIeEe71h4bvVg
         Yu+lvkL2/o8UkOgnoJS+Qh7c3PXTRL43VkQd9es6b6ZPelEQBq0QqjD2ME7+16vWmpX8
         ehnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SPmmmW8/OqRNbcYGmJPG6LaUxAYxeNGXCP0krZQQU4s=;
        fh=WXLhodCKuoHjeTzDtroRNgmgVANQlyBUvdSeAtRx4XQ=;
        b=KV43VzgYXOXX6YYmlFoT5/r4rq8EzsEbiCSKU3uq3iec9GbtGb59gyB6GrptWeCH5H
         HNIO7dNVl7JE5O4N75vHIEmdqXPwoGwKeIpoUl8CjEXIfMB9qsGz6MNaRlKGlqGCiwdl
         OypLkvmlWqXwTX7oujJRR75KUTe4SisKYiyfenN5/Jjsr1Br0eIJvyHGWCYdh5qYjht3
         3z6Ob+PJBBuNbf2eNX+ocOotN50JVBFRQnbv6oz1TAO1q+w29biC62vu7Vglhv9mzi6+
         Xp5/sKr4djmn3pWLJbtHWKh7HSRkHdVnbLhvq20SDJyd6aQVBVxsQisUh6uw3I1Y8+uL
         5vTA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648672; x=1796253472; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SPmmmW8/OqRNbcYGmJPG6LaUxAYxeNGXCP0krZQQU4s=;
        b=VxsflaMws+bMZ+P4IfJnFFOvnjDG33c9dwAa5gH2x4q5daElzIyq1klWQGKOGZTSNz
         wO0DHG1NapEr74VdnCZS5FLKmLA4QIanwu3dQvrwM6Ujgv9ww5sQ/9Vvx6Lu0n9AAR69
         rmCX5KHx5VogP2N1E1DxDmc5cr0HtQ+YxN7WpBHa0Ed/tXO28c9YQ/gTto0l1JGDRf/T
         5Ock193U06N4ctXLjidiRABRThxTa/IvGDyqpEObcg2GwJo3wvYnq5gxh1Clhn7V7VEI
         9SlfBYoeBz+ejfjdpqZtJXhGvdGse3ccnhjNscrlRMixyl0aKFtrOojLfDQJjDQAoDfj
         m2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648672; x=1796253472;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SPmmmW8/OqRNbcYGmJPG6LaUxAYxeNGXCP0krZQQU4s=;
        b=BVvQIZp0iPh3SphelMcK6XXlIGhNJiAvUEl9hMTVkdAJ0kdSu0zJYMzT4dvEj5nU3g
         y43L8WKukoRLNSXSyHDrR6d97aCFLfOg/Fs4E/RPsa3jWNIbiAMZvuY+8XJNQcMKZOkP
         Qn89vLmy1YLrNumnaHwuMbiEPT3ghb/vuiLckHDRC8xYyp/7YiQrAx9oC+aRDzbWuvWh
         fGnV+QmalB5ymORq3doKWe8gN+EhSHzyunfwMdNbvic2UT+06eVV3LaJ851/BtGCmmmI
         536ezzAWjUNcRdnWZUuy/8slGX2jOdrw0xpi+4YeWZdp4Xi2RfHKGlgAQYezotC6uOvU
         iKzA==
X-Forwarded-Encrypted: i=1; AL+hErFnq+cTKNM3FkmVACD+HpYhL7RapH83KNXpPIXqr0nSG4VuNVHCpT/ReF1+OMBZBTCSgyhvfsIxqxcJSQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+DxfUD9Duzvl7NWKYmb6w9+0yEpHO37g8noIXrjHVLmUEN2bSz
	SvOW44ryWxsFzr43hZ66PIX2G5wYSR0usxTTkjxWqPVi49kPcvnNWgJGeLEj+TyDczAev5xrnQr
	lIa4PTzq1kSqU3+JXXMn7ExTwPMtDuFY=
X-Gm-Gg: AZFdTZf6/DN6H61hnhFKQnv3g58m33uHwNJuoJmX3pDN/uWlRb1zzn0HLsTolJTsKZM
	2BKYmfkErLt9gCeWT6c4b/gmQncLpW87PPuhWF9fqPFXag1Kx29N8gv3nHvTTQRZYY8vFeGSUDM
	avHuo8mXHMH4VV+jTe2iAd2Slmpu33MMnx1Hi7UDDg8he9UzAUb+DLb9mv64x31lM1vw0vifUwo
	ZGfO62IS+B5FQvKx9nhEO1rl3vQbeT/OpB1dcsQbipD8KApmEMXJYS8PPoDh04uL83yaUdIisq2
	RWQd44rblNtfckcZd4948shbMImxV1uVE5C0dc8t8xRhi4ZsvxUoPLTQS9RA4PAf+FmSfGwPgdL
	hohlqv141vzGE1vzng3O7rMV3IDD4anTZ59k//oJ6ZQEVMExrfBLnlqg3fDJNmUMTtFg=
X-Received: by 2002:a17:902:f602:b0:2df:90d4:7847 with SMTP id
 d9443c01a7336-2f03f1bf176mr194005115ad.35.1795648671611; Wed, 25 Nov 2026
 15:17:51 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CACKiatc1Bj2et4kcXDJiYx28XXxoo6iHPc9nYt3GhTCxUmdnsA@mail.gmail.com>
 <20261125203211.76029bf0.michal.pecio@gmail.com>
In-Reply-To: <20261125203211.76029bf0.michal.pecio@gmail.com>
From: Flavio Giacchetti <flv.giacchetti@gmail.com>
Date: Thu, 26 Nov 2026 00:17:40 +0100
X-Gm-Features: Aa3M54rgy4LL-69X-hqnD2jE-HjcRy5WNU4DRHc4WE3T57CpsEVg8w2rLPrsqdo
Message-ID: <CACKiateKEggvx60zugZt_C1ejcLv55OiL6Hyv=DkF72370FU1Q@mail.gmail.com>
Subject: Re: [REGRESSION] Creative Sound Blaster X3 (041e:3264) fails USB
 audio probe on Fedora 7.3.4
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, Oliver Neukum <oneukum@suse.com>, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Michal,

Yes. The earlier Fedora 7.3.3-300.fc45 logs show the X3 enumerating
at high speed and cdc_acm binding to interface 1 as ttyACM0 without
the rate-query errors. Audio worked. In a later 7.3.3 boot the same
unit enumerated at full speed (12 Mb/s), so that later run did not
establish a working high-speed baseline.

The failure also reproduced with Fedora 7.3.5-300.fc45 and its stock
USB and ALSA drivers, with a different known-good cable. At 480 Mb/s,
the X3 disconnected and re-enumerated, then failed to answer USB audio
sample-rate and mixer requests. On 7.3.4 the same high-speed failure
also occurred with my experimental cdc-acm module loaded and the ACM
interface unbound. Please disregard my IGNORE_DEVICE RFC as a fix.

On the failing 7.3.5 run, the USB hub worker was blocked in
usb_start_wait_urb -> usb_control_msg -> usb_get_string, called from
get_term_name during snd_usb_create_mixer. A 30-second usbmon trace
showed repeated endpoint-0 GET_DESCRIPTOR (string) and class
control requests. For several requests, the next completion came
about 5.12 s later with status -2 and zero bytes, consistent with
cancellation after the timeout. In a separate 7.3.4 run, the Intel
xHCI driver logged two "Event dma ... not part of TD" messages at
disconnect.

When the old probe finally unwound and a different rear port was
enumerated, the unit briefly appeared as Creative 041e:6007
("X-Fi UltraDSP"), with HID and CDC interfaces and no USB audio
interface. A targeted USB reset completed but left it at 6007. It
later returned to 041e:3264 and still failed the audio probe. I
have not identified what the 6007 state represents. Separately, a
local WirePlumber rule forced 32-bit PCM and hid the output when the
X3 enumerated at 12 Mb/s. Removing that rule restored 16-bit/48 kHz
playback in that mode, but did not fix the high-speed USB failure.

I then reset the X3 using Creative App on macOS. Back on Fedora
7.3.4-300.fc45 with the original cdc-acm module and without the
experimental USB quirk, the X3 briefly disconnected on the first
plug-in, then enumerated again at 480 Mb/s as 041e:3264. ALSA
registered it and I verified active stereo playback with S32_LE at
both 96 and 192 kHz. There were no further USB errors after the
successful re-enumeration in that test.

This is one successful test after resetting the device. I have not
isolated a bad kernel commit or reproduced the issue on upstream
mainline. I can provide a sanitized USB trace and kernel stack. If
it recurs after the reset, would a good/bad usbmon comparison
starting before plug-in help distinguish what happens at the first
disconnect?

Thanks,
Flavio
