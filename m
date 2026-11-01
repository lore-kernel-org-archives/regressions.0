Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793563546;
	b=KjRh55hvhcOB7OyES1R5qcfA3+LqZ1wW5fa5Jr9nmqesv/LA++CBNqc5VrOfNcSLufWm
	 VRryhhRtCvvtnDNxrvYCiFTleBI/2qAVYPOkLwwH1oKr2j8sDdc7HTSucpTQANc7udJSn
	 MbKMt2kUmWC+MdNoybXRR3LFPuOi+B+b/urbNsvwr/OXAbeYJlmvm2YXEK2z6gxWVpMre
	 TSeJGdXMT5Va9vUB25QbmcOn0NGoSUSl4QyQaA469cG1TZp/jjczNzbAZTS2JaNWdZ0wl
	 r75LnaediPwHGJ+f0qBuIT3TkJruyEr6KFGsAUnNlAJi7BlAW+dqiHsyyj3p2/PH4AQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793563546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=krh4+OoKKCXqNnJY5U556Q+DBROKCm2TWkvzeauItoA=;
	b=Q8DixxRTfQDCJh00XwIma9cd3N0ZGT8PqDCYYq2VVAMqL3+/DVYbGSb3v7bxAyiTYWNt
	 Ji4BLkufZBYMk1xMsLDmx/XjaCkcHwH9HeeSqJwOONWfc1qqs2dmXoMjjsDN9GQXmpMzC
	 HO5zs+wPvbEosaUceKBcEZNRVwrtBd6t+vdni5Y3Tufsoe+Zah46ohUjFsxBYD15chYx2
	 ccnyp24Tq0IrinW+vLiGfglTHt2qN38oX2qFh+J4GB5IYzQMIq62UpRy9Cx/0+Al76e3G
	 DNduAZQuGJkOZd+DTBjQF5nzgbwiPVqQn9NJtNb+o+rBhjvCTVVI0hW+lvCviapK7Wg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ST9rpMaz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3878606A324
	for <regressions@lists.linux.dev>; Sun,  1 Nov 2026 20:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3878606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ST9rpMaz
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab1bb9666aso1652091fa.3
        for <regressions@lists.linux.dev>; Sun, 01 Nov 2026 12:05:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793563544; cv=none;
        d=google.com; s=arc-20260327;
        b=Oy2Lo90Y9ss+bapXvZKC3sToyyt/sEStskmPxTq9XwvC1WCfAATI6tQzoZ/IQs6TAV
         6b/RRKbZjP+hzCj92YCgLo9U3ab2FDVBVz61W0PtpLY7DikZRefIteTa/gqZ4rsXAfdC
         bQJiMu8K5c4gwW+fYNcTipty7rYEZ1vuLtMHMSxGbwPCQw/vPOTHDhclK+F3B4QWQakc
         mhKC9z/AQgf1GD+lOq0oYBEXT83iyJy5lXEJmNgPkR5yFAcen9mNNTQ+HnUD1H/XyVho
         fyMeUQjiCQ+II/TZGH+Iv4rEq4XDX5xIA/Ee5JNQ2TVt3Wr6++K9bL+5nOtB2Qo+Xcrv
         y6sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=krh4+OoKKCXqNnJY5U556Q+DBROKCm2TWkvzeauItoA=;
        fh=SlT7rtRrqODLZyWKd9yBIFcXroR43G1WlaFIcNpLNTg=;
        b=AF8raKYO4ZMUDEV0XvlCv1amKkEtJ2Qh/GJPMotGvW9K4lTFJ76LDSzzVk2Gg3uOGm
         /MmlX54pTc/k7kpzE3ZDcNbcLlnBs50Ug6Z5TWnqf/UK5xLyF4m1t5UVIMbhGDYGhESR
         82DYq7J5ItWTqOooQCopLi1zwiNYaBj8mZRn89sGM+GUW4L85twEzPrLDQeHuFMHu3b1
         0gRtIZmW0Q7I6fTTaqxfqnT/iAb2PCWgwyVmhnRD87bJFc2nQt2Xz2InfEzqZ7+dSv2b
         MU4sU72iKqrbqo/iPg2GLI85mp6h9hMGuhwC1V4uZ9cn253A1CR3TmeRxiS1NnpU/I7M
         AEDw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793563544; x=1794168344; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=krh4+OoKKCXqNnJY5U556Q+DBROKCm2TWkvzeauItoA=;
        b=ST9rpMazaphvUAeH+EbEwXVFYXkOmyHWIZOTlS79Hfj51W6QvVxwTlazNVPqSAcxro
         Wvu8bvJ/s72RfKBjEy2Mz9kqMr/Xn+YJtsjxHqf+p2zqui5ulKymKP1DlzYFxM5aImDB
         V0nXBT0Pa1lzH7m6zVkc6rBP/G/TBWmGs9Lhk41Q2sEThc3WjiV5H5iOntdesW7TsCkJ
         VgbF34VIZpaBuLWBjt1ExsVY2PBhXNVjQnUGNT1CDs8Su4Tb8Qv5AuizTRuG74+nhCOg
         887cFdEpt3KSR+tKY2HxYPro4ip0Tsl7CXbirc/hFyxXzlKLdRUDcleLwTRdj6kHRIBb
         guXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793563544; x=1794168344;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=krh4+OoKKCXqNnJY5U556Q+DBROKCm2TWkvzeauItoA=;
        b=uh0ScogabwCaQdZdqeKVYQxUxGbxv0PACID0MXm+CAgmUbey1YdKiJj9/CmaByC60L
         nOWBwfqaJ8bqjsp0RL961Dzrm3t3AQcz/3oXqBnRr3op5NCjANVcHYpNnSrLC3FETcfp
         0FtUNlVN2HNiPasStWsISsdzkQ5wBi30u1uIdIIHOF2/xPOY171oYWHC0VVT+KiZybjX
         vm6PWthFVaANwuo52Iytm+55AEGkqvcuirPOBC45zM+VKpJt/GDb9H06znIRrP7u0xwU
         QflQNE1fB6/peD6Fz1gB9++h3W8TdXf2FYlbyZYbwjwsl+TQeCIFGb8hRUKabc/9f04I
         Msdg==
