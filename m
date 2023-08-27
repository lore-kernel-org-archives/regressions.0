Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F639190
	for <regressions@lists.linux.dev>; Sun, 27 Aug 2023 02:37:27 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-57355a16941so944085eaf.2
        for <regressions@lists.linux.dev>; Sat, 26 Aug 2023 19:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693103847; x=1693708647;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZGOqorazSp+I1MKjY1gVz7xYjbzwYMSJxTzcyCljzo=;
        b=OPBaC6TiPZ50X9Puq1TDuSWAMR9dhpAx1Jd9KmmBXToJBmzhB0F/i4qOQtOVSA7VI8
         CMoT/MpVFa83wr0JQAwnB0wd3yz0gB+1iJIBOq00TULCQlx4SdPrnmEj88Fts4+48jt5
         qrTlydjGQeXamK3TD1xNdJKoAq690hZnY0oRsCcNcAvgC2wCCd2dX9OfwxlYb3PxzTJx
         Yqbkbab5fH4pj1qO4gszaH28eNgUpPk1QiLZ/DA2T7jz2yiUgaj5BTWPYzjft97643po
         PPX2/b3058RdlpwALuhoU1mMByGccPCCKVJgbVOe9O9OMJhiIH1PZJHKvnpqH4lIdfGQ
         240Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693103847; x=1693708647;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VZGOqorazSp+I1MKjY1gVz7xYjbzwYMSJxTzcyCljzo=;
        b=G+8+FmvItSe27IP/vmNkIf1H8Jlxh985G6/CbyGpBJY/XNidLS1D5UjiEnFUHH8Zq0
         j5M6f9GeGd/4viM1ayt8RWREzCSEfMioMMydwIBf0QFYMwAN/QNNRxfr+7zXDyb15OrI
         wI7d+c/pJfEXlOxFnvQzoGSzNbHnGdfASfr474QvAAVfQvwkBZS8zemSJQdgw2Lvqv8d
         GhGvYCAKC9LCFLiOWv0goCKqXXwpnIhLg/LqISZFtFY4M+p3T3ZQ+5y69bMm90RifBP2
         D8P44V2J7WbvPq+eiZD/INhu+0IqVtQ4rxYQ3UgflwmKtlanqQeLiTzHPY11NEIYk3w7
         L9jA==
X-Gm-Message-State: AOJu0Yz01hW4OaOtakT418E16nBXIi7BP0u5Jb4I5XoXI0eoLVtnivAT
	HBtbOzlckW3WixrzegPYm1E=
X-Google-Smtp-Source: AGHT+IGeYO4GsiwQZbi7GrBe/9XKREJ4gAcr0G77cOje1bpL7RoMtD7mVFJvF/YYCfNxLS9ldun1bw==
X-Received: by 2002:a05:6358:949f:b0:134:c4dc:9e28 with SMTP id i31-20020a056358949f00b00134c4dc9e28mr25951691rwb.17.1693103846781;
        Sat, 26 Aug 2023 19:37:26 -0700 (PDT)
Received: from [192.168.0.105] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id t9-20020a170902e84900b001b5656b0bf9sm4421249plg.286.2023.08.26.19.37.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Aug 2023 19:37:26 -0700 (PDT)
Message-ID: <5a7f2a6e-46a4-a5c8-fe6a-c2581496b5cd@gmail.com>
Date: Sun, 27 Aug 2023 09:37:21 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@kernel.org>,
 Brett Hassall <brett.hassall@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Wireless <linux-wireless@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: 5c8a79e8e12b ("wifi: rtw88: correct PS calculation for
 SUPPORTS_DYNAMIC_PS", 2023-05-27) increases CPU usage usage for irq
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> This commit improves power saving - it enables the kernel to achieve package C8. To achieve package C8, 3 Ubuntu VMD commits must be applied as well. The combined patch for the 3 Ubuntu VMD commits is attached (just in case). Package C8 lowers power usage on the laptop from 5.6W to 2.6W.
> 
> However, a side-effect of this commit is that CPU usage for irq/155-rtw88_pci has increased noticeably. This commit was introduced in 6.4-rc6. To confirm this commit is the cause, a branch was created from 6.4-rc5. This commit and the 3 Ubuntu VMD commits were applied. The resulting kernel was built and tested - it can achieve package C8 and exhibits the increased CPU usage on irq/155-rtw88_pci.
> 
> Booting and running top for 30 min with the system otherwise idle, gives these results for CPU on irq/155-rtw88_pci:
> 6.4-rc5     - 00:02.9, mostly   0% and 0.3% displayed
> patched rc5 - 00:13.4, mostly 0.7% and 1.0% displayed
> By comparison, an 8th Gen Dell with an Intel WIFI has CPU usage of 00:01.7 under the same conditions.
> 
> Laptop is a HP 15s-fq4011TU 11th Gen (Tiger Lake) Intel with (from lspci) Realtek Semiconductor Co., Ltd. RTL8822CE 802.11ac PCIe Wireless Network Adapter and Intel Corporation Volume Management Device NVMe RAID Controller.
> 
> Ubuntu bug https://bugs.launchpad.net/ubuntu/+source/linux-hwe-6.2/+bug/2025040 provides further background.
> 
> Please advise if I can assist with further testing.

See Bugzilla for the full thread and attached proposed patch(es) that fix
this regression.

Anyway, I'm adding this regression to be tracked by regzbot:

#regzbot introduced: 26a125f550a3bf https://bugzilla.kernel.org/show_bug.cgi?id=217828
#regzbot title: correcting SUPPORTS_DYNAMIC_PS calculation for rtw88 increases CPU utilization
#regzbot link: https://bugs.launchpad.net/ubuntu/+source/linux-hwe-6.2/+bug/2025040

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217828

-- 
An old man doll... just what I always wanted! - Clara
