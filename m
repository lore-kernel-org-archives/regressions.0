Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D66BD07
	for <regressions@lists.linux.dev>; Sun, 29 Jan 2023 02:17:33 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id k6so9170520vsk.1
        for <regressions@lists.linux.dev>; Sat, 28 Jan 2023 18:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CqUkrj8PHX+LFqPLuqpniwW9pHO+zUoKSvlGNgXdRpQ=;
        b=AUCiyAaOAEzNvGGuPpreMC/9xLYE0S3cPh5UGxJ970JY9cio41paghbZZpvrYUgj33
         EtQ/v3jd6W14OS3yd1Zgjo8svgWfkxKQLV+nHOoecsAetUTo7Cq0zQbteW+BmfffNMzV
         OXpCnvqD2ZA8pkDrNP1Zh8TsSXLA00QV+14nqbW/JLWKvs69eXx5iAkwkAEuTJeEkSyU
         8Wwr65sEL6S09amNZS2kd7aWLDt18IiGmEF5Ld/oPgJrj0ogOvJbz6aDKP1mEsRvglHY
         M32NXMyYCTrj/Vk68OG2caXKA3BqhaMt1TxwqtpIow1m0BIoiFoR3LBHc2TTqoGhbrmI
         44ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CqUkrj8PHX+LFqPLuqpniwW9pHO+zUoKSvlGNgXdRpQ=;
        b=5YQdXINM3La3+kOEgKRETMMInQnBHfFK6oimw+4D5rr4bTjBf6IvKD6yQND5g+eVcn
         ptd1asjC6zaCKXKLfYbQ4HD8HZ+uOVX7JWnNLB8Ar5XSvYp/gat8WQVObNefdAmhLsep
         F6rQr8HQSm9F9peKrbAHlXcOAfZCAoS7qTEhAt18ZYbajDbHBECeZ4eA/fM0khw0jsMn
         2b3nAIwyzmDvQTwZQuFGMJFdMo7bO8tq7eRb/r6+430mOcCL8RhrH7f2IFEltOcNid0W
         O+KD1ir97rn767mPazU9VFHDXN/nZH2wGjT9+Y4oV/i310p5KmBoKTKIl0/yzQ92cDDI
         y2Lg==
X-Gm-Message-State: AFqh2krk3sKEySmcd4W577qfOsBqpEwYr0531dUPcERBA8C9JNi1MJbg
	h4i/xeObqOcm3gSzrV9bVgTQZmvtzVqPagboDJP4vA==
X-Google-Smtp-Source: AMrXdXviHzhrbdKhdyGotEDUarg0RWbtMp2NCzRPwnh2r/CyZEpvs6jZZx4PLx295m/fi0lov7w8YP33xdctPtYbT8o=
X-Received: by 2002:a67:2245:0:b0:3ce:c8fd:ddf0 with SMTP id
 i66-20020a672245000000b003cec8fdddf0mr7110711vsi.18.1674958652331; Sat, 28
 Jan 2023 18:17:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:a05:6130:1015:b0:559:9619:d862 with HTTP; Sat, 28 Jan 2023
 18:17:31 -0800 (PST)
X-Originating-IP: [24.53.241.20]
From: Nick Bowler <nbowler@draconx.ca>
Date: Sat, 28 Jan 2023 21:17:31 -0500
Message-ID: <CADyTPExpEqaJiMGoV+Z6xVgL50ZoMJg49B10LcZ=8eg19u34BA@mail.gmail.com>
Subject: PROBLEM: sparc64 random crashes starting w/ Linux 6.1 (regression)
To: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
	regressions@lists.linux.dev
Cc: Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

Starting with Linux 6.1.y, my sparc64 (Sun Ultra 60) system is very
unstable, with userspace processes randomly crashing with all kinds of
different weird errors.  The same problem occurs on 6.2-rc5.  Linux
6.0.y is OK.

Usually, it manifests with ssh connections just suddenly dropping out
like this:

  malloc(): unaligned tcache chunk detected
  Connection to alectrona closed.

but other kinds of failures (random segfaults, bus errors, etc.) are
seen too.

I have not ever seen the kernel itself oops or anything like that, there
are no abnormal kernel log messages of any kind; except for the normal
ones that get printed when processes segfault, like this one:

  [  563.085851] zsh[2073]: segfault at 10 ip 00000000f7a7c09c (rpc
00000000f7a7c0a0) sp 00000000ff8f5e08 error 1 in
libc.so.6[f7960000+1b2000]

I was able to reproduce this fairly reliably by using GNU ddrescue to
dump a disk from the dvd drive -- things usually go awry after a minute
or two.  So I was able to bisect to this commit:

  2e3468778dbe3ec389a10c21a703bb8e5be5cfbc is the first bad commit
  commit 2e3468778dbe3ec389a10c21a703bb8e5be5cfbc
  Author: Peter Xu <peterx@redhat.com>
  Date:   Thu Aug 11 12:13:29 2022 -0400

      mm: remember young/dirty bit for page migrations

This does not revert cleanly on master, but I ran my test on the
immediately preceding commit (0ccf7f168e17: "mm/thp: carry over dirty
bit when thp splits on pmd") extra times and I am unable to get this
one to crash, so reasonably confident in this bisection result...

Let me know if you need any more info!

Thanks,
  Nick
