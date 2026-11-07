Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794056751;
	b=bPhIDGearo0cJWveEXk4467pvywWpTQzT9FqoEdy5EPbsSBa2W8yqZfqpWEmfdIWs66/
	 LYm2UbibrEGMlZAP4EaLBq8/vOWV++TDlRmEHzpx6w4iDgK7lwk7xTFZEvHCLwGdW9gKy
	 U0VpArgWr+3zfstNkRUekvw08z2mCYa+3K962XokX2r4pn3BIaXyLL+jkwLfHOXuyY9Sp
	 HCunkBPjlCBmXaJ+GBqWll2tkP7v780/nIZK+bXak910ZxdUb7U0DhNh12G4dc8yCHH1q
	 Lkx77vXnhaYwej370q1U0UeLqYlPdoNKP+RptQjNXzKQ3ztuIcOFPaZjSx5of0VVmvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794056751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=oQJywcCCzEM8mXQiNt3fOzLIyIQh4hJRiekOYxmYR74=;
	b=wdfForRtXowZCaY9us/u1abdXMZ10ci6DG1ji6d0ZDSqubami8bKTMgDTblfcam5a7xN
	 fFh6Hech9WRpZKnAUAAFHmpX9tkjpuFTNdYbWw79I81up19nWvHzGrHFi0HgrcGjehH/Q
	 elYqp3M2X3arfYAlEb142lHgdNKKLy1Y7HuGVQQ5tz44P11nhAZJfKSO10ginc3kzTPWU
	 m8/50lQqoTAfBi4/2aVxruaatOTBDdXFwsPlgWqRQiUf6tpIK9kuyM3qtezgWbalWvaK4
	 jNQo+44vadhlhV3F2O2yrYGcdhPb2UZZ4gcwyk65sh76acctzvAY7DDWZ6qvla3ggeg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="JcW/6QmZ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D163606A32E
	for <regressions@lists.linux.dev>; Sat,  7 Nov 2026 13:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D163606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JcW/6QmZ
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b0d0b80fb9so921860a91.1
        for <regressions@lists.linux.dev>; Sat, 07 Nov 2026 05:05:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794056751; cv=none;
        d=google.com; s=arc-20260327;
        b=DwRx+Yd53YluTojw9X9hdwcSHRQZq1/1BdXtvnf76qmc6BH9cX0iT9WuXhFNitDSl9
         szQYbje+wlyjhXHDkpwOFFNOZv6KmUi6/1T97gPMYdGOhk5K66yxgW3mBPNI6TfLsrgY
         3XryEukYy0uUWcpQ95asUs28Qw1Eox08RsBijXKoGft5K+neV6DPDUItWsFo0z4JAumt
         MLTBfGtAxgOxPBNX8RJoLGa4VcCi7Ej+FRDLu+l3sO3FZdAuCzOkWC0ftJO7wMmRmCrh
         4GwHHrc2rXsA3lEyOtloph9YNSRVZfU9aeRy5cTB18O3De9DhWz6jcI3T/FbKQqAmKsV
         JG0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=oQJywcCCzEM8mXQiNt3fOzLIyIQh4hJRiekOYxmYR74=;
        fh=n5ciFnu1NuUVKzXfcNVnqcq4F4/zud9insWqgejXN/k=;
        b=NPRc6aNV4Cvt4yV9Af2geLy/HKn2dNtqaHkVCVsn+Gi7yQiirCFcBv26BFgZn/g/OT
         O81EL02/0fuyVPHt4T9DqmfG/eDTzzr8dRamYluPSzaptXzI7P+yrSiSfBIj1y3dbqPr
         zTaEz1pH1EAiT9qFsZgPlRaVXajV1fRtpLjxGUpckRmvpADQWxnr17Xg94FgooXFJiwJ
         xnBH6E8GnbsIgJNYAGqx4YxTRmcTOJLm6pvYBKzMVgMBsrA53NckC2UT+6s5u//5s0DI
         4VakK3HlTkWReuImnfAZBKaAppRLaN0pS6AyYFUgL6MqcUHPdVRI3smmTm+LAIsops9S
         sChg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794056751; x=1794661551; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oQJywcCCzEM8mXQiNt3fOzLIyIQh4hJRiekOYxmYR74=;
        b=JcW/6QmZ4eP9LlkdxIKHvQb9pWzde4aXSDYGaDIgiuXzKLmOG6k1OKhULj7B7eH7PP
         tQfM+oaqZ+RGDeNirYFi0RDeR8JIjRu/PFxoqrqh49pMSG4GmrOqvpFoh1X2tsrqBJRo
         bFm7rKhPkadryeF7ynM0vyKSyzb5rXx+mwvGu4qEGEJhXkZhj+uEmXhjYAbBIibkBZyy
         EA6618KCestVmGkEXZNCWrXhyKCGirBw4iX8XOsSoTEMFTG2kAxRMghoeg/ZyIsTwkF4
         KXa0zdhHwW+lzkmreU+VNdH0jWKUqqCrCM6IjDxEHSbwT3Mm279LiWXfygyNbf60VjCK
         xtOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794056751; x=1794661551;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oQJywcCCzEM8mXQiNt3fOzLIyIQh4hJRiekOYxmYR74=;
        b=zaBsMjyFdBlD/sLKCeMfdy50m/4akZX+t3JjN/IP7auSwqU5FVZFSmRsbjPT4j010H
         vXFQzIkxgTXQTb2fk3aG73f9dKVoGTlPHOBhQwQBo3M+g2HYjsv+UY7MocheHOxaf6Dj
         CvVvVkzr3aFuYSb/62w+Ph8I1iID6BlP9Okl40+C4MuDpBm9t/jDXlz9qvlNw2onoKJC
         1VakmP5iHap8ujTU4mmrp6FHHoY8hH1g5pCYF0q7CpQ5BU5gECF54ccEa1GDpTUI5M0j
         FO3B97Iz27dXtRS2AwkDIosuhYo+uh8x3ZncyH/cn+LWfjoS2++AZvuJJ/UKBGJi5Vz/
         lobQ==
