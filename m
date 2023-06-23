Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9142106
	for <regressions@lists.linux.dev>; Fri, 23 Jun 2023 12:36:45 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1b5018cb4dcso3054415ad.2
        for <regressions@lists.linux.dev>; Fri, 23 Jun 2023 05:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687523805; x=1690115805;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRFszYI+9Qw1I1IAdyHoXb57hiMrn2v6H8gZ9EF6v9U=;
        b=L5R0/RAydkwltXsXehskQEBkNzFK4/MVvfMkBTioAsH8bRDuO3IsG058ILG/Fm3Y/G
         q/d127dskB6hmxwbGWh72gS2E/dzane7nlYj+aDK8vEV6KJtLCHGE5s24WDq7f1/BDo0
         EIGRIDHQz+aC+jDkbF/4t+wzL9pazKMWD/PqHjXsGbK7iX5Ug7fKqsmDnxuZkBVvHIFn
         LvppyyltF194+L4JZb7xQ2O6NPZ4xxbASCq+5d5RjthX5JsMVWm5GJwpDh20+51pm3C9
         AhS/RolaCcrYEbRterYhnk+hzAO0w1GzAgJh0YH+Ei4eisrgOEEFOVqQj+Ne1HjR+bv1
         Gwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687523805; x=1690115805;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fRFszYI+9Qw1I1IAdyHoXb57hiMrn2v6H8gZ9EF6v9U=;
        b=Bvxz45ND0HfHVBUw/72DBZaYY5I+EEuA2OxGbTlI/WUTGY5FEO//5mZuHdlm7o5b1d
         XUaentL2udY4PtxAG9+KNwJjSm7e8pqxKPassbaD11blYkmxZKiZQhtJly3nZCCvBbFl
         CoiMFBUt+d83BnC4OlwcuABjSN6pySBRF2AazuBmTumj9gRYMyQImFU46HHQB81Iems8
         mFuN5Ql3lSEXIw1BT3GY70DwWDsG8LuAPpXgVFn2YTVcqLvH60iRuCMKKGK8yI3ivmA1
         mK3s8xhfKQU0jhwsPBw9Snt16URQf4Lt6yB6kYH3SCAlSckMdw7XSk9igrj7Tm1/zhQy
         h6hg==
X-Gm-Message-State: AC+VfDzQE4lVpuoL3AXol4GvvSOA33/rJ5MmYk0+Dd68kFd/u9OFScBL
	oq6n8vewrmLVR9keNFHcHRw=
X-Google-Smtp-Source: ACHHUZ5G3Xm07SkD9tSvZjIav/cQnBT+Rn3G8kuel8ZSZvnXQ5c9RcE/3DmDQVTFKqgtT1WcEiasPA==
X-Received: by 2002:a17:902:bb96:b0:1ac:8837:de9 with SMTP id m22-20020a170902bb9600b001ac88370de9mr8065763pls.3.1687523804673;
        Fri, 23 Jun 2023 05:36:44 -0700 (PDT)
Received: from [192.168.0.103] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id c15-20020a170903234f00b001b694130c05sm5414045plh.1.2023.06.23.05.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 05:36:44 -0700 (PDT)
Message-ID: <5d4959b7-61da-8ab0-6bc6-21305d37c7aa@gmail.com>
Date: Fri, 23 Jun 2023 19:36:21 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>,
 Elmar Stellnberger <estellnb@elstel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Memory Management <linux-mm@kvack.org>,
 Linux Stable <stable@vger.kernel.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: kernel fault on hibernation: get_zeroed_page/swsusp_write
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> page allocation error using kernel 6.3.7-desktop-1.mga9 #1 SMP PREEMPT_DYNAMIC, from Fr 09 Jun 2023 22:57:31, Key ID b742fa8b80420f66; see the backtrace in the dmesg
>> cat /proc/cpuinfo
> siblings	: 4
> core id		: 1
> cpu cores	: 2
> ...
> type: regression, worked with the previous kernel, namely 6.3.6, Mo 05 Jun 2023 21:37:15, Key ID b742fa8b80420f66 before updating today

And then:

> The first hibernation attempt resulted in the backtrace you can see in the dmesg above, my second hibernation attempt from a text console (vt03 or so) has worked without errors and the third one I tried to do from the GUI/X11 again; see the debug options I had turned on). On the third attempt something strange did happen. It seemed to write to disk as it should, the screen turned black but the power led and button still stayed alighted. Waking up by pressing the power button did not yield any effect, nor the SysRq keys (alas forgot to write 511 to >/proc/sys/kernel/sysrq). After a hard power reset it booted as if not hibernated. On the first hibernation attempt I could see lengthy and intermittent disk access. On the third attempt I had waited for some considerable time.

See Bugzilla for the full thread and attached infos (dmesg, journalctl,
stack trace disassembly).

Unfortunately, the reporter can't provide /proc/kcore output
and haven't performed bisection yet (he can't build custom kernel).

Anyway, I'm adding it to regzbot (as stable-specific regression) for now:

#regzbot introduced: v6.3.6..v6.3.7 https://bugzilla.kernel.org/show_bug.cgi?id=217544
#regzbot title: page allocation error (kernel fault on hibernation involving get_zeroed_page/swsusp_write)
#regzbot link: https://bugs.mageia.org/show_bug.cgi?id=32044

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217544

-- 
An old man doll... just what I always wanted! - Clara
