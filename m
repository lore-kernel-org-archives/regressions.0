Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FBB3C1F
	for <regressions@lists.linux.dev>; Tue, 10 Mar 2026 00:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773100884; cv=pass; b=CJr5Hhi1a9NUsoeVewdMIWAfPT5e9PmgvpJQ/qw/PudHQKAgNnPk2mvs1hY18iq0oMpoKRBY+WtDezBhwiDNWzULkgS7MdqDiQWYoZkJvGqse6C61akohgAIkD9wYiv4wYrrqhKT000Z43ta5dlPPct00NNDhEdYgmMVaahQz5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773100884; c=relaxed/simple;
	bh=aj2/mhOw+/vLYR7j0XunhSKOHIYNbegxzFpbvCsoVCY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=WyJqm/n1651kWSVzk0T24N7CWjRF7LKxm5mFbo9YzpR3VXIMKDyz7wOudAXuVPZyuZm8/2RY79y4bVIBgMkuJhk4VAd9HUPRZ1llkcu6aZsyqPgbTAyVcHfD88tDI7JkUHE2S3yqSMwJ9pOKVsaANu5Aws7HyqW4mEznQ7lItZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RemvuqTi; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RemvuqTi"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-829756f3ee9so5125579b3a.2
        for <regressions@lists.linux.dev>; Mon, 09 Mar 2026 17:01:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773100882; cv=none;
        d=google.com; s=arc-20240605;
        b=EdjABU+7EDaQYovclXERGWET/fO035Zj5TOQ7o8uoxpYX37jKCgcNYPmoGemuDl/yL
         nBlX/tq3i3RQvIEDpHjbz6/V5w/4lwWD1RFSU0vW5De2KnY46lJWJvZTCiY7dLtCNA5D
         BoSzWbT1SseuggyauPgcrM4sHEYaKT+E9neY25Tn72ZiZIeWJ2cJCAz4lRtP2izR8jnf
         rlEcqxxq0tayhi9SGAsvQvAgyrgRwkRt16xSBSJbNBJ4zuKEeI6mL3GwPNAFd8RHAyGu
         tovSjmVRHQmvdWupsdn6JpM1QBTsmlb6a6wwUJoBw6vDBg5A7+BMg+2ykUyFwGzrRaQS
         F2yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=aj2/mhOw+/vLYR7j0XunhSKOHIYNbegxzFpbvCsoVCY=;
        fh=fu+J5T8gE525CvjHGKJ+GDEp70hoxLBqMFUxttow19g=;
        b=Nj/k5MXtf30S8n9IADWMD+8niB/fl/gz8/HQm0OA4oejczS3qMSO1LvIYzMnmSu01c
         cP3OOulEaI1Y6CsQp0oI2/OzmBLcd1Bjst2uivviIGXUsi1R8tSZzqsUatDJwty4U63P
         ruEtTSP7kLK3EBMD/32K9BwI7/lkj2yBu9vijBw9P3aJdvnIbgtqq0RN6MrK4YxdprEB
         tOt8PomlZOvvIUH+7arEOdW0mrIOCphGsbJ8Mh+MdJuAcVzAnnlxS2ubSWqg65VMrHhZ
         dWtt9wKaxstNjtGdcuYRnl3k7Ab7oswwPapFyXhrXF0wONpAcf1FQzcNxxjpDCpX1DWX
         VdiA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773100882; x=1773705682; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aj2/mhOw+/vLYR7j0XunhSKOHIYNbegxzFpbvCsoVCY=;
        b=RemvuqTiaNYPKNxgmVDapguH6VES4JzGvaCOgjV5pDcArxFRHJDGbPDhHoek2Umnls
         NO8ByqDFYxEBzlfieO1IW0pR3cFgYJAIqnS2o3kgmgvSQAfIOpQ0at1Woz+5Xuxd7vG3
         9L3nOTPARNjeorEV12/92r4S9U+5TBoBvTT248D4t966e00Yq51P4Z8cVrLNz2s0W6qc
         DB1INGMwdzMovQZhmZGcG3UnI4brjyJhnPvbNCdqFlugXib6nCBc4XU6782C+Bu7mXsD
         3qgkx9wsbQ5EMIbrz7/qVFdLvWY2IRNgp/ZffkTOORtjc29R7Pbqty5JZ9zrNgyUoPCV
         U9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773100882; x=1773705682;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aj2/mhOw+/vLYR7j0XunhSKOHIYNbegxzFpbvCsoVCY=;
        b=ZfVXx43yWwGuXyAaWTg6gYTpcyCHFQ6ykoRDRUS0w6dbgtRTfxSW/uKi0Q485ULzAN
         D53NuHcjjcvBEuApg3Xita+z/MQZ17iXNj6Gne3q6OWZLfhPTAWqD6HiNEVMjR0vrtHo
         9t9gNJiKe/lgRwmThrtk21K3a2w5JD+51bW8i8brUzFu4LHEGMTAXN4QgMpwjgCtpjSD
         nBnOBjycV1HN7SWxvaK38rXIQ5d9ElY9bybylUm0oM0lBNga5YN49AC66sMzOr+7LBU6
         fLJraNjzzwMoLuvmpx/n4JcZWZSsNKi3BeiP4BMqB+LtORJPS7JnS25qPUAM4sAnP0PN
         Qd3w==
