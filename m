Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128BC22EE8
	for <regressions@lists.linux.dev>; Fri,  8 Mar 2024 01:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709860337; cv=none; b=Gxxee6R9Iz0JvJDNFmRoPVx1Z8Lk8F4IGV4J0vc362qwoeL5mRGUd4mD5DTOlU6ZFPSJTo83s3yzVRSA3KZ0h10ahq7MHifSRuhGgDX0oIrPXA5XF7F4ZPQik5fB4k3zrt6PPQAaVvcP8Bsd7nyR92ZbFV+uM32vAY+7EYhNJDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709860337; c=relaxed/simple;
	bh=1ry6AQG7FDQURpCv8xY189XkCSFEOUrLObp2q9zDSA8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=irby/RM44jcQP3QKHEgSm1ZQzYlEjc2mJzbbtTKQNjGEqq9Hxa09UI+9th81HWbEB7l3y+jh4Jcc1m62CjC81XF+4x/VbKwrwLvkOGf4ysGrIEzHRL66VguZXTM0TW0sY00/4IU7fGPGmSaHM3fc7hzZlBdUWRpE9iSe5Bh0xdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IUFWy4Te; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IUFWy4Te"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33e76d653b5so74405f8f.3
        for <regressions@lists.linux.dev>; Thu, 07 Mar 2024 17:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709860334; x=1710465134; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rYDwFy7vdGfEU3AYQcMyBM3b1/hHXEUCIhC7owEbTA=;
        b=IUFWy4TeD4xp/YpIJa0zLLdqBy9LNaUkuWjoNBSuWKFEfjt8eo38aw0T3b1+iEr5hw
         MlqU4srZtyOKdAdL8A/N8bNrWolIUdu+WXIrLQOEPQ1QeogibUkSC2wzjrXn3y2erpWr
         YjE1PsGbUBNloUoQCaOALgbQysWJfnaBpluIbpIMTEtpj9rFTP4fjOVxdKVklLl5Oodf
         HpDdhP5EXJ+O2an4+J8eB9CBXWtDP12SlNypqp4q9SWpu247isr5d8fAq1H8sQPefGP6
         zp+e8IXkJvv5w9On4yjp7DRGURDg6qUD1fxBB2ylniCEs3VCKbFsZT6nbV72bAhhpDIp
         uekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709860334; x=1710465134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9rYDwFy7vdGfEU3AYQcMyBM3b1/hHXEUCIhC7owEbTA=;
        b=GyOJIXpFq41Z6ntjYidch8OLsoZBIH2w3pBfVIaNZaCf3lQ6vdSyT+bzzD0h6WjPSq
         OOnPdg3533xRzkZag4TLHg2FciXNJ9Rw1i8EuGuFGYuBt7FAoYqWfCvpt4Ee35eZp2t1
         gjgbSvKyRbFMCdewuqSeoBUE+N0H1NQ4eGy+hFkfmW8GYdRyO+MSEOoWxVF6ImPJUSns
         nmPaLYR0P2B5Y887GQfK8La8xnouQsB5ROW3tuIcEDzOe/ln6jA2yHVFX+iTlnWmxHd7
         f38rQyn8zyHhz4pT4BSme7ICnIaciac/4qplJCAGU+1eDNhWOy2LDhzqcel/BgwalZ0a
         qT6w==
X-Forwarded-Encrypted: i=1; AJvYcCVyjvNXnefuSXdb2/wwb8d0HDpEt2qJd5442rbnl8WIhzoaviMpizHYTgfeoccfS5N2yItvTS5vKmSNneE2kyhesUJ8d1uC1YdaKtM=
X-Gm-Message-State: AOJu0Ywus22vJRVAwGhIxlSMtNNaNobQxWE+QvBcpe++3mPlxKydxfiC
	WtBCYT8Ny0wFwPnl4df9nvbgFq3Pw+1LOf4VNphKwWkwA+zUYRHZ
X-Google-Smtp-Source: AGHT+IGKMlg7G8idiMgtUIW7KsMqQOgjBUReKZbtn1HelBvnmw950hTkhxqpW8un5mj/gRLn/HuyMA==
X-Received: by 2002:adf:f7d2:0:b0:33d:6ede:1149 with SMTP id a18-20020adff7d2000000b0033d6ede1149mr13774269wrq.35.1709860334120;
        Thu, 07 Mar 2024 17:12:14 -0800 (PST)
Received: from localhost (ec2-18-169-47-158.eu-west-2.compute.amazonaws.com. [18.169.47.158])
        by smtp.gmail.com with ESMTPSA id w15-20020adfec4f000000b0033e767cac6csm298769wrn.115.2024.03.07.17.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 17:12:13 -0800 (PST)
