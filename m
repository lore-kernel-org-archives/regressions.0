Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D1337B
	for <regressions@lists.linux.dev>; Tue,  3 Oct 2023 00:01:32 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1c451541f23so2663025ad.2
        for <regressions@lists.linux.dev>; Mon, 02 Oct 2023 17:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696291292; x=1696896092; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=giEViECLPwO3fjVio1lGB0IuquaLWAMa99YP4JVkHs0=;
        b=YxpddktgUAl/BXOqozlbTqSpi9zDmuXu7TQtVbvsPRgiIhAsGFOh0CUlsADNypU0KK
         BCDbtFIiyjO7X94LkXWItm3zlqSPSy2y1G25TvBkCIxBy7xzcnUGuKAKNq70h0NeEL5u
         n5otKvI7fE6gSrct8+qvEKxj5IKKfZKN3gYX6tkDxFoXp63GMjSl5vp32KkxnUHDryW4
         MMoJOXmw+yF+udqOeCKeXSAr4/8MTcMW0Qnbvl061Up1wetVY44YtucZfjgcx/QiKTGh
         E0eCOITHGkkpl0pnKDbnAdVCiQh5tf+P1v0K7g3pC+NCg4r1IzFNeyuxHoRlAqYPJ65H
         HNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696291292; x=1696896092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=giEViECLPwO3fjVio1lGB0IuquaLWAMa99YP4JVkHs0=;
        b=O1C1YSXg/f6Bc3DlW4CSrydD5G7qmAofrBZbio2A+o/DXwmI91c4hWlQerGLFJTpWO
         ReP17VZVCMpol9HhAQeDwxHLrRD9gnPZv4BwISEBJ014mg5I1iddd/kJn+pZgSnLbeaf
         +DxKm6zWYsAadkx3xKtUvm+jfrSIRENwj0wKeGtCEYMPYs+jjaxPMPnizypAFLRICBEZ
         7IMgcgM7MoJMMqZC+X0vIJxMM1qFdEahbQUKHSWk6aI20bulea3a7d6FwEmvI3jsiqsb
         wSU1MgUWOA4P9uUeSuJX9G43jwKzxiLqwY3HUu4Z5ZPKp2YEwpZIL3ojQo536s3L8Zbl
         IYkw==
X-Gm-Message-State: AOJu0YyVsnD8e13vamdldNxrBCysh65WE5D1Q1gztrIDRmWyxko99oo4
	qrbRIfvnm0vbW+GoJ/w87txQo60LfJA=
X-Google-Smtp-Source: AGHT+IGep+h5CidOt2lcVjKUFb4zmJXRx2tKw56kYtoQ+HJ/ZjrNIMHluFLqPHgBUHTuzM0fYarC5A==
X-Received: by 2002:a17:903:4284:b0:1c3:2423:8e24 with SMTP id ju4-20020a170903428400b001c324238e24mr10866641plb.8.1696291292342;
        Mon, 02 Oct 2023 17:01:32 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id jb9-20020a170903258900b001b89a6164desm36792plb.118.2023.10.02.17.01.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 17:01:31 -0700 (PDT)
Message-ID: <c68ff294-0060-4621-82d9-61b6bbc12078@gmail.com>
Date: Tue, 3 Oct 2023 07:01:25 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: rt8000usb driver issue (maybe interaction with other drivers)
To: Stanislaw Gruszka <stf_xl@wp.pl>
Cc: enc0der <enc0der@gmail.com>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Wireless <linux-wireless@vger.kernel.org>
References: <CAEXpi5Rd6Y4umKOWRsCjX0kit=W5ZrVhn=MuRkyvJPwmjjDVnA@mail.gmail.com>
 <ZRj_ovMi-Xbb8i-D@debian.me> <20231002185053.GB402943@wp.pl>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20231002185053.GB402943@wp.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/10/2023 01:50, Stanislaw Gruszka wrote:
> 
> (cc list is too big, I shrink it)
> 
> On Sun, Oct 01, 2023 at 12:12:02PM +0700, Bagas Sanjaya wrote:
>> On Sat, Sep 30, 2023 at 06:04:22PM -0400, enc0der wrote:
>>> [   28.071586] lr : arm_smmu_dma_sync+0x40/0x70
>>> [   28.075965] sp : ffff8000100231a0
>>> [   28.079365] x29: 0000000000001000 x28: ffff4655c01d0ec0
>>> [   28.084817] x27: ffffaced1f227000 x26: ffff4655c6ee32c0
>>> [   28.090270] x25: 0000000000000000 x24: ffffaced1e405858
>>> [   28.095718] x23: ffff46572e84ae00 x22: ffff4655c6ee2c40
>>> [   28.101165] x21: ffff4655c82c3480 x20: ffffaced1db49e08
>>> [   28.106618] x19: ffff8000100231c0 x18: 0000000000010101
>>> [   28.112073] x17: 0000000000cccccc x16: ffffaced1d23382c
>>> [   28.117520] x15: 0000000000000000 x14: 0000000000000000
>>> [   28.122970] x13: 0000000000000001 x12: 0000000000000000
>>> [   28.128421] x11: 0000000000000008 x10: 0000000000000ab0
>>> [   28.133863] x9 : ffff800010023180 x8 : ffff4655c6ee3750
>>> [   28.139309] x7 : 000000067eb29c20 x6 : 0000000000000238
>>> [   28.144763] x5 : 00000000410fd420 x4 : 0000000000f0000f
>>> [   28.150214] x3 : 0000000000001000 x2 : ffff4655c82c3480
>>> [   28.155658] x1 : ffffaced1db49e08 x0 : ffff465704c37558
>>> [   28.161107] Call trace:
>>> [   28.163620]  0x1000
>>> [   28.165777] Code: bad PC value
>>> [   28.168911] ---[ end trace 62dc42c98ec427ca ]---
>>> [   28.183964] Kernel panic - not syncing: Oops: Fatal exception
>>> [   28.189864] SMP: stopping secondary CPUs
>>> [   29.275883] SMP: failed to stop secondary CPUs 0-5
>>> [   29.280811] Kernel Offset: 0x2ced0d200000 from 0xffff800010000000
> 
> This actually suggest that the issue is somewhere in the core.
> But again, without full logs we can not be sure.
> 

The reason why I added RCU subsystem maintainers to the Cc: list
was because the log the reporter provided points warning to
kernel/rcu/tree_plugin.h.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara

