Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F3E63C0
	for <regressions@lists.linux.dev>; Wed,  2 Aug 2023 11:41:09 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-686efb9ee0cso6469460b3a.3
        for <regressions@lists.linux.dev>; Wed, 02 Aug 2023 04:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690976469; x=1691581269;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cV18Cisizme2k4YqWIWHrJEyGuocEaqPxg924l7XK8Y=;
        b=IlAptlq+VK98mpA2few2pmW5mYTUzP5uYXmdXaN/l0b1Pr25CRxbZ0IZrpzSaJdLF1
         LKHy4H0jBlHaaQcmjnw4aWlzvaIwACMlP2WBeG/l5UQNzhjIRfTylB+Pq6rK5vaukdr2
         hiiSJjYw5JEu+RD0SZ56T1tT3FOdybiUuD7BFDyyMsFiWFoZrVcY8nrCNBeSQOzL8NO2
         dJ7HzFdMyiYncy74xY8g6S1B/mHPnpS2HfVGQ56v/SUHKBfV03+qJgQQX1u/jceTmP6J
         KZrEbPROquPw4qnN11yg4pbrK73lUZ1plyqTosBJpn3MiSOS7K3x6MZxtMJOYFOXO15V
         wkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690976469; x=1691581269;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cV18Cisizme2k4YqWIWHrJEyGuocEaqPxg924l7XK8Y=;
        b=KYfCiz2PNmo1jdGeQbvL8cmtgA4TEUZMB0cpjC4dnwB4KLWs6hXSY9uKWo0zAmVZ1O
         R8iElypkEABnfsPEuHGyZBNY0w/oga+R+NHko7SwnV6KNQ/EwQ8D0MrrhTT0pWp/AWU5
         CVfca07+iMRMKXl7zIuCVw7oBfy6xw9pw0cwv57zX+G8wHzpGGKTWQfuBb5hsLIona6C
         qYYifGQrR4vP9Gz0b1e2UU055WojeGfBVLFQJ/8S6zjOlHugY8usZGFylS6OjUUd8+am
         SIBmnVwfQVQmLitlIEdeg++6Dt3pFbf+seoEHwAsGf9c3QR6oOAOZW3nwJPqJ4qmU5FS
         xW+w==
X-Gm-Message-State: ABy/qLZ+CZ4w1COhKed/k113kSjkY0UVDa2Ms02JlJXUNkifiRlt3tFC
	QOuAs+vTAwcwnos1ICRHHGw=
X-Google-Smtp-Source: APBJJlF6j5ZE3Y1mkxc9NxRnr/WudTbHe7GtCNVIUFzHuZuAyRVujwhnUraqbCBuy4C/MSirnmQb4g==
X-Received: by 2002:a05:6a20:a121:b0:13e:1945:8873 with SMTP id q33-20020a056a20a12100b0013e19458873mr9327883pzk.37.1690976468831;
        Wed, 02 Aug 2023 04:41:08 -0700 (PDT)
Received: from [192.168.0.105] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id j24-20020aa79298000000b006765cb3255asm10912100pfa.68.2023.08.02.04.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 04:41:08 -0700 (PDT)
Message-ID: <8edde583-2b5f-2332-e59a-f1f4688b9e40@gmail.com>
Date: Wed, 2 Aug 2023 18:41:01 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
 shenlinghai@163.com, Jens Axboe <axboe@fb.com>,
 Sagi Grimberg <sagi@grimberg.me>, dwmw2@infradead.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux NVMe <linux-nvme@lists.infradead.org>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Ubuntu 22.04, "nvme list" will hang for 60 seconds after "nvme
 subsystem-reset"
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> Issue description:
> root:~# lsb_release -a
> No LSB modules are available.
> Distributor ID:	Ubuntu
> Description:	Ubuntu 22.04 LTS
> Release:	22.04
> Codename:	jammy
> 
> root:~# uname -a
> Linux dapu-Star-Lake 5.19.0-46-generic #47~22.04.1-Ubuntu SMP PREEMPT_DYNAMIC Wed Jun 21 15:35:31 UTC 2 x86_64 x86_64 x86_64 GNU/Linux
> 
> root:~#nvme subsystem-reset /dev/nvme0
> 
> root:~#nvme list      //This command will hang about 60 seconds. 
> 
> Issue analysis:
> Maybe it hangs in function nvme_wait_reset. When we revert the following commit, this issue will disappear.
> if (!nvme_wait_reset(ctrl))
> https://github.com/torvalds/linux/commit/1e866afd4bcdd01a70a5eddb4371158d3035ce03?diff=split

See Bugzilla for the full thread.

Anyway, I'm adding this regression to be tracked by regzbot:

#regzbot introduced: 1e866afd4bcdd0 https://bugzilla.kernel.org/show_bug.cgi?id=217745
#regzbot title: listing nvme devices hangs after subsystem reset

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217745

-- 
An old man doll... just what I always wanted! - Clara
