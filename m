Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C05188CCA
	for <regressions@lists.linux.dev>; Sun,  9 Mar 2025 11:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741518651; cv=none; b=LSwKgIeAc5GIlYZN/Tgfod6r55mscTHqA/qh0kY4P0MbJo7uswjmMmQhbtQgf/rHK+FDvD4yM6B+h+0SI5vbKOWU/KVCV3XQwHC8zGUqbSJQr0GIre8qMxAltuJE5W1b1s6tdF+m58fuQKp1Q2IBcXaxIjprXiHHLotHaOY+BPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741518651; c=relaxed/simple;
	bh=644CRviD6GrqxWN1ekGrSrjkSI7l0tfQNMAayW9zwHE=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=eBIx6umDiper2LBZWswKVqepP8kD9hiYbcPvi5+47N1vP3rpVDCmLxRpQRanjNTGiPpwkkIp+pHvxCmE73RBywFCVpoZD/ZmHFcmSTyaLx33kq8NfUk7XaqTHR7nHABjaFa6ulHn2iILu3kw32IghNkDqqCKZecBnyCC1mz5gBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=qC1A6Vu5; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="qC1A6Vu5"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6feb229b716so29171867b3.3
        for <regressions@lists.linux.dev>; Sun, 09 Mar 2025 04:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1741518648; x=1742123448; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iXwc25dr88V3+t3stY/+DsQdt4eu2Nbd2Q4USAbecyU=;
        b=qC1A6Vu5vQiSznnUTNenonStDmxJyooIJryczXlB1O62vYuvkvKV2PxrCNTkqJ9Il4
         aTsQXV6n+SUFfTv+HKyBYhMUSb7yQKy3Bcb1yKAhkPB8CnUdd8cHPIyigOS44EKyXdoa
         7AggrnJyQDL239pBlmKdZv6GbhiImVf8u+pbtVvuYDVZFU8M+nA5dZ+wnPdVXzgk6QcV
         HwFHK+R7aW1m0Vx2Ss734FyUw6zL/HsbHwxyevVkdmpRm8H6uHz3mefb0RP1z9bcuaKe
         Nk1NBkdWaQKi2MAm80Wd2jL5Gc9u5/jDuUJm+z/RIlxDD81788hJamxOwY68nrFUVKag
         9fHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741518648; x=1742123448;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iXwc25dr88V3+t3stY/+DsQdt4eu2Nbd2Q4USAbecyU=;
        b=TBdOD4pa6YZ3zDeZrvCpS9MJILIN1LEaRZlg/pK+h6nc4kAa+Yyo0EDTbQCph62lR6
         Jq+xWdl0zlv35CLxzPonyfU5ffHkGcuh0L2OoTSvjgrd+MsXNQMAemKJqkOqE8NdEvjQ
         uDkTPISIKecdsXiPTq3GAyMVyJIJQJJNKGA+lCI4M04ivZMFTGjuxKdhK/Fn7KNyx2JI
         FX41TOQqAIXDa7zp8mwIoomiH45MAgGT+p/CHo50SuFPlKP7B8IBU0V+gIsAmI8QvtLR
         nCUDMWMyW7LxtESy5kBIyJjaFgh63Q1lC6RJOoj/q3tGXpfl+lvn9KpJRv6e+hntwwX6
         5PMA==
X-Gm-Message-State: AOJu0YxLIcGDfU7DdSZYAM2uFCVCJbRpHheIuFMI5e8Qmcpywhur3zlO
	uw2+ALAodXjja9Vq6xjkPeUPWR86WMAgU2m1evGukWZ9dWB9VrNFv4Wr4bhzjC9kTXAQI3k1VRl
	jVmNdrWRC4cN9cA9jLFGiPiHf9ui1E2CFQ+4ofA==
X-Gm-Gg: ASbGncvH0qVB8NzUWq9fdOOGhSAr89ios5aghxNcbPvEzWXeiaeyX2TZ7GaYBSkGqXp
	cJHZRUxcSvabIT5rvsce4aq8Qiw0sj+oPMxhf6IHzYxLkIjVuZE5TK2+Ke+yDJPoeN+YvhwJ1Lh
	C3YTF2rRVxcRbSv5Lpd2vlC9V6CMIIUe3Nno6uajZaKSRUmKWDkD089kcFxxk=
X-Google-Smtp-Source: AGHT+IG3kvRBOt6F4egCpBQP6QSiomN99ghDoN+4yHVfYaZG/W3PmWUvl37bKmHyaMz9KdbNXzROO1H/2KY2jbK7IGo=
X-Received: by 2002:a05:690c:23c1:b0:6fd:4485:9255 with SMTP id
 00721157ae682-6febf37b96amr137696627b3.24.1741518648417; Sun, 09 Mar 2025
 04:10:48 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 9 Mar 2025 04:10:47 -0700
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 9 Mar 2025 04:10:47 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Sun, 9 Mar 2025 04:10:47 -0700
X-Gm-Features: AQ5f1JrYYuOYeU7_ysG--AWW2SyHAwGDi4tpWPf-9Wux6-CZQQ6F7bt6qwRr_5Y
Message-ID: <CACo-S-3B6d7F10hAdja_iBh7zkbCn-P0Ad5-VnRb19fEErK4SQ@mail.gmail.com>
Subject: [REGRESSION] next/master: (build) undefined reference to
 `btf_get_func_param' in kernel/trace/trace_...
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com
Content-Type: text/plain; charset="UTF-8"

Hello,

New build issue found on next/master:

---
 undefined reference to `btf_get_func_param' in
kernel/trace/trace_output (kernel/trace/trace_output.c)
[logspec:kbuild,kbuild.compiler.linker_error]
---

- dashboard: https://d.kernelci.org/issue/maestro:2158c0d91a33763424b2f4cf76c46c309441f7a8
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  565351ae7e0cee80e9b5ed84452a5b13644ffc4d


Log excerpt:
=====================================================
ld: /tmp/kci/linux/kernel/trace/trace_output.c:715: undefined
reference to `btf_get_func_param'

=====================================================


# Builds where the incident occurred:

## cros://chromeos-6.6/arm64/chromiumos-mediatek.flavour.config+lab-setup+arm64-chromebook+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
on (arm64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:67cac78a180183719575e540

## cros://chromeos-6.6/x86_64/chromeos-amd-stoneyridge.flavour.config+lab-setup+x86-board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
on (x86_64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:67cac78e180183719575e54b

## cros://chromeos-6.6/x86_64/chromeos-intel-pineview.flavour.config+lab-setup+x86-board+CONFIG_MODULE_COMPRESS=n+CONFIG_MODULE_COMPRESS_NONE=y
on (x86_64):
- compiler: gcc-12
- dashboard: https://d.kernelci.org/build/maestro:67cac792180183719575e54e


#kernelci issue maestro:2158c0d91a33763424b2f4cf76c46c309441f7a8

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