X-Forwarded-Encrypted: i=1; AJvYcCXF8/I7tiU7A7K86OpjqWrU+zCuyCfqKjWBgMLY/QhEHd+gzgeNyUkMXEghsNxvAr8llAMEx/M12Aj09w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/lHfTC3UldGdb5+98ZFXk/D1PBpkELKEj7AixcGyg1eqsyPTg
	3pecSF8fATYqE0/94WsmzOPKgfK/x1uzp8HVjhlQe1WLfxzStlf9z3Z9WZGPLz3h2Ap8Q+aTrQB
	wfHfI0Mw1lILUov/Kilzk779ZMqicVtjYRTAF
X-Gm-Gg: ATEYQzyyS9wE+qLgbAgsmzPtj4sFCDLEGqQ9AJRg4QqdKuitNisn8mhb5wfhSL49QK4
	MP/5ydCvDDYEsi1AOraATC3wfE3sPfCEODYgw4vwevmzvNcovIq18d/CX46esCdEbq68MyTEqMq
	gPU2h/czxRwD0ngILrea4NbEjF+PvRXendMlA6u1MzHY5Y/ha8WXtUuJizfutxPdHy1PnBkTnt5
	TkeOJRTpoUYUT3UYF0N58pv0yd2Gk3unZaJHoLvT/jxCOGkY8hoOlb83BqteQB8RcRzA0YqTaQW
	SPqWPhAxTkE/4aG1wsHx6r+3Z8Cxmb7PVmk4HBD8WDCZviBn9vU=
X-Received: by 2002:a05:6a00:3d98:b0:827:3307:170 with SMTP id
 d2e1a72fcca58-829a2eaad00mr8786787b3a.37.1773100882040; Mon, 09 Mar 2026
 17:01:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?B?SsOpcsOpbXkgQmV0aG1vbnQ=?= <jeremy.bethmont@gmail.com>
Date: Tue, 10 Mar 2026 07:01:11 +0700
X-Gm-Features: AaiRm50pY7ECADzxEHrEGJC6CAC-sKCD4SV6tlcLSz4hX9fclZ7RXRRVe-t1yOo
Message-ID: <CAC88DfsHrhyhy0Pn1O-z9egBvMYu=6NYgcvcC6KCgwh_-Ldkxg@mail.gmail.com>
Subject: [REGRESSION] Audio popping on ThinkPad X1 Carbon Gen 12 (ALC287)
 after commit d2e01e0c5e94
To: Takashi Iwai <tiwai@suse.de>
Cc: Kailang Yang <kailang@realtek.com>, alsa-devel@alsa-project.org, 
	regressions@lists.linux.dev, regressions@leemhuis.info
Content-Type: text/plain; charset="UTF-8"

Hi Takashi, Kailang,

I am reporting an audio regression introduced in kernel 6.18.13 on the
Lenovo ThinkPad X1 Carbon Gen 12 (Meteor Lake, Realtek ALC287 codec,
SSID: 0x17aa231e).

Since this update, the laptop emits a short, noticeable hardware
pop/blip from the speakers exactly when an audio stream closes and the
PCM state suspends. It happens consistently a few seconds after
playback finishes (e.g., after a system notification or terminal
bell).

I have tracked the regression down to the following commit:
d2e01e0c5e947da0b5005ca89efa82baeb232adc ("ALSA: hda/realtek - fixed
speaker no sound")

#regzbot introduced: d2e01e0c5e947da0b5005ca89efa82baeb232adc

Root cause analysis:
The commit modifies the `alc287_alc1318_playback_pcm_hook` function,
adding raw COEF writes to disable/enable AMP silence detection on
HDA_GEN_PCM_ACT_OPEN and HDA_GEN_PCM_ACT_CLOSE.

Because `alc287_alc1318_playback_pcm_hook` is a shared hook used by
multiple Lenovo ALC287/ALC1318 devices, these unconditional
`WRITE_COEF` instructions are being sent to hardware that does not
need the silence detection fix. On the X1 Carbon Gen 12, executing
`alc_process_coef_fw(codec, en_coefs)` upon stream close triggers an
immediate electrical pop. Monitoring with `pw-mon` confirms the
hardware pop coincides perfectly with the monitor_FR / monitor_FL
ports going idle/suspended.

Proposed solution:
Could we revert this commit, or alternatively, wrap these specific
silence-detection COEF writes in a targeted `ALC287_FIXUP` quirk
matched via SSID/DMI, rather than executing them globally in the
shared playback hook?

Thank you for your time and work on this.

Best regards,
Jeremy
