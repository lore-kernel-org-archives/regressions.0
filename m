Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.222.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793966479;
	b=bcxpbJEidAc0wkt2qs9HMzW487KmDC7BzQCIaZdQMK+w1Y6vdsK/DT2uQPH4nWaxNIfS
	 x+CiCKPvIDO+sEysjsV87GP/WWpU6CWRl2Ui9wWLcBIhlkVgrk3c/SkG5KbqUIEnsNf6a
	 xACWivVmfPrgbwjIXRXd53qvNbDHaUZe+0GRgb98PU64q/CF2RFvwJ+6FByEFtYFTdx9A
	 Qft1DxRhUQnX7z41/f8+SOFxtBVxJ5SpKzx4+UJyy+bZOncb55u/doodnjd4pGJWC8vdw
	 qjnL+C3dwS69xOawYnzr9lpnIN0ww/dB5tZmd+1qkrQ1Lk9cidmhjmG81wKKqupBuFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=7Atkv8Av9+Ao+eHQuMY+XWjPUUdTG2IMTe5rVcJzpas=;
	b=p5pnEdvjfYiuJ4tQgbf5pDpXwA9caAX8SFADaC6GR2iapmLK4aUr/BFfxZNc/kMXFcU9
	 KBAFdci0esrrKfnB+MELQB022JNw5tarWBGL8fVG1TqclsAH33CPPfTebd25JlFbRS7m+
	 9BBIVO+QEcYY33UYt0bqQWBSIscpKO2pierBgdQwJVFgVypejSjkbAxHtWCR35zVc6Net
	 V0pu1tVwhQ0668OpH57bcAIxjHEUJasVHrG3il0deURo2DM1j5TuwEtv8IT+8lXr/vFAs
	 agBVHMCiEcHKm5nlRtLDG9+1UlaE3Pzi4UMJ9azs03jPSrr9zT5PLPW0Pu7xigCtFrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=janfabian.cz;
	spf=none smtp.mailfrom=janfabian.cz;
	dkim=pass header.d=janfabian-cz.20260707.gappssmtp.com header.i=@janfabian-cz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=RfBxkd93;
	arc=fail smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D48F606A339
	for <regressions@lists.linux.dev>; Fri,  6 Nov 2026 12:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D48F606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=janfabian.cz
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=janfabian.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=janfabian-cz.20260707.gappssmtp.com header.i=@janfabian-cz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=RfBxkd93
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93a40a9a01aso204296385a.0
        for <regressions@lists.linux.dev>; Fri, 06 Nov 2026 04:01:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793966473; cv=none;
        d=google.com; s=arc-20260327;
        b=o43vzTPJD0QAPz0sA1saI/Vz23ZYU55Ws/wWbYvcCCzu9Giep6A66EcbK4fV1h/xp8
         Xpgms1MWHfTBYH5D7I5qCPo/C6jdvFhf5pPDUpz4MzFi0VcgolkAWK3lrxBoRImnYSog
         batIQvFBlb3fRd975+dHkhg250wFPoNGUDIl/pJOMyCLIlTa7/Q432fY5DA+3XoBL9FW
         WzABxQtetiZZzgUvkbi0wph+LbF1YOk5htEA0RJbAWvDLZszN4dAbyIjg+lxdHTRjrx8
         NAFpVmOJI4pddrrdBEe7eJd1MWW+tgPhC87gRYwhWlaoOlicOkOCiRl1TwZWuR9nhBFX
         DafA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=7Atkv8Av9+Ao+eHQuMY+XWjPUUdTG2IMTe5rVcJzpas=;
        fh=gNVShcPTINhPjDGQQRWXVzo5beMdEGYBWgFnqfEc5hc=;
        b=M4zFm7TWK1LxmmYriNHIy0dGpUseMGiOu2zG7ktZXeKc07bo0ZxG95d21ogTXRpVvh
         Z1pc/J2caoUZNPXY7smLQbTMCoKpbA3OZsgDFL16GCGQVW8K6deLbxtE9VZUzTbMCa2R
         WarbFWUkAqJVOPCstZ8JGN4qNhP/CkLNA6+/OrHiLjqeo5mk/PUn8gqUDSdPSz8ORIWO
         CyA/GKpimGEoOAVWbgh1x0IUgvbIsLjA/JpB6jD6rQaezjrN3ogzybbs2SiSwbmsrrdE
         j+U4yvGg2LanxbM/yXWzSaR3Ndrqv19awmgrY2s3SXa2bCmwR5X0x5soQt1xcgWZ3uRk
         fQow==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=janfabian-cz.20260707.gappssmtp.com; s=20260707; t=1793966473; x=1794571273; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Atkv8Av9+Ao+eHQuMY+XWjPUUdTG2IMTe5rVcJzpas=;
        b=RfBxkd93r/NDxyRkUsC2VAGLQthItu5qjl2tuezYZZXQveFts6CCXUPHT65I0RbuHv
         yIAQEeMgWCM9BHScdxAnL+wyLKHBnY2DsxHuiRfwzIlTyTMUB5M/YBdv6dRgMo4+6mCn
         gBpEMaAVQ5+9tBSXzUKQ5VrBkjaHamd34onpodjAeGWUP7ltNNfqYIlwNcb5ECQ1rg/F
         tiWQgD73x2YDYtstGS5dIkp68qH+MLCpGChjQ0fq0bLllgQGZ2CwNCiH4MWdG7lC80Sb
         JBe/KdOOof6Z0a6bMxtfsZZOA5Uwp1Z14LY39k9+SuIeGa20nnl81m4covLUwe+KuXpw
         tWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793966473; x=1794571273;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7Atkv8Av9+Ao+eHQuMY+XWjPUUdTG2IMTe5rVcJzpas=;
        b=COqw722OD+V0SlVNs/jGQyLSABvZ6hq+cuRcWCPTIEfJ8gyZ+jf6Sm/HdLfKOm/KhU
         gJgN9JOdldE2RKt1FrEFZd6U/lX72u8xEjYCnUOwZND8FA2IzXZYuBp98d8Lym49pdnq
         KQ6dgBcgUA8I0zw2B/lBRghtFJEHJT33XafT7RGGPPBukHragBXs3aEPYgIvuaauBlSl
         xjdvvUIHY07I5LdyaWzRWXeH+gahctQtW3Cwkwd+ZWTFuHY9Fjj+TbxdyLuj2Vt2gjNv
         QRWDZaioTwnbY23F6gq+YiYxvGIkk27HsIJqwlyyO5jS5gepqOVHn3nnr4hmyvPBKdgN
         cNwA==
