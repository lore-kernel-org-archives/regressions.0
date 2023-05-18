Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663BB23C8A
	for <regressions@lists.linux.dev>; Thu, 18 May 2023 13:58:03 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-52cb8e5e9f5so891322a12.0
        for <regressions@lists.linux.dev>; Thu, 18 May 2023 06:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684418283; x=1687010283;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtLnEeIrEBHNDXbArGbL4j4GJnqryBP0SQagmrUgrGg=;
        b=kTcm+d4G7iqgpvTCfkI3b8fGaNtfV9vlBKbGmmUuo0RMbGD2m2AidjTUMhIzZu+Shi
         y40uBY5VpePtJquZl7rd5RgW+JN3/JG83sG4SJp7GqAI3/1rRmevjv0qbQ5Fs6qjKGES
         HuE8br/BCOtvlrNLEO42LO5GcZfja9+EmJGnsXa0n3mqdQU+Y3HZp4qXsRTNvf0alzZx
         2rf0REXxXY2UudAEvG+c3jbHjnvJCITs9NeUSYlktSQYwjjHKNS6ZKoh7lTCqQXV7H18
         DgkAj6w7Ry9b6cD2qMlUfvePGhkrzWpxXY/5SHbbBu7wlrBE3wS/6m+1bEsGiCobAoc0
         3dig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684418283; x=1687010283;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BtLnEeIrEBHNDXbArGbL4j4GJnqryBP0SQagmrUgrGg=;
        b=YJJiE++3MWVLryO2kEnShumqKIHG4CZYedmSOYfjKb+Dvd7IuWQgrAxPGtZzFmU4wL
         wi0mp9M9PVKmTRs/ivI1uNKABYYoRlxzlugFydjOszyw6a9fzTSWr51/IQn/eeZFLlq3
         +rKicdlpOqPGRTPRLjup/7bVuHHR/VPhKz/DZpHcr3WVPW0W7+oMC5BB1OxnI56DBcPu
         sVLpgwJYij/PASKDKnW0n1QAlVemGeq7XzLKRIi6cAcjMNsY/IOXP6W6YoROoDSqi6Ol
         DXSm2cxWN4hUbV8gMG2XLC71r8kDgttDaAGpExDpV6UwljJkCMW8uWBdoSvVrbCa2j/w
         Swow==
X-Gm-Message-State: AC+VfDxW3srhrmLSpk03JMggmynqPa7vAHua0pIb2/Ag8ByZgOMFennT
	sBfAuwHr38CGKuD0E1z7qXg=
X-Google-Smtp-Source: ACHHUZ6VFuYSvVwA8jyZtwv0QujHXFDBLs+DPUqwJcKSgez51mKzVABj42QGXWnCnc9nv9JhjU9mlg==
X-Received: by 2002:a17:902:e848:b0:1a9:57b4:9d5a with SMTP id t8-20020a170902e84800b001a957b49d5amr2548268plg.31.1684418282737;
        Thu, 18 May 2023 06:58:02 -0700 (PDT)
Received: from [192.168.43.80] (subs03-180-214-233-78.three.co.id. [180.214.233.78])
        by smtp.gmail.com with ESMTPSA id e1-20020a170902744100b001a1adbe215asm1463703plt.142.2023.05.18.06.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 06:58:02 -0700 (PDT)
Message-ID: <71288f04-546c-9af3-e29a-eb3c44e0d948@gmail.com>
Date: Thu, 18 May 2023 20:57:52 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux KVM <kvm@vger.kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sean Christopherson <seanjc@google.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Persistent rt_sigreturn segfaults on KVM VMs after upgrade to
 5.15
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> I'm experiencing sporadic but persistent segmentation faults on the KVM VMs I manage. These faults began appearing after upgrading from Linux Kernel 4.x to 5.15.59. I further upgraded to 5.15.91 and transitioned the userspace from Debian 10 (buster) to Debian 11 (bullseye), yet the issues persist. Notably, the libc has also changed in the process as seen in the following error logs:
> 
> 
> post.sh[21952]: bad frame in rt_sigreturn frame:000072db65961bb8 ip:6c25f82a9a5d sp:72db65962168 orax:ffffffffffffffff in libc-2.28.so[6c25f8294000+147000]
> 
> cron[7626]: bad frame in rt_sigreturn frame:000073ddebeb6ff8 ip:72ad9f44d594 sp:73ddebeb75a8 orax:ffffffffffffffff in libc-2.28.so[72ad9f3a9000+147000]
> 
> cron[64687]: bad frame in rt_sigreturn frame:000073265764b038 ip:67c7b5a0f14a sp:73265764b5f0 orax:ffffffffffffffff in libc-2.31.so[67c7b596f000+159000]
> 
> worker.py[54568]: bad frame in rt_sigreturn frame:000078eef6591cf8 ip:6c9f9b2a604e sp:78eef6592298 orax:ffffffffffffffff in libpthread-2.31.so[6c9f9b29a000+10000]
> 
> 
> The segmentation faults occur 1-3 times daily across approximately 1000 VMs running on hundreds of (supermicro, intel cpu) bare-metal servers. Currently, there's no reliable way for me to reproduce the issue. I initially considered this bug - https://www.spinics.net/lists/linux-tip-commits/msg61293.html - as a possible cause, but judging from the comments it likely isn't.
> 
> The best approximation to a reproducer I have is a Python script that initiates several child processes and continuously sends them a sigusr1 signal. Still, it takes a few hours to trigger the issue even when running this script on several hundred VMs.
> 
> Switching to the 6.x kernel isn't immediately feasible as these are production systems with specific requirements. The transition is planned but will likely take several months.
> 
> I'm looking for suggestions on how to more reliably reproduce this problem. Then I could try different old and new kernels and maybe narrow it down.

See bugzilla for the full thread.

Anyway, I'm adding it to regzbot:

#regzbot introduced: v4.19..v5.15 https://bugzilla.kernel.org/show_bug.cgi?id=217457
#regzbot title: bad frame in rt_sigreturn (libc-related?) regression after 5.15 upgrade

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217457

-- 
An old man doll... just what I always wanted! - Clara
