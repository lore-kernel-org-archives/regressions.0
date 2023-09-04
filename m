Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790C12102
	for <regressions@lists.linux.dev>; Mon,  4 Sep 2023 11:08:01 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-68a3ced3ec6so1080100b3a.1
        for <regressions@lists.linux.dev>; Mon, 04 Sep 2023 04:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693825681; x=1694430481; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGFV9RdXIBN+D6ZdfrgNJVd3fOxwTgeaUelyWOQ2VLY=;
        b=E8Y0BgkE7ZTXP/eavHI12G+ibXlFrU6vz/oi+hppNKWsooKCknrzPcvDhO0yDBKYoT
         4ISsNuDPzbl61GyfENcJ12Qv8dqA1DICE+MgBX4h4zKy79ccg1kPuwboLRoC1OKlQ6hi
         2j/H6MO7OqSG4NUgwAIH85D0s/LOI3avaKF71RazI9RIUPk42gBFVxCAtvpnYbZeYYIA
         bjFKBSeaBk8UDyDSRCVREjNekh7TkXoVf+KjGVZjBw+ERdcjPHTiGoh8+SlrkhTMJCfg
         Ky9OLqqCMbd/foFXZtC3NNOJqN13VAq4qmDcUVMac2m+5cIHgLmHWAsTOaardf0Pa5zi
         SbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693825681; x=1694430481;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vGFV9RdXIBN+D6ZdfrgNJVd3fOxwTgeaUelyWOQ2VLY=;
        b=QTThkTRGM+hdR+mOcuT/krhT3kdgNy+eDmAWp33eSASdhfPnixRcgdQuw682ovcX8L
         +JMmHOtbiPpymEjSfhDJMdfjNnOIsBa1qTV/l1M9iM4yag+52x5Ykzl6Ri+sAP6eutiY
         kkGqlf5oUx61F0bialAEyYV2jdzfr8QQexg8U9JgML4UIM+odSqwWOjSA6gb06AXLTqt
         mdzIZCF5xj6xqjw0UvmJY5H/WumPm2s+POj4q1XJ6/sANUEj/rWHZpWqtvodhRS3+YFZ
         TEPFeJ59k4Uok6fdnt30OpBKLSgSoLS185UUaXNsv8JriGAKTmx49aecPV6kRlI117MK
         yksg==
X-Gm-Message-State: AOJu0YxRtgNav4/LwNaQ2Wv9qdxUTjR3MZWLH+AVEnx3VKYUqviHwTyx
	vjr+p9gFl1N2v38LzV9spHA=
X-Google-Smtp-Source: AGHT+IGSm6XZ2nlG25arT69VYYhZ7sC3wwO1vhYk8pWlyzLHNDl72ZVoXTbaPcZuHWIZviCz6S9daQ==
X-Received: by 2002:a05:6a00:1585:b0:68c:3ef6:2170 with SMTP id u5-20020a056a00158500b0068c3ef62170mr12481566pfk.34.1693825680516;
        Mon, 04 Sep 2023 04:08:00 -0700 (PDT)
Received: from [192.168.0.106] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id p22-20020a62ab16000000b006870721fcc5sm7396453pff.175.2023.09.04.04.07.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 04:07:59 -0700 (PDT)
Message-ID: <8af186ba-5f64-2102-8f9c-3969b0906893@gmail.com>
Date: Mon, 4 Sep 2023 18:07:54 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Claudio Sampaio <patola@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux NVMe <linux-nvme@lists.infradead.org>,
 Linux Stable <stable@vger.kernel.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Lexar NM790 SSDs are not recognized anymore after 6.1.50 LTS
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> I bought a new 4 TB Lexar NM790 and I was using kernel 6.3.13 at the time. It wasn't recognized, with these messages in dmesg:
> 
> [ 358.950147] nvme nvme0: pci function 0000:06:00.0
> [ 358.958327] nvme nvme0: Device not ready; aborting initialisation, CSTS=0x0
> 
> My other NVMe appears correctly in the nvme list though.
> 
> 
> So I tried using other kernels I had installed at the time: 6.3.7, 6.4.10, 6.5.0rc6, 6.5.0, 6.5.1 and none of these recognized the disk.
> I installed the 6.1.50 lts kernel from arch repositories (I can compile my own too if this would be an issue) and then the device was correctly recognized:
> 
> [    4.654613] nvme 0000:06:00.0: platform quirk: setting simple suspend
> [    4.654632] nvme nvme0: pci function 0000:06:00.0
> [    4.667290] nvme nvme0: allocated 40 MiB host memory buffer.
> [    4.709473] nvme nvme0: 16/0/0 default/read/poll queues
> 
> And then it appears alongside the other nvme:
> [15:58] [6836] [patola@risadinha patola]% sudo nvme list
> Node                  Generic               SN                   Model                                    Namespace  Usage                      Format           FW Rev  
> --------------------- --------------------- -------------------- ---------------------------------------- ---------- -------------------------- ---------------- --------
> /dev/nvme1n1          /dev/ng1n1            2K36292CEKD9         XPG GAMMIX S11 Pro                       0x1          1.39  TB /   2.05  TB    512   B +  0 B   42B4S9NA
> /dev/nvme0n1          /dev/ng0n1            NF9755R000057P2202   Lexar SSD NM790 4TB                      0x1          4.10  TB /   4.10  TB    512   B +  0 B   12237   
> 
> And I was able to read and write from it, pvcreate and so on, so it's working. But I can't use a higher kernel version so apparently this is a regression.
> 
> There are other people with the same NVMe model (although different capacities) reporting the same issue on this reddit thread: https://www.reddit.com/r/archlinux/comments/15xbxeo/nvme_device_not_ready_aborting_initialisation/
> 
> I am not sure but I think this issue might've been introducted after this patch: https://bugzilla.kernel.org/show_bug.cgi?id=215742

See Bugzilla for the full thread and proposed quirk fix.

Anyway, I'm adding this regression to be tracked by regzbot:

#regzbot introduced: v6.1.50..v6.3.13 https://bugzilla.kernel.org/show_bug.cgi?id=217863
#regzbot link: https://www.reddit.com/r/archlinux/comments/15xbxeo/nvme_device_not_ready_aborting_initialisation/

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217863

-- 
An old man doll... just what I always wanted! - Clara