From: Alex Constantino <dreaming.about.electric.sheep@gmail.com>
To: regressions@leemhuis.info
Cc: 1054514@bugs.debian.org,
	airlied@redhat.com,
	carnil@debian.org,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	kraxel@redhat.com,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	timo.lindfors@iki.fi,
	tzimmermann@suse.de,
	virtualization@lists.linux-foundation.org,
	Alex Constantino <dreaming.about.electric.sheep@gmail.com>
Subject: [PATCH 0/1] drm/qxl: fixes qxl_fence_wait
Date: Fri,  8 Mar 2024 01:08:50 +0000
Message-Id: <20240308010851.17104-1-dreaming.about.electric.sheep@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <fb0fda6a-3750-4e1b-893f-97a3e402b9af@leemhuis.info>
References: <fb0fda6a-3750-4e1b-893f-97a3e402b9af@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,
As initially reported by Timo in the QXL driver will crash given enough
workload:
https://lore.kernel.org/regressions/fb0fda6a-3750-4e1b-893f-97a3e402b9af@leemhuis.info/
I initially came across this problem when migrating Debian VMs from Bullseye
to Bookworm. This bug will somewhat randomly but consistently happen, even
just by using neovim with plugins or playing a video. This exception would
then cascade and make Xorg crash too.

The error log from dmesg would have `[TTM] Buffer eviction failed` followed
by either a `failed to allocate VRAM BO` or `failed to allocate GEM object`.
And the error log from Xorg would have `qxl(0): error doing QXL_ALLOC`
followed by a backtrace and segmentation fault.

I can confirm the problem still exists in latest kernel versions:
https://gitlab.freedesktop.org/drm/kernel @ c6d6a82d8a9f
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git @ 1870cdc0e8de

When I was investigating this issue I ended up creating a script which
triggers the issue in just a couple of minutes when executed under uxterm.
YMMV according to your system, for example when using urxvt crashes were
not as consistent, likely due to it being more efficient and having less
video memory allocations.
For me this is the fastest way to trigger the bug. Here follows:
```
#!/bin/bash
print_gradient_with_awk() {
    local arg="$1"
    if [[ -n $arg ]]; then
        arg=" ($arg)"
    fi
    awk -v arg="$arg" 'BEGIN{
        s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
        for (colnum = 0; colnum<77; colnum++) {
            r = 255-(colnum*255/76);
            g = (colnum*510/76);
            b = (colnum*255/76);
            if (g>255) g = 510-g;
            printf "\033[48;2;%d;%d;%dm", r,g,b;
            printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
            printf "%s\033[0m", substr(s,colnum+1,1);
        }
        printf "%s\n", arg;
    }'
}
for i in {1..10000}; do
    print_gradient_with_awk $i
done
```

Timo initially reported:
commit 5f6c871fe919 ("drm/qxl: properly free qxl releases") as working fine
commit 5a838e5d5825 ("drm/qxl: simplify qxl_fence_wait") introducing the bug

The bug occurs whenever a timeout is reached in wait_event_timeout.
To fix this issue I updated the code to include a busy wait logic, which
was how the last working version operated. That fixes this bug while still
keeping the code simple (which I suspect was the motivation for the
5a838e5d5825 commit in the first place), as opposed to just reverting to
the last working version at 5f6c871fe919
The choice for the use of HZ as a scaling factor for the loop was that it
is also used by ttm_bo_wait_ctx which is one of the indirect callers of
qxl_fence_wait, with the other being ttm_bo_delayed_delete

To confirm the problem no longer manifests I have:
- executed my own test case pasted above
- executed Timo's test case pasted below
- played a video stream in mplayer for 3h (no audio stream because
  apparently pulseaudio and/or alsa have memory leaks that make the
  system run out of memory)

For quick reference here is Timo's script:
```
#!/bin/bash
chvt 3
for j in $(seq 80); do
    echo "$(date) starting round $j"
    if [ "$(journalctl --boot | grep "failed to allocate VRAM BO")" != "" ]; then
        echo "bug was reproduced after $j tries"
        exit 1
    fi
    for i in $(seq 100); do
        dmesg > /dev/tty3
    done
done
echo "bug could not be reproduced"
exit 0
```

From what I could find online it seems that users that have been affected
by this problem just tend to move from QXL to VirtIO, that is why this bug
has been hidding for over 3 years now.
This issue was initially reported by Timo 4 months ago but the discussion
seems to have stalled.
It would be great if this could be addressed and avoid it falling through
the cracks.

Thank you for your time.


---

Alex Constantino (1):
  drm/qxl: fixes qxl_fence_wait

 drivers/gpu/drm/qxl/qxl_release.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)


base-commit: 1870cdc0e8dee32e3c221704a2977898ba4c10e8
-- 
2.39.2

