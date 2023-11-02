Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8B319BC2
	for <regressions@lists.linux.dev>; Thu,  2 Nov 2023 14:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MX4MYehI"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6c3443083f2so278056b3a.0
        for <regressions@lists.linux.dev>; Thu, 02 Nov 2023 07:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698934312; x=1699539112; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeyFP7WMW0RjDqklzVx1kbYfEg/rdHyVxFLBKwTmGxA=;
        b=MX4MYehIYtNOwvZZDn6m8sXZ4QoShExlUWKFdNwa2qYotqeH6vbepapaseXRAu2XOw
         ABrcYoSYMH2j/2Q05mQkXkJzawPP6fLZyQ8YCrqnMH10eJkw458UAonObuXjVDRq76kP
         WhzAAVR3gsNdRe/Hl9pHEtBH1IRex/pmX4GiVQA7EFgKxwcTotDp2KhoKvKiLD2Hj6bN
         G4SF3CgGNtRackw6fJOBkTe52r+3Z8hnU0Etp+OKlEhhie91gwDzWOpUF/6ymT2mgC7V
         AlBTzqxCvdW93h9fEYrBHByyCpu1Lj70hMFqR29+YfHQp86Sq3ujzhXwpWiTCRkFT8/x
         qs5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698934312; x=1699539112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YeyFP7WMW0RjDqklzVx1kbYfEg/rdHyVxFLBKwTmGxA=;
        b=gB9hs9qP+MVeQS78RMNBdZLRpkt/uokEggeFBoHG5NM0pv7n60QNUmxiCsq6VDRZOs
         RHM6mMPoDUPv8hp7bm6erTJOm+hymjAbF2k8N/skgeyZ9uUd9S58AXvTdisfYJbNHfGu
         lTwGB4FDamMs2cZRL80cUJwLaSrIGENiZsQ+dbSzyOVT49efCTg+dZBR1HOrgccfHstC
         n0Q5kmPS9/6i/j9QmHkkJvgzJTxcX0RGEk+3jE/tiRH+jcrhMigEHIw/G50scYwytrnu
         ztdHrL+PNW3thZt67AKSufggjEcJ8kpg8Jodp1GWp+Ot6Wa3V29F0/Yi2e6PMb4d3+i3
         GU2g==
X-Gm-Message-State: AOJu0YyO9FA9AXJomJAd1jWmywUPsJd+ua4iN4Seh2xvqGqmo9tpUr/f
	eIe25t2E1FZ5AgzR2Fzy8UA=
X-Google-Smtp-Source: AGHT+IEOJ0B7C0nr9peL6eqLxZmuiUXorl8e5tMZ2eb2nOkE3SyIQIQwO5CMJg8XGG7sEFw+ZGTAGA==
X-Received: by 2002:a05:6a20:548b:b0:14e:a1f0:a8ea with SMTP id i11-20020a056a20548b00b0014ea1f0a8eamr21471203pzk.3.1698934311673;
        Thu, 02 Nov 2023 07:11:51 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id v5-20020aa78085000000b006bdc8bb2ed5sm2945197pff.82.2023.11.02.07.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 07:11:50 -0700 (PDT)
Message-ID: <6929ebbf-f2e0-4cd4-addc-1e33ecf3277f@gmail.com>
Date: Thu, 2 Nov 2023 21:11:42 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Input Devices <linux-input@vger.kernel.org>
Cc: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>,
 =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>,
 Bastien Nocera <hadess@hadess.net>, Jiri Kosina <jkosina@suse.cz>,
 LinuxCat <masch77.linuxcat@gmail.com>, Marcelo <mmbossoni@gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Logitech G915 Wireless Keyboard acts weird on 6.6.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> Hello,
> After upgrading from 6.5.9 to 6.6.0, my keyboard started acting really weird in its wireless mode, key actions sent are completely wrong, see video attached. 
> 
> Most keys are perceived as either E, 3 or F7, with F8 and <, as well. 
> 
> Modifier keys (CTRL, ALT, ALT GR, Shift and Super) are working normally, as well as media control keys (pause/play, previous, next, mute and sound up/down).
> 
> The keyboard works as expected if it's wired.

Another reporter bisected the regression:

> Bisected to 
> 
> 9d1bd9346241cd6963b58da7ffb7ed303285f684 is the first bad commit
> commit 9d1bd9346241cd6963b58da7ffb7ed303285f684
> Author: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
> Date: Sun Jul 16 18:23:44 2023 +0000
> 
> HID: logitech-dj: Add support for a new lightspeed receiver iteration
> 
> The lightspeed receiver for the Pro X Superlight uses 13 byte mouse reports
> without a report id. The workaround for such cases has been adjusted to
> handle these larger packets.
> 
> The device now reports the status of its battery in wireless mode and
> libratbag now recognizes the device and it can be configured with Piper.
> 
> https://github.com/libratbag/libratbag/pull/1122
> 
> Co-developed-by: Filipe Laíns <lains@riseup.net>
> Signed-off-by: Filipe Laíns <lains@riseup.net>
> Signed-off-by: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>
> Reviewed-by: Bastien Nocera <hadess@hadess.net>
> Signed-off-by: Jiri Kosina <jkosina@suse.cz>
> 
> drivers/hid/hid-ids.h | 1 +
> drivers/hid/hid-logitech-dj.c | 11 ++++++++---
> 2 files changed, 9 insertions(+), 3 deletions(-)

See Bugzilla for the full thread.

Anyway, I'm adding this regression to regzbot:

#regzbot introduced: 9d1bd9346241cd https://bugzilla.kernel.org/show_bug.cgi?id=218094
#regzbot title: Logitech G915 Wireless Keyboard key event only detects few key codes
#regzbot link: https://streamable.com/ac6l8u

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=218094

-- 
An old man doll... just what I always wanted! - Clara
