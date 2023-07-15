Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09E21861
	for <regressions@lists.linux.dev>; Sat, 15 Jul 2023 11:03:12 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1b8b2886364so16980215ad.0
        for <regressions@lists.linux.dev>; Sat, 15 Jul 2023 04:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689418992; x=1692010992;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=24wxBr9RJX3pgI/ht36f2xCi5Ssby9GZkRBl17Qpdd4=;
        b=KbTMjOO08/oKB7Q+ynBDiQsvYeXJnc6a+SMiW0p1tRA+hPacBKwm/PyF1tdCWrDrON
         MiQZpz2nuZrlWtmSD85bMWXiHpupkwB4w3kDxiTPbVRtQGGO/vXUGi2bi5URxe98f9kU
         vgX9Ep6lDx/uhpJ7NaJO/vuPKX8AharQxvdVLX2/H6mveHKGIvd1Lp9QLcKhbOG2suf0
         wi2ShFNFT9OylP7kJPuWvYqcevrJrWOsjgRdmB6hhEaYzgB9tvbrcrWxGQapXKZrQKMq
         6eIv6eRnKmRCICyz5W4Tt+uPIuqJ0FckPOggh3CiMXRwi09ILjU5shueDysIc410nE9o
         bqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689418992; x=1692010992;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=24wxBr9RJX3pgI/ht36f2xCi5Ssby9GZkRBl17Qpdd4=;
        b=SN0pgwQxxnLmxoaarrh8WPtgxuLArwnSu6LcfZv6B4DDyr8va3M8FfiYw3oCrXkeLI
         gVEkSLOUoDnbDWpGtrw3/DSA945Br3gXtCOVQjNCydk4R4ZwIlFsIrAyRbG23qMfyqgN
         0m71HsVESMilONU7Z5CxHFpJLXVM1j60oHNL9o2MDjPIWZBC+KHN47YdLuGBhJIJCjxB
         9eAPwrPXmWRNWLGp4KXik8qUoUCDgVgT1vbBNK3j+CeScnjoCMwoa5ao3xsr6kCmQmSV
         bSt3ngSDW+stBew1qjS5BmEVo91OI3FTJGNqBd5CRRRgf9OR3mCtpioUet+4Vvujvu24
         eDGQ==
X-Gm-Message-State: ABy/qLaH0rU/5rqVpZfdHZPT7iRw9YsG/We24hno6NZOOMm5HxgmAyfL
	rG8uLRyoKPxwWxNKEAP/gsY=
X-Google-Smtp-Source: APBJJlHnqrTPEPJ1628fEi4wMsVBH9Uvsg4Su67fpENCC/jmlluIs/KOBhLoD6++FAZB4xTlp6K04g==
X-Received: by 2002:a17:902:ee45:b0:1b8:5fb4:1c85 with SMTP id 5-20020a170902ee4500b001b85fb41c85mr5518120plo.16.1689418991928;
        Sat, 15 Jul 2023 04:03:11 -0700 (PDT)
Received: from [192.168.0.104] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id p16-20020a170902b09000b001b8422f1000sm9249357plr.201.2023.07.15.04.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 04:03:11 -0700 (PDT)
Message-ID: <bfee63a3-16ee-0061-94c0-9c9af5318634@gmail.com>
Date: Sat, 15 Jul 2023 18:03:06 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>,
 Tomasz Rostanski <tomasz.rostanski@thalesgroup.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Stable <stable@vger.kernel.org>, Linux USB
 <linux-usb@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: dwc3: regression in USB DWC3 driver in kernel 5.15 branch
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a stable-specific regression on Bugzilla [1]. Quoting from it:

> The backport commit to 5.15 branch:
> 9d4f84a15f9c9727bc07f59d9dafc89e65aadb34 "arm64: dts: imx8mp: Add snps,gfladj-refclk-lpm-sel quirk to USB nodes"  (from upstream commit 5c3d5ecf48ab06c709c012bf1e8f0c91e1fcd7ad)
> switched from "snps,dis-u2-freeclk-exists-quirk" to "snps,gfladj-refclk-lpm-sel-quirk".
> 
> The problem is that the gfladj-refclk-lpm-sel-quirk quirk is not implemented / backported to 5.15 branch.
> 
> This commit should be either reverted, or the commit introducing gfladj-refclk-lpm-sel-quirk needs to be merged to 5.15 kernel branch.
> 
> As a result of this patch, on Gateworks Venice GW7400 revB board the USB 3.x devices which are connected to the USB Type C port does not enumerate and the following errors are generated:
> 
> [   14.906302] xhci-hcd xhci-hcd.0.auto: Timeout while waiting for setup device command
> [   15.122383] usb 2-1: device not accepting address 2, error -62
> [   25.282195] xhci-hcd xhci-hcd.0.auto: Abort failed to stop command ring: -110
> [   25.297408] xhci-hcd xhci-hcd.0.auto: xHCI host controller not responding, assume dead
> [   25.305345] xhci-hcd xhci-hcd.0.auto: HC died; cleaning up
> [   25.311058] xhci-hcd xhci-hcd.0.auto: Timeout while waiting for stop endpoint command
> [   25.334361] usb usb2-port1: couldn't allocate usb_device
> 
> When the commit is reverted the USB 3.x drives works fine.

See Bugzilla for the full thread and attach dmesgs.

Anyway, I'm adding it to regzbot:

#regzbot introduced: 9d4f84a15f9c97 https://bugzilla.kernel.org/show_bug.cgi?id=217670
#regzbot title: regression in USB DWC3 driver due to missing gfladj-refclk-lpm-sel-quirk quirk

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217670

-- 
An old man doll... just what I always wanted! - Clara