X-Forwarded-Encrypted: i=1; AKwUvBxJrBmjCO8XfZXAyrcPtu1nPSHCODLlH3hSwVSWnQIgCzAhBPnssrcOvcEh9dywn0DMWekFI5u3dMXWwQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8t6VHfGIxel4UGq4D5bIWT4N7SnCbPALnuEB6JozMUJ223mh5B
	oSpHbbCI5CsfXUsbHDXAe626uEal+L89pcpYRrS91gB3ozME2Fxd3+/J22T2wMXHV4Wtr4D8uq4
	pHFenrsaQUhDuUpVovr3D0nn9vHhM0XM4yuKR4W1zpw==
X-Gm-Gg: AYBFou2PvNRQVwTu5wf0oJUr/1ownfoqGjgu2/DPnEU/eeG1uu3BFtUS6W6cWk4W9H6
	42p2QHaXnQpCY5RLiQsyH0wIxwD0Sa34luE6pwXg6fpf9H7E4lMGcw3Y99IdVR+RTQB0rWebk1X
	hTDKqm9ly9pXzIUyXv2q8+AP+kdiVn8U2yneFz2YojTNGG8XooGKy3x/ffYK7/LGlqOZROsFDEv
	4vx39vfoHEXujGkrx0rUvMmQHYWeidiCrnM6WrJF7aMV49ljalCnR+FSjmlVt35ECBBWT3O65Dd
	pH9pIhQEctLQMkcC1Zfl4gzcNP4irCJCkgprldfd0DPyfdiPA3tVKFtcCqTyNCHNLc9IhXJppiZ
	kI3CmuJSm1wqxI7NpDphfjQBazwZ8rDWnyKA9wPPbek9t56U5mf/uEGZFBoaRbzNJ560eaQo2nb
	Clq/pwQQPzmVnrm8rCLDQSRIrqrHRI68OK9SaB86q1DsxRGfzEdEcJ/RRD
