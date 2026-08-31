Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC53E55D872
	for <regressions@lists.linux.dev>; Mon, 31 Aug 2026 13:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788184052; cv=pass; b=RcK3mUhBIgfy02b8SdfQzzFHetV2Oy/6mrEOo8h7gD6hUcig61PhyiOq7MqaL4kzfLNg9AKC1qIRhl+uYvyxrXn2rkQRYr+TIKqtt8YrFFZhjH/mcJa61td7ZDpyNpfB2oGQG+lYpG3R2oDQoEUh7pxpfdGSO78IciAhPrCfbFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788184052; c=relaxed/simple;
	bh=cFSV9KhWwH8UTBQ/C/MspQ/RwmMPKmn69329QrcNpjg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=lCE1+wClJbw55ACUCFzvi0xAAm6mOlMP3CT1f6fDTWaNl3ubiSdAG8T+BDVP8rH5Bm7JyknrNuzkO3EAnCY5eYtV2vFF8ZTVbRnWVEs6QEPcuQ7E+fuUFMYSdNsS6FBxz4cZ9M3Vw/q1iVwB+QgVp8IS5dOakm/tq9T+Muyxv/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMoXf/jU; arc=pass smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMoXf/jU"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-902e4af2d9dso41825226d6.0
        for <regressions@lists.linux.dev>; Mon, 31 Aug 2026 06:47:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788184048; cv=none;
        d=google.com; s=arc-20260327;
        b=XuQfOedsmbEv+N5wGohaZG63isLbUsSFlhJJv49faO8KQqtTpDckpAXhHIYeYNyTWt
         zb+FFXYLkztr2RpPb7zra9Ilww38yJtiyS7dyAc8a4ZBh0glo9jVZC2vEE8najYuCrjR
         h+KfrZwlmFpi8tNxYJgRhzX+4VsURmBe60xgJqKDYh/mzSTqAE28hHhcv+fUMZ7mrOSt
         GnDKX4pXe8GvONdZ+x7xraHba/6SFWygIEGDfXEuhiyFN18IR6zY+hbtPO29ytIBoC6k
         UuebSDqZa4wG+zyFYpKZyqIlWEiupujCN5UyqyQTFKjT2okgQiMMtZdfQXPoxDDJYnAR
         +bPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=cFSV9KhWwH8UTBQ/C/MspQ/RwmMPKmn69329QrcNpjg=;
        fh=MDXE10nGoCDgvUSXMaMflaO6KszhysLuc71Ky5lF0Q0=;
        b=eKZa53hO316qG6N+bs9Rayjdo5JH/iVo1ihqJBfR5E8G4+3GAZ/4qNrkgg4zXYRTG+
         kGRHr9CvdS/x+ZtQYjqNi2Wn4XTJG0GvAdj3LxZGJ8FWtouCAwFJxu7G93A49QWM61PW
         OXnWcdF/Nt3AwEqAXTx4zUmI4JC3H7H7vj0pIV37zQOMFr5B+j0WrRwboTjO/F8pvT/U
         EV+3FpFQUI+Qoupd6DP6McAhSFQk8TNc3MvejSePGZ5dCs34d1IFXS9NgRGTC8uLoZo3
         63IlXs8BMQGwe8fvXL7sS5GSiUgq6LWgEQ/DdyazbUKYGFALF6ILNb+bl25zuHWRBNIJ
         0U+g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788184048; x=1788788848; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cFSV9KhWwH8UTBQ/C/MspQ/RwmMPKmn69329QrcNpjg=;
        b=OMoXf/jUnK8j/QmQSbnTNo71d5yzktgG6RFy1vw2qs+DHCAJn6Fx+nbKC8TxKku0wj
         ecTnAKnJi6/SaShtTVT4BVK851tCVsGstGYrbCQB76xkRqhSBsDgahR9hDDbtP0ZskiU
         tjfbXGcozaT+ML5dNgAEUZEIXBiU5LiRHH2Og40OybImCGWlAWUc3SDyWNNiEzXKixYO
         4jd7IUvWbhuZ40UP748ivfp9VEca0EeweLLclZpt/bhqUbw76JrwTBtwipucx/DS42zu
         t7ajtrbO+2jOPjLDK5aaUkWtynlAfixw2coeJJeMWajEq3emCuf8/egxoVgjrFHTmP5Z
         MESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788184048; x=1788788848;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cFSV9KhWwH8UTBQ/C/MspQ/RwmMPKmn69329QrcNpjg=;
        b=NLbd/gVMq8Py78+sHxJmiVkFWv0U64eh4gV2aku5ligtkWLOvA6KvUtQ6RjCCtAwWS
         XjiKU4oyM29WhuBjNGwh2foG1DQvKWRn5wfgUOEJkVGfXt4Gd9Irw/WSmPtLlHnBzLBz
         JIfNaaUMdMZGRs11PU+1Ezvq+XcOWJq1hBVAgT0FUbLIeoHFujb0mNNGXUHJ541AvAz3
         GFVclaoTTPum/Pqf4Z80YZG302n3G0MDB8241hmesRu7PQeUaIMDh5K5ncAJdHXAmSR9
         C0gZRyelWFHmL+0eznHxWs0wEgdM4XrG4F1JQrkf1eTyw9NEFSZFDovLUv6IVfDvhM57
         uorw==
