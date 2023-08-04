Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9186213ADF
	for <regressions@lists.linux.dev>; Fri,  4 Aug 2023 15:26:39 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-79a2216a22fso751659241.0
        for <regressions@lists.linux.dev>; Fri, 04 Aug 2023 08:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20221208.gappssmtp.com; s=20221208; t=1691162798; x=1691767598;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TISz3k+PMYGKrMgDH9pY8Cp9li66HI00FkNZizTo52w=;
        b=ExCswNAgk/v2e2egu6+hNMtaYHUBghOmS7c5SYQG314yWxfL45c5JbogeOf8a0K5zd
         sDIQfdFSOuXeIHAoJ73WePOZYNCex95APFciBPZeir24ctb1HWsNH/Ou2NxzgPxiaa/G
         YgAizDvo4Uh8/0bv99AR0xejdMjSAsRHAhsWHXvWEQze5ZzEmLE3T0MfBeUFegIZOwCT
         BDb/J6ayuGdEJzJa5likWPFNfzNHm3Zk4cZ9WkqL0aqeYZqJyr/G2v4MjxPLxIs6FqLH
         eehDYY7DdT/M1PsS195mcVSsN/VPAySeICj8u2w0/C+0AhRX22oFN/duheWEqY82a9b3
         qYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691162798; x=1691767598;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TISz3k+PMYGKrMgDH9pY8Cp9li66HI00FkNZizTo52w=;
        b=L/MAoKgKDAve6q6LjMlHpqbXnbDaaIshWe9MKHuqECVUINAY+ncuDBeO5HHCCSeMO8
         O1HX+snDJAuW9l1IhFsLO5Ks1fLTZscERKzZILN2IPHSq9CjRQ8iTP78bomMFtSuHm1R
         OnqCLwZbfwLMsJ4s+NainCOpP4VQz6FzODwZC8+PwJds46ZFYW8lYCOipV9hR4n5WdJp
         nmsJY2LvmYRhmxhDbtORanOFnAs2TtNC2c/JJSHgA+/lruqG2L2w7CkXLplYor0DOrUK
         PhJt0sI63F5jmKvcxQrl/J4bKzAmP4sCJALojMZ5ei6Bc+kI9SFLEWJtgo2hj+BDr9kJ
         JB0w==
X-Gm-Message-State: AOJu0Yw6yGInlHYp0H5xSipOVLtB/nmE2ztX8jtMvDsrlBEZnQiYO9dG
	q2ayPDzKpEMgim8dvI52e9pt4aMZmkQxrf3pcyuYbg==
X-Google-Smtp-Source: AGHT+IEoWukZdCUayYc8Z/czVgSIpSLbHA7yoE13OqC9Toa6S/N5naokCJMvr0IlYjGZX9SWBQRcnHFdIsAUz5koBa4=
X-Received: by 2002:a67:fe98:0:b0:444:db0a:51b with SMTP id
 b24-20020a67fe98000000b00444db0a051bmr1434229vsr.15.1691162798241; Fri, 04
 Aug 2023 08:26:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:ab0:6209:0:b0:794:1113:bb24 with HTTP; Fri, 4 Aug 2023
 08:26:37 -0700 (PDT)
X-Originating-IP: [24.53.241.2]
From: Nick Bowler <nbowler@draconx.ca>
Date: Fri, 4 Aug 2023 11:26:37 -0400
Message-ID: <CADyTPEzqf8oQAPSFRWJLxAhd-WE4fX2zdoe9Vu6V9hZMn1Yc8g@mail.gmail.com>
Subject: PROBLEM: Broken or delayed ethernet on Xilinx ZCU104 since 5.18 (regression)
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	netdev@vger.kernel.org
Cc: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi,

With recent kernels (5.18 and newer) the ethernet is all wonky on my
ZCU104 board.

There is some behaviour inconsistency between kernel versions identified
during bisection, so maybe there is more than one issue with the ethernet?

  6.5-rc4: after 10 seconds, the following message is printed:

    [   10.761808] platform ff0e0000.ethernet: deferred probe pending

  but the network device seemingly never appears (I waited about a minute).

  6.1 and 6.4: after 10 seconds, the device suddenly appears and starts
  working (but this is way too late).

  5.18: the device never appears and no unusual messages are printed
  (I waited ten minutes).

With 5.17 and earlier versions, the eth0 device appears without any delay.

Unfortunately, as bisection closed on the problematic section, all the
built kernels became untestable as they appear to crash during early
boot.  Nevertheless, I manually selected a commit that sounded relevant:

  commit e461bd6f43f4e568f7436a8b6bc21c4ce6914c36
  Author: Robert Hancock <robert.hancock@calian.com>
  Date:   Thu Jan 27 10:37:36 2022 -0600

      arm64: dts: zynqmp: Added GEM reset definitions

Reverting this fixes the problem on 5.18.  Reverting this fixes the
problem on 6.1.  Reverting this fixes the problem on 6.4.  In all of
these versions, with this change reverted, the network device appears
without delay.

Unfortunately, it seems this is not sufficient to correct the problem on
6.5-rc4 -- there is no apparent change in behaviour, so maybe there is
a new, different problem?

I guess I can kick off another bisection to find out when this revert
stops fixing things...

Let me know if you need any more info!

Thanks,
  Nick
