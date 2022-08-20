Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D044E7B
	for <regressions@lists.linux.dev>; Sat, 20 Aug 2022 04:27:28 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id o2so8486012lfb.1
        for <regressions@lists.linux.dev>; Fri, 19 Aug 2022 21:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=wC9lL9Kc6Kp7xZsJEHL/dIwZgeCbFL0R65oEXkMpUCA=;
        b=fXJr+IvqO5eCLb4L0UNuczZ9ytlfp93vBptFNfXYrkEM4z+aLvwjCDezTPjppA0MbE
         0MeM/jpKhgBUvnnC9yaWkqmdX3s76mvgMTc1lDf5Mzmhjxp4KHnPbmUxKpBLKzah5FER
         3jT0ZV/4hcOdQzDAGHvt8T4loNkP74uKIm59r44Ebltvd5D0RztGXXjo944NXqhu9bWZ
         YS5cQ0q2YyuZ4KDbaJCuObYLp4jvsis8zduYJ7THpi75EPKa1pmxFJn0Ykt2YNSBEHvf
         lkw5wVZSngpCxNVehDv4Iijum6BMafTE0qEQjh7/RcLcfb39UqAMGO3Y3tv/YhbiOzYe
         g5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=wC9lL9Kc6Kp7xZsJEHL/dIwZgeCbFL0R65oEXkMpUCA=;
        b=a070WMZNt31xzwWKmZjndisTYmV6Ukmj3gsysZdNjT2wboy9iF3VGnA3K69we7A4/G
         cOnXho7omPAkQdb/RxeCtnljJ6cBM7HJ/tB+qljoGYyB6D2I2HnG17/Duu5wer6m3SLK
         jb+tWCkqh86jvJ759p6o/EsIGVewqA6OgSWSMazyjeEfDfhEJOoEMIdGjBV1zm1NlRbh
         D+nxkNTXrgbWE83rnNl1ZbhOu+C2NPkekiJ5900nquYDIK4AQrcgEyujVMA3u512kiaA
         S1lmAf3+59+he+RhV4Il/uV5a+V/UKmIxLC7uZabxnYfpXOXQE5Ecq6AqxeSLUS7Klc5
         QtbA==
X-Gm-Message-State: ACgBeo2dgxK0IbVUlSQY7htFRJYrCttQaV6ek92yUXiAykwWx82vAQF1
	1g6cm68EAylcPsPyLjOcx6Ak6PsyFvkerT9uvDM=
X-Google-Smtp-Source: AA6agR7p+ven6ErQfFbkAvUx1F1VvXjx8u5VcCIIsX5st+SftUxZQa+jCMMAoIJmnvfUWU+Q1dRvLxf5/wJ06Ey0BoM=
X-Received: by 2002:a05:6512:131f:b0:492:992f:1f3c with SMTP id
 x31-20020a056512131f00b00492992f1f3cmr3188670lfu.565.1660969646675; Fri, 19
 Aug 2022 21:27:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?B?6I+c5Y+2?= <ye.jingchen@gmail.com>
Date: Sat, 20 Aug 2022 12:27:14 +0800
Message-ID: <CAA6RncSwQL5A1Ox3a088Kpp4=-bHPzAGcJa_fEFkiE801tAJjw@mail.gmail.com>
Subject: No Audio from AMDGPU HDMI on 5.19.2
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I experienced this issue on Arch Linux 5.19.2-arch1-1 kernel on an HP
laptop with AMD Ryzen 6850HS CPU (detailed spec below), that the audio
is completely silent on the HDMI connected monitor. KDE audio settings
says everything works normally, HDMI audio shows up and can be
selected as the default output, just no sound from it.

It worked fine on Arch kernel v5.19.1-arch2. Laptop speakers always
work, and the monitor works when connected to another Windows laptop
over HDMI, so the monitor isn't the culprit I assume.

Kernel log from the journal didn't seem to contain something relevant,
but it may be me not knowing what to look for.

This is discovered on Arch Linux kernel 5.19.2-arch1-1, but also
reproducible on vanilla v5.19.2 tag.

Bisecting between tag v5.19.1 and v5.19.2 in the stable tree gives:
308d0d5d98c294b1185d6d7da60b268e0fe30193 is the first bad commit
commit 308d0d5d98c294b1185d6d7da60b268e0fe30193
Author: Leung, Martin <Martin.Leung@amd.com>
Date:   Fri May 13 17:40:42 2022 -0400

   drm/amdgpu/display: Prepare for new interfaces

   [ Upstream commit a820190204aef0739aa3a067d00273d117f9367c ]

Anything else I can do to investigate?

My hardware spec:
Laptop: HP EliteBook 845 14 inch G9 Notebook PC
CPU: AMD Ryzen 7 PRO 6850HS with Radeon Graphics
GPU: VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Rembrandt [Radeon 680M]

% lspci | grep -i audio
63:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Rembrandt
Radeon High Definition Audio Controller
63:00.5 Multimedia controller: Advanced Micro Devices, Inc. [AMD]
ACP/ACP3X/ACP6x Audio Coprocessor (rev 60)
63:00.6 Audio device: Advanced Micro Devices, Inc. [AMD] Family
17h/19h HD Audio Controller

Software:
plasma-desktop 5.25.4-1
plasma-pa 5.25.4-1
pipewire 1:0.3.56-1
pipewire-pulse 1:0.3.56-1
wireplumber 0.4.11-4
alsa-card-profiles 1:0.3.56-1
linux-firmware 20220708.be7798e-1
sof-firmware 2.2-1