X-Gm-Message-State: APuU4Z8Xl+IirAoPazTWSPZ0MGUDaEcNZ638vwYTUeDyGAX62lRYbsNw
	r6bI6ht/F8MeFIVqdDe5CKeiRViXfZWt6c3Lh/fqzp0/m8MKHJ87YBl4mIj/RDca+PnNEkurW+8
	KgyMHy7KwBShRMCKHojTxkvvSMGShWoA=
X-Gm-Gg: AYBFou0LPKy9q61Jqq9U+xTpxkqMZ3OqIOZiri924Jpxv+KeLKWrHabEQtwybk48O9d
	0Ci1T4XQULkwTds3duygaN0ZQceQaWrRdpnY7XmRcVe6UAMb9gb8TDzl9h/QUWL6tz4Q2PlpCK4
	mRhD8YxOg+Ec078KG+kQ3QDLrIpXa+Ew6xfmmvamZMBRLQC/uUg/pjF0Zz38Re0Hcu25xJiJkC/
	QYqQOK86oeJlqXDrNfZ2U2lc6ovIPo8+0WM2siDZktCmSP9xsJ8VcXPQaXLyv+BhJohFZp9hMU+
	SwaFGWqhEwZ6l1f3o8oWrFr3BupkG2yyOt2vA91d5EkfUIcqbaelOrKdk14Y1k2KeY8NnOunzMV
	5S0Hh4huyrrphFFbjvA2EvkOVT2oQ5SucQh0jHA==
X-Received: by 2002:a17:90a:d88e:b0:3ad:c482:ae9a with SMTP id
 98e67ed59e1d1-3b0db5ed5f3mr5380332a91.1.1794056750595; Sat, 07 Nov 2026
 05:05:50 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Laszlo Burian <blktk2000@gmail.com>
Date: Sat, 7 Nov 2026 08:05:39 -0500
X-Gm-Features: AclHuK_Nu6d4jiQSpYGFEFSB-JOYChIi0OQWBT09P6aoABeV0XFldC_HzcBMWc0
Message-ID: <CAFgCxzCT2uo7ujUJN6V7gsKHcC=61A=oqptzX0Ktnnb7qeqnVw@mail.gmail.com>
Subject: [REGRESSION 6.12.y] ALSA: usb-audio: please backport 70b4db7d2581
 ("ALSA: usb-audio: Use the right limit for PCM OOB check")
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, linux-sound@vger.kernel.org, tiwai@suse.de
Content-Type: text/plain; charset="UTF-8"

Hi,

please backport the following commit to 6.12.y:

  70b4db7d2581 ("ALSA: usb-audio: Use the right limit for PCM OOB check")

It fixes ef5749ef8b30 ("ALSA: usb-audio: Prevent excessive number of
frames"), which was backported to 6.12.114 as 81e4b0009f2a, but the fix
itself is not in 6.12.y yet (checked up to 6.12.116).

Upstream, ef5749ef8b30 caused choppy sound on a Behringer UMC2020HD
(https://bugzilla.kernel.org/show_bug.cgi?id=220997). I see what looks like
the same regression on a Fractal Audio Axe-Fx III (USB 2466:8010,
snd-usb-audio, implicit-feedback playback):

  - 6.12.113 (Debian 6.12.113-1): playback works
  - 6.12.115 (Debian 6.12.115-2): playback stalls. The PCM is RUNNING
    but never moves; /proc/asound/cardN/pcm0p/sub0/status shows hw_ptr
    stuck at 0, and clients like PipeWire/Firefox hang waiting on the sink.

Going back to 6.12.113 makes it work again. The only usb-audio change
between those two releases is 81e4b0009f2a. Its check
"frames + counts >= ep->max_urb_frames" cuts playback URBs off early,
and 70b4db7d2581 replaces it with a check against ctx->buffer_size.

The later 06be918062ad ("ALSA: usb-audio: Bound packet copies by the PCM
buffer size", Cc: stable) touches the same lines and depends on
70b4db7d2581.

#regzbot introduced: 81e4b0009f2a
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=220997

Thanks,
Laszlo