X-Gm-Message-State: AFuF++ncY0DqyhlXVphmBdiVwannLiPPJ0tg+RvyuZmSZUnCYomM4owC
	GmAkYF7rrw4+uEfQmN6QoGihYyJE1FegNJyU5qI+RinsOHbhwmokxrRaGvZX7Vp31VW90DJe3VV
	6ZIdfbM0Mph/udtYE6G8Ys8Aq3gohLg==
X-Gm-Gg: AR+sD12YvJNyl8IRTiNKnTZADuli1z94tdXojQb2NNR6BBAtnbnJjDiNLGI8WaVY6kf
	YjwtR+hvilCGRJKSPpPkbNA9CCO4m4ru3YU8deQlS5TrUDd8zSzUFEm6vpxxg0fIqQOVzX2Laej
	lp8kCXJl89+VX7RXs8weRO8zSrBCB0q+ZnZnJOKC/Y29/1bTPEUO+dkrnb6q07Pa1AzZNqDFfgA
	lYfECNLyf3G+qTkRLRqxep8NQeid7BSr6wAwfJQRj0EIA60dGMQ04FSsu1gJkaihbg+YwvZ4Mh+
	FocUZO9YTdKQMVN8mdN+ft2r5pogBQp3QDRaW17a0zl3
X-Received: by 2002:ad4:5c46:0:b0:8fe:57d4:69cd with SMTP id
 6a1803df08f44-90e87197c3amr94853606d6.14.1788184047385; Mon, 31 Aug 2026
 06:47:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Robson Candido dos Santos Alves <robsonalves.us@gmail.com>
Date: Mon, 31 Aug 2026 10:46:50 -0300
X-Gm-Features: AcwNN1XiVRIDsV5MvmN1_ctjQnb_kUYK7ID-dXE41cp2gLJaxtcLOJ1RhzUegpg
Message-ID: <CANkdJ2VvJQSBzyOq=LgSW1=Z8-YiN_r9Py2iJ0UJDo55+dbfuA@mail.gmail.com>
Subject: [REGRESSION] amdgpu: "pixel format with alpha exposed but blend mode
 not setup" warnings introduced in v7.3-rc1
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

#regzbot introduced: v7.2.2..v7.3-rc1
#regzbot title: amdgpu: "pixel format with alpha exposed but blend
mode not setup" warnings on Renoir/Barcelo

Hi,

After updating from kernel v7.2.2 to v7.3-rc1, several DRM plane
warnings regarding unset blend modes for pixel formats with alpha
channels started appearing in dmesg during initialization.

Good Version:
- Kernel: 7.2.2-070202-generic
- Display Core: v3.2.384
- Result: Driver initializes cleanly without plane/blend mode warnings.

Bad Version:
- Kernel: 7.3.0-070300rc1-generic
- Display Core: v3.2.392
- Result: Driver emits the following warnings in dmesg:

[drm] [PLANE:44:plane-0] pixel format with alpha exposed but blend
mode not setup. Please fix.
[drm] [PLANE:51:plane-1] pixel format with alpha exposed but blend
mode not setup. Please fix.
[drm] [PLANE:58:plane-2] pixel format with alpha exposed but blend
mode not setup. Please fix.
[drm] [PLANE:65:plane-3] pixel format with alpha exposed but blend
mode not setup. Please fix.
[drm] [PLANE:99:plane-7] pixel format with alpha exposed but blend
mode not setup. Please fix.
[drm] [PLANE:104:plane-8] pixel format with alpha exposed but blend
mode not setup. Please fix.
[drm] [PLANE:109:plane-9] pixel format with alpha exposed but blend
mode not setup. Please fix.
[drm] [PLANE:114:plane-10] pixel format with alpha exposed but blend
mode not setup. Please fix.

Hardware / Environment:
- Hardware: AMD Renoir / Barcelo APU (DCN 2.1)
- CPU Scaling Driver: amd-pstate-epp
- Kernel cmdline: BOOT_IMAGE=/boot/vmlinuz-...
root=UUID=87f96fe9-4a93-4725-95bb-dd53087bb7a8 ro quiet splash
crashkernel=2G-4G:320M,4G-32G:512M,32G-64G:1024M,64G-128G:2048M,128G-:4096M

Let me know if further logs or tests are needed.

Best regards,
Robson
