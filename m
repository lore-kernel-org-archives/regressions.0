Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26228628
	for <regressions@lists.linux.dev>; Mon, 26 Jun 2023 01:15:58 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6686708c986so2783976b3a.0
        for <regressions@lists.linux.dev>; Sun, 25 Jun 2023 18:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687742158; x=1690334158;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vAxpc4mOo9pLKmGhYj5zSZwN0dqRAYuo83a1IAsjD2Y=;
        b=p0Q3kJsEYL5vGgthdOtN0O6KoO3WWKMPix1c5lFCgtGJwmRcMUQSpaV04R6L+6Iw2f
         +3dqh4LVkORjKa5jQmkJYkoD3zcfiQlkVfmQolr6M74mDz5DPC0BiTJ/b2xj1sKXYkUl
         UeKneu1GETjjOoWq1s0+O/v+qrazB1lEnL7cLjD7xU2qgjahu5Z309w1cBAxUQu/1n8G
         TkaF/PEkFVRu0D7rYR9ya9c8r/ClPvPiPqVj98psKpSTQUk1034HPbXD5uvXXUrc2vOr
         gpHmd7jczaTdC3gRmAqM2LQJa74w1iVoxxIX+6NJ6DhGf0b3sPZV/kiQoJLrJ46+jI9w
         pOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687742158; x=1690334158;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vAxpc4mOo9pLKmGhYj5zSZwN0dqRAYuo83a1IAsjD2Y=;
        b=ASHC6mp4+KLecJU2wLOXJOzIKBAZHAWtHj5Ibn6pd7F9VuKBN0vav1VS/ijWg/Ng1n
         lrVbmHb+KWx0UHSL3GpY/YnC+lrP6zeOAh9vNA1tfYQIFrEkTthlaMVLFBH4lv1VxzDu
         hc+9H+wViFc5poRClFHiRnAbiS7rT2a0zfN3sQs9YUQEC43UFxgVxyLWNzoE3MDDuwwn
         1ckSxbY0EUW98RnVewiNzrvaZ1V3P9dDMzTZVpKFhbRi2MNzMwkVBgf/6teS+E4poRNy
         ZaaPAdaEMMjFT4CKphM0lBpZ1ZZ8zcjhCvzdIYkuUj9fWwu34uAQMzSvFnzEphS3NKU5
         Joag==
X-Gm-Message-State: AC+VfDydJbQ0tBXyUGSPb1NVWHRxV6rhyk+e955ZaE6CmCCMrmp4CyC/
	oZm8uMY3XGOQ/JXh6CfAhvk=
X-Google-Smtp-Source: ACHHUZ5zUic1RIuJE0aEuxFw7H3zDO/jZUsTfmvRWLtZp89kOAmqBYhH7FVYTdPRFmz8PrhXDFmctw==
X-Received: by 2002:a05:6a21:3292:b0:126:561c:9ebc with SMTP id yt18-20020a056a21329200b00126561c9ebcmr7748180pzb.31.1687742158234;
        Sun, 25 Jun 2023 18:15:58 -0700 (PDT)
Received: from [192.168.0.103] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id j191-20020a6380c8000000b0053f5ff753e2sm2974759pgd.23.2023.06.25.18.15.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jun 2023 18:15:57 -0700 (PDT)
Message-ID: <d18d2a08-9d24-0209-c2cf-baf60bbf5048@gmail.com>
Date: Mon, 26 Jun 2023 08:15:49 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 "Clemens S." <cspringsguth@gmail.com>,
 Martin Belanger <martin.belanger@dell.com>,
 Chaitanya Kulkarni <kch@nvidia.com>, John Meneghini <jmeneghi@redhat.com>,
 Hannes Reinecke <hare@suse.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux NVMe <linux-nvme@lists.infradead.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Need NVME QUIRK BOGUS for SAMSUNG MZ1WV480HCGL-000MV (Samsung
 SM-953 Datacenter SSD)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> Hello,
