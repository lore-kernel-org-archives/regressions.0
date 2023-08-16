Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41E4C2DF
	for <regressions@lists.linux.dev>; Wed, 16 Aug 2023 09:37:30 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1bdef6f5352so15941795ad.0
        for <regressions@lists.linux.dev>; Wed, 16 Aug 2023 02:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692178650; x=1692783450;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lS1r+gat9gKV1Ap/cgPo1okEN4ipNq1TwCugcvDik0=;
        b=p9vcUD7SG77yUjMoY4NXQ+ZkQjjj7s7oNy2iUAz+wM9vTKo45qPNzO9dsjJ9YxWsXU
         4bl4dOOmDm1KHlBvFoaXmYQimcShmpiHLhQuT7GJTZJyCjI/z6kH5I2/ahA4SeNagndD
         xl+loyaQVE0TpFvRzOEXw83qeBY67QOMj7DBFdU4nb5B/lU9ALwPIim9kOOdkYmW64MW
         /I/yHNlMMEI6aKsEROR/rt3OanyYe2ZrWSYwBf5XopMNsilqGL0OtDgGo1eoF3cSOaXm
         CYa/xDH73140/MZQQ4CW1815P2i31hfteCvGOFfLcZkdSn8vOHFvt4YMUY2CuL5vSIHk
         r+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692178650; x=1692783450;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1lS1r+gat9gKV1Ap/cgPo1okEN4ipNq1TwCugcvDik0=;
        b=B/SL/RiuSmQP5J4ANrbbgKs/yqJTlYkBemguFAhgrvE+vg2CE7KeJANxUaF+wylwkv
         HQCpQDj/IxmvFNFv+UAXQqtFZGOBxRCu7gdbXc1rhuTj0JgfIGOWC5HcKKJNZlssFc3k
         CKy1+ZjoqFpAAKf8xTbmm1yFpjstGw9966wk0xK1JuS3dhayA9YdC6Wvy72SrJrwMGYe
         gqqCdGk0sDJBnnVbaejD/Pc2H68YprvWQw4ps0av0TFqVKWRHnfBHgEJ7E9WV08FmB3h
         XMLzEYyVBu9n8DYnWTWjQVDgV/tFyq1s0zs9/rXxitT2jge62njT4FHiOBODk2NytZsZ
         dc1g==
X-Gm-Message-State: AOJu0Ywrp98K85FDwUsRuzbCPTNIgotXfkjtHinff0SS42vv1vmCn9Vt
	6gvBh7TRzXqtvY5Ohdtno6M=
X-Google-Smtp-Source: AGHT+IHGoKGbh8REsOj7FWUiAtyf3Z/SSp0bH7SDpB1ScBpX2GzKpd9GEewooAZU8xvsVHYNUiYs2g==
X-Received: by 2002:a17:902:6b86:b0:1bc:56c3:ebb7 with SMTP id p6-20020a1709026b8600b001bc56c3ebb7mr949752plk.20.1692178649825;
        Wed, 16 Aug 2023 02:37:29 -0700 (PDT)
Received: from [192.168.0.105] ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id n4-20020a170902d2c400b001bb6c5ff4edsm12670642plc.173.2023.08.16.02.37.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 02:37:29 -0700 (PDT)
Message-ID: <028a21df-4397-80aa-c2a5-7c754560f595@gmail.com>
Date: Wed, 16 Aug 2023 16:37:26 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Song Liu <song@kernel.org>,
 AceLan Kao <acelan@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux RAID <linux-raid@vger.kernel.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Infiniate systemd loop when power off the machine with multiple
 MD RAIDs
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> It needs to build at least 2 different RAIDs(eg. RAID0 and RAID10, RAID5 and RAID10) and then you will see below error repeatly(need to use serial console to see it)
> 
> [ 205.360738] systemd-shutdown[1]: Stopping MD devices.
> [ 205.366384] systemd-shutdown[1]: sd-device-enumerator: Scan all dirs
> [ 205.373327] systemd-shutdown[1]: sd-device-enumerator: Scanning /sys/bus
> [ 205.380427] systemd-shutdown[1]: sd-device-enumerator: Scanning /sys/class
> [ 205.388257] systemd-shutdown[1]: Stopping MD /dev/md127 (9:127).
> [ 205.394880] systemd-shutdown[1]: Failed to sync MD block device /dev/md127, ignoring: Input/output error
> [ 205.404975] md: md127 stopped.
> [ 205.470491] systemd-shutdown[1]: Stopping MD /dev/md126 (9:126).
> [ 205.770179] md: md126: resync interrupted.
> [ 205.776258] md126: detected capacity change from 1900396544 to 0
> [ 205.783349] md: md126 stopped.
> [ 205.862258] systemd-shutdown[1]: Stopping MD /dev/md125 (9:125).
> [ 205.862435] md: md126 stopped.
> [ 205.868376] systemd-shutdown[1]: Failed to sync MD block device /dev/md125, ignoring: Input/output error
> [ 205.872845] block device autoloading is deprecated and will be removed.
> [ 205.880955] md: md125 stopped.
> [ 205.934349] systemd-shutdown[1]: Stopping MD /dev/md124p2 (259:7).
> [ 205.947707] systemd-shutdown[1]: Could not stop MD /dev/md124p2: Device or resource busy
> [ 205.957004] systemd-shutdown[1]: Stopping MD /dev/md124p1 (259:6).
> [ 205.964177] systemd-shutdown[1]: Could not stop MD /dev/md124p1: Device or resource busy
> [ 205.973155] systemd-shutdown[1]: Stopping MD /dev/md124 (9:124).
> [ 205.979789] systemd-shutdown[1]: Could not stop MD /dev/md124: Device or resource busy
> [ 205.988475] systemd-shutdown[1]: Not all MD devices stopped, 4 left.

See Bugzilla for the full thread and attached full journalctl log.

Anyway, I'm adding this regression to be tracked by regzbot:

#regzbot introduced: 12a6caf273240a https://bugzilla.kernel.org/show_bug.cgi?id=217798
#regzbot title: systemd shutdown hang on machine with different RAID levels

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217798

-- 
An old man doll... just what I always wanted! - Clara
