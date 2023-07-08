Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565B653B5
	for <regressions@lists.linux.dev>; Sat,  8 Jul 2023 13:26:50 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-666e97fcc60so1892188b3a.3
        for <regressions@lists.linux.dev>; Sat, 08 Jul 2023 06:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688822809; x=1691414809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qefpVYKHCZIqBOQ2CrloZdhfg0L8/Dnkq/kNB/3pkhk=;
        b=Bh4jKRAud+SLMfpDuZvhOuWWvab4RDEKhavrxjbxVejiSrR+fMzWxPeeW1vtGyyuHF
         kdMj1saKwfyLWfKT3mt+snIhAojrZOZDhRQjLXYCC7DYJ1iERXoJsZqngG7KIsncwBLl
         +TcKsfFX9asYHaOui7QHrDIIQ5TW9cpAaBVmXBsJ51gZs+9Iy6fXR/mGLWs4ry/vAEMO
         Tt6TEjpKaHzFIo5qRTXBv2DQdSkEw+mT2ngyWulwQc207jxPh2ac5QA0xeHuKIhF+Sa6
         XzGAc/BWcGVQTF8llYXfAQoSK0d7SNKiBQ2lfGRHHic4v7ygccf/3Q9bfvdP0kmIjmqP
         Gjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688822809; x=1691414809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qefpVYKHCZIqBOQ2CrloZdhfg0L8/Dnkq/kNB/3pkhk=;
        b=R3kZZxsJDcrrba3nBWVNXKDrw3uW2lJDxVIeQpuIxe7U+AGGdUK8AiJu/ZSKT48l4V
         oFJTXLbkqwI4K+tBMswZ015LQuSMJSWWlV4M79/75pk9Dt9xpieBj7qT5MSps3DyOSM7
         jrtvhdUsb5dsd2lcSBw5xTEWbUFh280PEEfRiDACFFJtEtvyzS6MxLDqdmP7JUiGtFsL
         X6C1bBczfcqMPiNLwo/gbq7u6oNFWAxgDCDdTAQi6kZpeVTEYzQ2jiaLBN7UMhE0kWb0
         yciFGgjTgE9+1iRFiliLEEPxYve76lAZ5khMHgZMylGfK9LjMT3i9YCv8rGL8NYCveTQ
         V9jg==
X-Gm-Message-State: ABy/qLYxvGydc+RUnVtrR0taRJ5kP+BPSOz4+6J9R0YRQAOgZyG3o2fh
	m7DkQQtW/JZGarmOphNq9ebGvKwh930=
X-Google-Smtp-Source: APBJJlH5vKOwcfjVTgfliHx3QT4wZqg41+dJVjnHAppMKQy7YRR6MnuCiQASypm0or5ZJF+NsXMEvA==
X-Received: by 2002:a05:6a20:1c5:b0:12f:eb73:fc64 with SMTP id 5-20020a056a2001c500b0012feb73fc64mr4771396pzz.51.1688822809500;
        Sat, 08 Jul 2023 06:26:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i129-20020a636d87000000b0050fa6546a45sm4364265pgc.6.2023.07.08.06.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jul 2023 06:26:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 8 Jul 2023 06:26:47 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: [PATCH] sh: Avoid using IRQ0 on SH3 and SH4
Message-ID: <5d15a610-b818-4089-9ab4-3390d7cf8832@roeck-us.net>
References: <fbfea3ad-d327-4ad5-ac9c-648c7ca3fe1f@roeck-us.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbfea3ad-d327-4ad5-ac9c-648c7ca3fe1f@roeck-us.net>

On Thu, Jul 06, 2023 at 06:57:04AM -0700, Guenter Roeck wrote:
> Hi,
> 
> On Thu, Jun 01, 2023 at 11:22:17PM +0300, Sergey Shtylyov wrote:
> > IRQ0 is no longer returned by platform_get_irq() and its ilk -- they now
> > return -EINVAL instead.  However, the kernel code supporting SH3/4-based
> > SoCs still maps the IRQ #s starting at 0 -- modify that code to start the
> > IRQ #s from 16 instead.
> > 
> > The patch should mostly affect the AP-SH4A-3A/AP-SH4AD-0A boards as they
> > indeed are using IRQ0 for the SMSC911x compatible Ethernet chip.
> > 
> 
> Unfortunately it also affects all sh4 emulations in qemu, and results in
> boot stalls with those. There isn't a relevant log to attach because there
> is no error message - booting just stalls until the emulation is aborted.
> 
> Reverting this patch fixes the problem.
> 
> Bisect log is attached for reference. Note that bisect requires applying
> commit 7497840d462c ("sh: Provide unxlate_dev_mem_ptr() in asm/io.h"),
> which is also the reason why the problem was not observed earlier since
> it was hiding behind a build failure.
> 

Since -rc1 is coming up and there has been no progress, it is time to start
tracking this problem as regression.

#regzbot ^introduced a8ac2961148e
#regzbot title sh4: Boot stall with qemu emulations
#regzbot ignore-activity

> Guenter
> 
> ---
> # bad: [c17414a273b81fe4e34e11d69fc30cc8b1431614] Merge tag 'sh-for-v6.5-tag1' of git://git.kernel.org/pub/scm/linux/kernel/git/glaubitz/sh-linux
> # good: [b5641a5d8b8b14643bfe3d017d64da90a5c55479] mm: don't do validate_mm() unnecessarily and without mmap locking
> git bisect start 'HEAD' 'b5641a5d8b8b'
> # good: [15ac468614e5e4fee82e1eb32568f427b0e51adc] Merge tag 'media/v6.5-1' of git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
> git bisect good 15ac468614e5e4fee82e1eb32568f427b0e51adc
> # good: [73a3fcdaa73200e38e38f7e8a32c9b901c5b95b5] Merge tag 'f2fs-for-6.5-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs
> git bisect good 73a3fcdaa73200e38e38f7e8a32c9b901c5b95b5
> # good: [6843306689aff3aea608e4d2630b2a5a0137f827] Merge tag 'net-6.5-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
> git bisect good 6843306689aff3aea608e4d2630b2a5a0137f827
> # good: [afa92949124abc25ddab1789dd654214e2e1b040] dt-bindings: phy: cdns,salvo: add property cdns,usb2-disconnect-threshold-microvolt
> git bisect good afa92949124abc25ddab1789dd654214e2e1b040
> # good: [37bd215fc48ef2a399f836d62d2e4a166efb31be] phy: qualcomm: fix indentation in Makefile
> git bisect good 37bd215fc48ef2a399f836d62d2e4a166efb31be
> # bad: [7497840d462c8f54c4888c22ab3726a8cde4b9a2] sh: Provide unxlate_dev_mem_ptr() in asm/io.h
> git bisect bad 7497840d462c8f54c4888c22ab3726a8cde4b9a2
> # bad: [01658fe3d6c02992846a038c8111e70ace169295] sh: Refactor header include path addition
> git bisect bad 01658fe3d6c02992846a038c8111e70ace169295
> # bad: [a8ac2961148e8c720dc760f2e06627cd5c55a154] sh: Avoid using IRQ0 on SH3 and SH4
> git bisect bad a8ac2961148e8c720dc760f2e06627cd5c55a154
> # good: [bc9d1f0cecd2407cfb2364a7d4be2f52d1d46a9d] sh: j2: Use ioremap() to translate device tree address into kernel memory
> git bisect good bc9d1f0cecd2407cfb2364a7d4be2f52d1d46a9d
> # first bad commit: [a8ac2961148e8c720dc760f2e06627cd5c55a154] sh: Avoid using IRQ0 on SH3 and SH4
