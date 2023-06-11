Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB17B10EA
	for <regressions@lists.linux.dev>; Sun, 11 Jun 2023 02:27:54 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-52c30fa5271so1241443a12.0
        for <regressions@lists.linux.dev>; Sat, 10 Jun 2023 19:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686450474; x=1689042474;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZKyrk80GHGRjJOdJJel001FvO+j2KlRrTx+XA1IwaY=;
        b=SShXsAlVmeCsuDtXoC4sUVjP18LPMX5YXeAyzaUykqPgqjdinAS9aVALm4NbO1tENU
         Vp4dQgXCSDwH+qUoBfttSyBYTYTZPMWvUSAkKBWX8zlC6q3TmvR4q67zT5GFZgOgA973
         WzAS0BkwQg77hZol7FWQfT2ebs7aA+3y4pRCwZumd1wInTQQohKXcvTnkPsVBvlfLr8x
         71ovfgqOPS/0sWJvrXeLGzfzVYaxpToSe73LAIEkTIwP7dC+/DZuxPDPTMFgKKMed0y/
         jpbWFAl40YRFaEvEIG9J58aJLwNf7M7QCo3Fpre208BwXo3PpYUE8jgsOklS+KKGVnew
         RaHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686450474; x=1689042474;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZZKyrk80GHGRjJOdJJel001FvO+j2KlRrTx+XA1IwaY=;
        b=aw+JS92+yKFezEMm8lm/l9TC4a355dvmrWj+ko7jAESH/GTGVsCN4fCbqYNxg6xtmF
         15y6HqpEIVd1IJ9xn2ZUcG01NQJLOn09WWWe76dr/a2isvBF0LDh7Zrjm9DjqBUJnd9C
         27Jh8lnYVAHotGjRlcTTgvUAivAl3GiT+gpJ0szZfxbbmewceT942nONhLd99thfGSRV
         tmS3HVHHHtROOA/jo92BNIPj850Xw0RATbscQF7ePwawtUpcQuECo2U6+5smduRZiLY0
         8FofBisT7GY8oGWijCnvBWn6jscCpiEfet386yMrQtm9Q1WZO2WQY1rx/pcrcaUSDQ3I
         DBMg==
X-Gm-Message-State: AC+VfDyqWrB5PUzHEYpCVJ3AoBZR51MSj4Zlql70tcD3SDvGaPNyafPw
	LcZdMh28h1KeexATrdTnLSE=
X-Google-Smtp-Source: ACHHUZ6HnAVMhp2lSn0I3LgkbxqGHsODoUKgxm2ScyRFWnbq0b/2evpKIWwkzHPOPOpKkT4UrbW10Q==
X-Received: by 2002:a17:90b:3b90:b0:259:d0f2:3576 with SMTP id pc16-20020a17090b3b9000b00259d0f23576mr5008901pjb.19.1686450473758;
        Sat, 10 Jun 2023 19:27:53 -0700 (PDT)
Received: from [192.168.43.80] (subs03-180-214-233-75.three.co.id. [180.214.233.75])
        by smtp.gmail.com with ESMTPSA id z7-20020a170902708700b001ae3b51269dsm5566976plk.262.2023.06.10.19.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jun 2023 19:27:53 -0700 (PDT)
Message-ID: <17d7e7f8-ad8d-1696-32b7-3ff9fd4548c1@gmail.com>
Date: Sun, 11 Jun 2023 09:27:45 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Theodore Ts'o <tytso@mit.edu>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux ext4 Development <linux-ext4@vger.kernel.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: ext4_check_descriptors: Block bitmap for group 0 overlaps block
 group descriptors
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> Hi,
> 
> Fail to mount a filesystem in kernel 6.4.0
> 
> The Filesystem is clean. fsck -fp reports no errors
> 
> # uname -a
> Linux medusa.dds.de 6.4.0-rc5 #2 SMP PREEMPT_DYNAMIC Wed Jun  7 08:11:59 CEST 2023 x86_64 GNU/Linux
> # mount /dev/bigvg/lv_dat /mnt
> mount: /mnt: mount(2) system call failed: Structure needs cleaning.
>        dmesg(1) may have more information after failed mount system call.
> 
> Under Kernel 6.3.4 everything works with this Filesystem

The reporter then pasted short dmesg snippet:

> [  104.501659] EXT4-fs (dm-9): ext4_check_descriptors: Block bitmap for group 0 overlaps block group descriptors
> [  104.501664] EXT4-fs (dm-9): group descriptors corrupted!
> 

See Bugzilla for the full thread and attached dumpe2fs, lspci, and systeminfo.

Anyway, I'm adding it to regzbot:

#regzbot introduced: v6.3..v6.4 https://bugzilla.kernel.org/show_bug.cgi?id=217534
#regzbot title: Block bitmap for group 0 overlaps block group descriptors, causing mount failure

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217534

-- 
An old man doll... just what I always wanted! - Clara