> since upgrading one of my hosts to KErnel 6.2 i have a problem with 6 nvme disks (SAMSUNG MZ1WV480HCGL-000MV).
> 
> This problem didn't occur with Kernel 5.15.
> 
> Here is log from dmesg | grep nvme:
> 
> nvme nvme0: pci function 0000:04:00.0                                                                                                                                                                                                                                                                                         
> nvme nvme1: pci function 0000:05:00.0                                                                                                                                                                                                                                                                                         
> nvme nvme2: pci function 0000:06:00.0                                                                                                                                                                                                                                                                                         
> nvme nvme3: pci function 0000:07:00.0                                                                                                                                                                                                                                                                                         
> nvme nvme4: pci function 0000:0a:00.0                                                                                                                                                                                                                                                                                         
> nvme nvme5: pci function 0000:0b:00.0                                                                                                                                                                                                                                                                                         
> nvme nvme0: 8/0/0 default/read/poll queues                                                                                                                                                                                                                                                                                    
> nvme nvme1: 8/0/0 default/read/poll queues                                                                                                                                                                                                                                                                                    
> nvme nvme2: 8/0/0 default/read/poll queues                                                                                                                                                                                                                                                                                    
> nvme nvme3: 8/0/0 default/read/poll queues                                                                                                                                                                                                                                                                                    
> nvme nvme4: 8/0/0 default/read/poll queues                                                                                                                                                                                                                                                                                    
> nvme nvme5: 8/0/0 default/read/poll queues                                                                                                                                                                                                                                                                                    
> nvme nvme1: globally duplicate IDs for nsid 1                                                                                                                                                                                                                                                                                 
> nvme nvme1: VID:DID 144d:a802 model:SAMSUNG MZ1WV480HCGL-000MV firmware:BXU87M9Q                                                                                                                                                                                                                                              
> nvme nvme2: globally duplicate IDs for nsid 1                                                                                                                                                                                                                                                                                 
> nvme nvme2: VID:DID 144d:a802 model:SAMSUNG MZ1WV480HCGL-000MV firmware:BXU87M9Q                                                                                                                                                                                                                                              
> nvme nvme4: globally duplicate IDs for nsid 1                                                                                                                                                                                                                                                                                 
> nvme nvme3: globally duplicate IDs for nsid 1                                                                                                                                                                                                                                                                                 
> nvme nvme4: VID:DID 144d:a802 model:SAMSUNG MZ1WV480HCGL-000MV firmware:BXU87M9Q                                                                                                                                                                                                                                              
> nvme nvme3: VID:DID 144d:a802 model:SAMSUNG MZ1WV480HCGL-000MV firmware:BXU87M9Q                                                                                                                                                                                                                                              
> nvme nvme5: globally duplicate IDs for nsid 1                                                                                                                                                                                                                                                                                 
> nvme nvme5: VID:DID 144d:a802 model:SAMSUNG MZ1WV480HCGL-000MV firmware:BXU87M9Q                                                                                                                                                                                                                                              
> nvme0n1: p1 p9                           
> 
> Only one drive, out of 6 is usable.
> 
> These drives are rather common datacenter drives (Samsung SM-953).
> 
> From another Bug-Report (https://bugzilla.kernel.org/show_bug.cgi?id=217384):
> 
> To fix it, please add two strings in pci.c
> 
> { PCI_DEVICE(0x144d, 0xa802), /* SAMSUNG MZ1WV480HCGL-000MV  */
> .driver_data = NVME_QUIRK_BOGUS_NID, },
> 
> Thanks in advance.

See Bugzilla for the full thread.

The reporter had a quirk (see above) that fixed this regression,
nevertheless I'm adding it to regzbot to make sure it doesn't fall
through cracks unnoticed:

#regzbot introduced: 86c2457a8e8112f https://bugzilla.kernel.org/show_bug.cgi?id=217593
#regzbot title: NVME_QUIRK_BOGUS_NID is needed for SAMSUNG MZ1WV480HCGL-000MV

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217593

-- 
An old man doll... just what I always wanted! - Clara