X-Received: by 2002:a05:620a:2794:b0:939:b0c8:b068 with SMTP id
 af79cd13be357-945f34bc0a1mr254496385a.16.1793966472954; Fri, 06 Nov 2026
 04:01:12 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Jan Fabian <mail@janfabian.cz>
Date: Fri, 6 Nov 2026 13:01:01 +0100
X-Gm-Features: AclHuK9A-2FTFvlKyzhSApeifYzSQH0lEyNG7mAx3QstJCDBSgdJAuxX-NobXGY
Message-ID: <CAEwhnkgosQd5hnN0qkH_xVrxngfhCpnALR6Gi7M1j-4tnSEKOw@mail.gmail.com>
Subject: Re: [REGRESSION] Speaker pop/chirp on Meteor Lake ALC287 (17aa:231e)
 -- 6.12.73 to 6.12.85
To: tiwai@suse.de
Cc: kailang@realtek.com, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, mikekarcic@protonmail.com, 
	regressions@lists.linux.dev, sean@starlabs.systems, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

(Reply to https://lore.kernel.org/all/87jysdv4qg.wl-tiwai@suse.de/
sent from webmail, so it may not thread automatically.)

Hi Takashi, Kailang,

Another data point from an X1 Carbon Gen 12 with the same codec and
SSID, which behaves like Mike's: the pop is still there with
46c862f5419e. Turning AMP silence detection back on at runtime removes
it, with no kernel rebuild.

Hardware: ThinkPad X1 Carbon Gen 12 (21KC004TGE), BIOS N3YET86W (1.51),
Core Ultra 7 155U. ALC287, vendor 0x10ec0287, subsystem 0x17aa231e,
revision 0x100002.

Software: Ubuntu 26.04, kernel 7.0.0-42-generic (based on 7.0.14), SOF
firmware 2.14.1.1 with sof-hda-generic-2ch.tplg, PipeWire 1.6.2,
WirePlumber 0.5.13.

I checked the compiled module to confirm 46c862f5419e is in effect:
alc287_alc1318_playback_pcm_hook only calls alc_write_coefex_idx, and
alc287_fixup_lenovo_thinkpad_with_alc1318 calls alc_process_coef_fw
twice. So dis_coefs runs once at probe, and en_coefs isn't present.

Symptom: a pop about 5 s after any sound. The sink goes from idle to
suspended exactly 5 s after playback ends, matching WirePlumber's
default timeout. Setting session.suspend-timeout-seconds = 0 stops the
pop, but costs roughly 1-2 W at idle on battery (about 4.4 W against
2.4 W), so it isn't a good workaround here.

Runtime test, writing the old en_coefs values:

  for p in "0x24 0x0013" "0x25 0x0000" "0x26 0xC203" \
           "0x28 0x0084" "0x29 0xb023"; do
    set -- $p
    hda-verb /dev/snd/hwC0D0 0x20 SET_COEF_INDEX $1
    hda-verb /dev/snd/hwC0D0 0x20 SET_PROC_COEF $2
  done

Results, by ear, on one boot:

- Before the write: a pop about 5 s after a bell.
- After the write: no pop after two bells, with the sink still
  suspending normally.
- The 630fbc6e870e scenario: a 13 s all-zero stream from one pw-play,
  with three bells from a second pw-play starting 7 s in. All three
  were audible, with no pop afterwards. That was one run, so it says
  little about the original no-sound bug.
- The write also works with the sink and codec runtime-suspended: no
  pop after a bell in a later run.

Not tested yet: whether the setting survives system suspend or
hibernate.

Since Kailang confirmed the same SSID shows different behaviour, is
there something I can read from this machine that would separate the
two groups, such as an amp revision? I'm also happy to test a patch.
From a quick look, master still has the probe-time dis_coefs call as
of late October.

Thanks,
JF
