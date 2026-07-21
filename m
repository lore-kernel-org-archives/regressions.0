Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8862B42EEB8
	for <regressions@lists.linux.dev>; Tue, 21 Jul 2026 21:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784671150; cv=none; b=SpDDfsPehmCB6BewVNEZGXFkBXBhdzq3uUxn4dJjlNi3xoKNi5G6k5L/+vQ5oLAnlAm+uVNCdPHcrXITXbdyEUsgL54Zp5RC4NAARyq6BUwIkC5Vn0jcy/MY7fBf+r0cw2q552jhmn0ar/DKJj2Etu5K8WoGJDMBK6nylARG/Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784671150; c=relaxed/simple;
	bh=+CSJzWCektwp0qDxnnaIRAU7cRgqQ7Em/RxSSsREdq8=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=nm8i17vz+kLBG0KpD5o3xc3aLiXLcYxdOXkc6XNknhE8J3dt5ziOc9kmDdPzI5FMhtDV5BIkUjxzOs5A/C197VgdtPQU9OSGL73//g/Jz9J5Xf/AYA3d4tczvVSEop72xwxevpKJBPnTQCETC1S/hyWd8F4REeqB2R/783/FDWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=AdNEt0wd; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="AdNEt0wd"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-381216921aaso11221814a91.1
        for <regressions@lists.linux.dev>; Tue, 21 Jul 2026 14:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1784671147; x=1785275947; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BfGeGlENFxpuCxR7FjO+oWKfmw8fNbeR6VheNQhmhAk=;
        b=AdNEt0wdkepBN79Lt5ZlSqmIr3qY/P35GflLjgYv3K976dwV6ZlMbS3VOWfD3ErpHQ
         Jnsf1bPTnz0ONX54fkoc5wMMWdsS6+9MRRnwGRrpM+3grY5pKcrGSp+T4Zwt4T0yUPF/
         VKa3z86CtWYpW8RDWp9X19xK1vtu8z0N4Dp/38mTIS4Z0zkAu7Tw2qpKr8gqxGSDHffL
         4RppcvRPxvj/J2B1J18b2iJEYDARYWg5XMRZqnlYc2VefWl35IHKWyQxAWc4GIXw1c5L
         wuJIsL/OlMORn/XaRy3qQQKZeZqmzUtkiSnNn/vEw5m5jFhP8cjVk0hMkqHj6lCo5/aL
         KT5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784671147; x=1785275947;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BfGeGlENFxpuCxR7FjO+oWKfmw8fNbeR6VheNQhmhAk=;
        b=jO/fX8Z5CEDuNW3g+pD2qPssLEsPCY5hhmI606XEZvDMTRF2jiEI82KwWSMTI9REyr
         ZYPFnZkpffOLY05Y5FEnbqtkCy/451/XxqdjntT49bZHrTjoNrAEr4iHqx4EQ5mbM98V
         lVnHrStaKEemOjcw9Su8B2rk2y2cc7N+HktfesG3e3Cv2RZD6JtWwuRJD33VAb8Spp4t
         1QZV5yNvfnPq8e5s3JVd+CTEF/mEZXnWV9kiO7jM6vCmFkAbaCVl97POK1YZ4mq9WKui
         bN/nhcZ5l26mlgctR3g9QL4kLVtKMUb3Kp8d704JemRiXcVlSX07KyBxjbtEO9Vzs5xl
         Beqw==
X-Gm-Message-State: AOJu0Ywy4ArMZ1/odevh8SuTGYxhdfLlUxLbUPRcG9Aj0VrHFtwSF6Hq
	gFegGU6StjdOXWCEpaBLp5Sq49Ur01xfiALX2cefYWD/cMs6wmpkI2p59STPUGvT6ec=
X-Gm-Gg: AR+sD12RjFHmDQZkiaQENhK0vjeqWZomeaa5rq2rX5IvTzbHrSm6NwW+O+9+InzVp4g
	TVCQ/3vquv2/yTTAH2z/6h/ySo2NDr52R969pAQs9rdJj/9LhqEjDMkxn3H9KPU1gkRGEgu4Y7l
	SR40qLQiQ/nW93aYOdcgg43V5/lUE3TB6gptCK6VkZQpRQjY3AkpsJ1S7k3NKAA7dS+UrxXMPND
	qK5RKkFnNvSZEU+eKOTfs05+AaCbokpS01G4AXbhYb5yR1L9xnznHVaASvqsWdX6PBhJ3iPiG9P
	Jmq1eeGS8/ab4ZpXiWJQEVvZGhX14RIkRK5fbJO/8tcAYTR1hMDnWAHYpxAJZd36jsk95rS4RRY
	+oU95cfhDxT4A0KpXXCU6DHBqvCEz0FG4JQWfebRbmR4V7EC76iN8FfjraG5MgJF/eP/GM/Q=
X-Received: by 2002:a17:90a:d2cb:b0:37f:ad36:8fc5 with SMTP id 98e67ed59e1d1-38e4b515bfamr20944909a91.23.1784671146655;
        Tue, 21 Jul 2026 14:59:06 -0700 (PDT)
Received: from 4104846f2ebf ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb7c5sm42923449c88.10.2026.07.21.14.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?b?W1JFR1JFU1NJT05dIG5leHQvbWFzdGVyOiAoYnVpbGQpIGluIGV4cGFuc2lvbiBv?=
 =?utf-8?b?ZiBtYWNybyDigJh4ZnNfbG9nX3J0c2LigJkgaW4gZnMveGZzL2xpYnhmcy94ZnNf?=
 =?utf-8?b?c2IubyAoZnMuLi4=?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 21 Jul 2026 21:59:05 -0000
Message-ID: <178467114526.1316.13205923514031471873@kernelci.org>

New build issue found on next/master:

---
 in expansion of macro ‘xfs_log_rtsb’ in fs/xfs/libxfs/xfs_sb.o (fs/xfs/libxfs/xfs_sb.c) [logspec:kbuild,kbuild.compiler.note]
---

Log excerpt:
=====================================================
/tmp/kci/linux/fs/xfs/libxfs/xfs_sb.c:1483:17: note: in expansion of macro ‘xfs_log_rtsb’
 1483 |                 xfs_log_rtsb(tp, bp);
      |                 ^~~~~~~~~~~~
cc1: all warnings being treated as errors

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/178467114526.1316.13205923514031471873@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:09e03f60e36b4243ba595281bf22987cb72d812d
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  290aaf24a551d5a0dce037e3fab30820f9113a10
- tags: next-20260721

# Builds where the incident occurred:

## x86_64_defconfig+aws-ec2 on (x86_64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a5fae5b75cb84fb21705422

#regzbot introduced: 3fe08b9796f36ef437ab9328e7dd1e5ff2d66603..290aaf24a551d5a0dce037e3fab30820f9113a10
#regzbot link: https://d.kernelci.org/i/maestro:09e03f60e36b4243ba595281bf22987cb72d812d

#kernelci issue maestro:09e03f60e36b4243ba595281bf22987cb72d812d

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
