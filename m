Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76B615AC
	for <regressions@lists.linux.dev>; Sat, 31 Dec 2022 01:00:18 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id q2so23566502ljp.6
        for <regressions@lists.linux.dev>; Fri, 30 Dec 2022 17:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=91osJ7/ZYKHOYqA/7nAx16Uv0IEXhd+tnUgTAcY49F0=;
        b=HYWjQw2icIBxd2I5T+r7/GWND9m3HWSCd/2AuVWT57CVNRH8SYrCaEo9KKLbKu236H
         6kaSR0UyTUp66npePavMrc6PjM3OPx6PNMjzh6Y3q/8FpDsiCizQIBWVbCd0kZZLtMwY
         np7jPODVFiugaCC3FgU7By9ht9EE/CWoZcPAvoi1KF2aZ2hF0lfuua+FDxeFUS0m30O5
         4rem5v+DYvNiU039TPkJTHtoPvb+LfF3dd6m/lIwpNVrif+1gZUu2KVI/d2ZCubKocoQ
         k9l7dJL+11t8dDQbpZ8QnQR0GE2WtcITIqZ+O//f+Of1FWB2qw9GYXvR97QSwWkKQAjI
         8jlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=91osJ7/ZYKHOYqA/7nAx16Uv0IEXhd+tnUgTAcY49F0=;
        b=oxgRc1Vly1vKQIvlnAj/9+NBJgoAZhw+7fONclrUC4wj8E4rnwkJKZhIAyCbOOPI8q
         R3Ff9ddxbY1tRSk2ePc38FcF751edmB4j+Yyoc5fWQGbW3xDIzda6chDy9OTditcaflg
         ltiisukyYuXLuslFu0zZPwpMncV3iyYBljTlU3o/mFzi7TI8KN+StzaIsuRszdW7sCbJ
         6si5hdkg9+queQgQRrdQ6ryOha6LtYebtEaD/+Me2g6nwtx6ZH/DeNz7bmZwBpR48TAT
         w0G5tDZRd0N1HHNkEi6hK/TG9isQKDnjwBDcZBdhhI4dfPkYHdh9VyWz+jGuri53CrBj
         5z0A==
X-Gm-Message-State: AFqh2kraryVwsg4qiIAwjO+IiBXlsu+9MKmj1GPQhBWeV/g16VvQQAld
	i1H+DINtuwIAYOg7/Cg13s4vW4SpEBg4lGDhirE=
X-Google-Smtp-Source: AMrXdXvhH1yUFQB5+RfUdnGTmjksUKzjn90EEMIb+2tjgt6kogBDR9bEOW/5dDS78OLDy3Ob105OAzghqI6LzKFaSFg=
X-Received: by 2002:a2e:7a0d:0:b0:27f:d911:acf9 with SMTP id
 v13-20020a2e7a0d000000b0027fd911acf9mr301650ljc.23.1672448416777; Fri, 30 Dec
 2022 17:00:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Peter Robinson <pbrobinson@gmail.com>
Date: Sat, 31 Dec 2022 01:00:04 +0000
Message-ID: <CALeDE9O1+qgn_9z=zTVKbWx3FphEa4y8Dn9f5ORoQgW_gL1dqg@mail.gmail.com>
Subject: Regression in brcmfmac for 6.1/6.2-rc1 for SDIO devices
To: Arend van Spriel <aspriel@gmail.com>, Franky Lin <franky.lin@broadcom.com>, 
	Hante Meuleman <hante.meuleman@broadcom.com>, Kalle Valo <kvalo@kernel.org>, 
	linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, 
	regressions@lists.linux.dev, "Justin M. Forbes" <jforbes@fedoraproject.org>
Content-Type: text/plain; charset="UTF-8"

Hi Folks,

I'm seeing a regression in the brcmfmac driver which appeared in the
6.1 dev cycle, I didn't pick it up until around rc8 but with deadlines
and travel I've not had a chance to bisect it but wanted to report it
to make people aware. I've seen in on a number of devices with
brcmfmac wifi over SDIO including at least the Raspberry Pi (zero2w,
rpi4, rpi400, rpi3B+) and other devices like  the Rock960, Pinebook
Pro etc.

A quick look at brcmfmac shows arounf 26 changes for 6.1 and it seems
like it's an issue around firmware loading where it looks for a device
specific firmware but doesn't fall back to loading the more generic
one, or tries to load one ending in .txt, but then doesn't load the
NVRAM.

Anyway I wanted to report it as atm I haven't had  time to actually
debug/bisect it more.

a dmesg snippet for the RPi3B+ is:
[   24.541576] brcmfmac: brcmf_fw_alloc_request: using
brcm/brcmfmac43455-sdio for chip BCM4345/6
[   24.551460] usbcore: registered new interface driver brcmfmac
[   24.559669] brcmfmac mmc1:0001:1: Direct firmware load for
brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus-Raspberry Pi 3
Model B Plus Rev 1.3.bin failed with error -2
[   24.693853] brcmfmac mmc1:0001:1: Direct firmware load for
brcm/brcmfmac43455-sdio.txt failed with error -2
[   25.717596] brcmfmac: brcmf_sdio_htclk: HT Avail timeout (1000000):
clkctl 0x50

Regards,
Peter