X-Gm-Message-State: APuU4Z+2gR2riSNBftO1J3olhuHLmWuHBzun+FvW31UwlUh4HUjetd+m
	Z/1uArEgm0nqonQCSJZqD76/C7VoYGqYGeQHGOqu71oRrESaQhS//CBJlULhXo0sFNoplo5Twt1
	AkZH8Kl+AtkMvh5qi/KKC5lO7LBs+xIw=
X-Gm-Gg: AYBFou3953Q7o7O2PH1t1i63wJ5kCDkcDh1p8RUB9aFk69OspsXBAdpgQdHWMOF9kvY
	4L7Zy2Qu4ERqDlJ804V77o2P85Bca6CiYlmm6fObj7NRffqB7hFaVcdb3ItV6BqGrbfjrVX9Tnj
	9rKeLNrqNHDzYIcw7OpXL0fxzuAcm7HO1VoOYB/M36uLDXUX6dJluFq59iVwTM28yh86jqMnQN8
	vuUICGWIPeZSZgFm/szxrHT2ruzkAoxErW7Wb9nX1eS8/aYCrsqwSYtBjypj5nvL/UrVRn6C4WX
	CmORh10v9rBqpWOAt5j6aMjBH7BCpkm+LJUupvAhPEXn998nUQDoyJvqWTjtqUxy4AN6rzJzzz7
	VKh8ycCGEv2t8BF37tCwslbwao1HZ8qKuDz73YhTfDpUIE/tpThv/1rCBf/43YoaqSGf+kBPaTg
	IiUcIKeLTqHV1f2Mbc8zpqXtzAj+w1FnZTdxqczlo=
X-Received: by 2002:a05:651c:435a:10b0:3ac:b2df:c518 with SMTP id
 38308e7fff4ca-3acb788bd42mr13845031fa.0.1793563543902; Sun, 01 Nov 2026
 12:05:43 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Nathan Blomquist <nblomquist@gmail.com>
Date: Sun, 1 Nov 2026 15:05:32 -0500
X-Gm-Features: AclHuK-cGdQD9fLfRHMjBN8yhdOQqn7YylAdQSjHpyU0SL6gVHBUJ857D77rcnc
Message-ID: <CACOV87VBmya0PKjni5xEYxUaEczk9X_UoUHXSR_HDS2kSJnM2g@mail.gmail.com>
Subject: [REGRESSION] amdgpu: Navi 23 passthrough fails after ef5fcf2a6c32
To: amd-gfx@lists.freedesktop.org
Cc: regressions@lists.linux.dev, alexander.deucher@amd.com, 
	christian.koenig@amd.com
Content-Type: text/plain; charset="UTF-8"

Hi,

I can reproduce a Navi 23 / RX 6600 (1002:73ff) passthrough failure on
unmodified upstream Linux 7.2.10. It happens during the amdgpu-to-VFIO
handoff, before any guest code runs.

Revert/add-back tests on Proxmox kernels isolate ef5fcf2a6c32
("drm/amdgpu: fix autosuspend cleanup during removal") as the trigger.
Removing its added call from -20 works; adding it to working -19 fails.

Tracing shows amdgpu_device_baco_exit() returning -ENOTSUPP (-524)
during runtime resume: the live BACO feature reports supported but
not enabled. The exit sequence is skipped, and a later bus reset
leaves both graphics and audio inaccessible.

The candidate below keeps the autosuspend cleanup and allows the exit
based on the selected runtime mode. In two clean baseline/candidate
build pairs on upstream 7.2.10, the baseline fails and the candidate
restores reset recovery and guest graphics/audio initialization.
Sustained rendering and repeated-reset stability are not yet tested.

Is the selected runtime mode the right condition to use here?

Full report:
https://gitlab.freedesktop.org/drm/amd/-/work_items/6076

#regzbot introduced: ef5fcf2a6c320676bf8be2dadac93d9023b468b7

Candidate patch:

--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -6412,8 +6412,16 @@
 {
        struct amdgpu_ras *ras = amdgpu_ras_get_context(adev);
        int ret = 0;
-
-       if (!amdgpu_device_supports_baco(adev))
+       bool runtime_baco = adev->in_runpm &&
+               (adev->pm.rpm_mode == AMDGPU_RUNPM_BACO ||
+                adev->pm.rpm_mode == AMDGPU_RUNPM_BAMACO);
+
+       /*
+        * Runtime PM selected BACO while the device was active. Firmware can
+        * clear the live feature bit during D3, but the matching exit sequence
+        * must still run to restore the runtime D3 policy.
+        */
+       if (!runtime_baco && !amdgpu_device_supports_baco(adev))
                return -ENOTSUPP;

        ret = amdgpu_dpm_baco_exit(adev);

Thanks,
Nathan
