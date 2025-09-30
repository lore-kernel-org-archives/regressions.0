Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBE27640E
	for <regressions@lists.linux.dev>; Tue, 30 Sep 2025 19:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759262348; cv=none; b=rSaL4rf/+oNPQ7v6M8BV0VwmtGUOiV4meZhFl89io5Nq2/QA1ZYHRi51JVIjN6yB5PRlz/04bMLi4Jy+MHCTmg1BtN34UFv8qyZuByX5dlj88aGqPRCdNS/fB3VcERWKpLvsxBt2zg+5vbuYvjAKbh+Hr301tUUsU9vHX8bUYNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759262348; c=relaxed/simple;
	bh=iDWIzHNHHj2vciK2xfzgbi+QUOJD+V3P9WOslgRaJ8I=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=tcMfYVphVK+H99gFmzDrsPGVNgvutP6dwfPgHhd2B6smnNPAzNS9Ubz7ioguG9r5VDt3ET6d3HAi9VbKIh2hwQmcNfACd1KY+F1wa+fsw8kYrb0dRxwQQt5YcE7fav8VZo64L94IsSNe+Cp+H00o9NQ+K8VuYD2Hf1o8nuhwld0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=HbZ7AGX0; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="HbZ7AGX0"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-27a6c3f482dso50066205ad.1
        for <regressions@lists.linux.dev>; Tue, 30 Sep 2025 12:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1759262346; x=1759867146; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xa3PNk1yMBHfe3pVcZ1nwX4FG5FOz8kwURcAt+4oLZk=;
        b=HbZ7AGX0qLEukK4aDiLgiKKXcJNbsZW9aM9I65Ba1Sp33/JxTSd+rpzcVDcTuv9sCE
         rOWPiePrBUWhANW/q/kZaK6iCUp98Rh+RFYh6zU/NZm8Kp5CSU5xyOSOmnb724nYWEhk
         C9cqm8RSrm7YC93IV3GkqX6p3WOY189NUaSHoMmDvKgpUfbL7c0PPBAZqZZhHwN0W7KX
         FbpmYNj3bGCTNTgSJkSQ2oxAC+7m0XdR+SrVa8QwC0eekyEnK1uzI8s6vV5EDXaxerq0
         wHSqda9/u1jRmbSPR+MONVKpWJUO8Kqw45Beh7UP/iWgMoINZPAUW+aFaL3hP5nMwg2t
         vU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759262346; x=1759867146;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xa3PNk1yMBHfe3pVcZ1nwX4FG5FOz8kwURcAt+4oLZk=;
        b=vFQZUWLbovrYNSVuIHhJXII9zMHbILdVdKhupK3JUCQNXAlCEHfdzpftlHZ9ROAZbz
         Pi03J97u6OxvMYkaQCEBFp85A6PUp2yBa5Kl9u6N8uHERzoip1KDfcyDzSu+urQaqzrx
         zKtuRHE0Y50Q7bwJFF4NSbJk4CqACX49NeHDn/lVVX/VX9DfkffeMgk4CVvpU04NQA39
         hsHYN92Pa1IAUfWMug4fOfLomBjCAS6UTaI4MNcr/kp3egoOsfkxFfBeE7x9Z8N0+M6s
         tAReYgv7lzNEvW7O2nWuM4OV9OfJjS81pU4eUampsLI08q0kVzxDMtN2d0HRaKBcSWw5
         t6oQ==
X-Gm-Message-State: AOJu0YxIciDw/S4TbmNEFJ7xOo2v1kOJSxn1wi7XAeQ57WR3AvqJpY7+
	8CSN+Nlu7j6YiMlIV6WxzET0z0K6zyMm3/u/Js3n6wj4+l2ENsJCSK1VQlOdupuZZR4=
X-Gm-Gg: ASbGncvNt7nWuBiaeU3aLE0zKsX/jksTNzHrceAJ4E9D46qLXFYb86E6I3B3VxezTdv
	4slUR3sL/8HI1LLdFBLlya3naRKzhWIoLoJ7vsx22xWnXNNwZIhUKaZNxeRbMdIOcjI+8D3k5eg
	C5tjkr1lMRcWmh47EShjehtrGoXmNAvS8rXPcsY17+ZJtXt84fXvCkwHWupawQM97N8wt92Dz5k
	WazUdMFJjGZvGOjMsmp4EqN1u3752/ixrKjCQwJzMMNT1BV1spPAphO6oBwCMocNCkFQMHsqMqQ
	pqrY7ffA3S/AZhEvQoGgkIpt6mpJKRkhpQu0yRphtAT0rqKpi/PvK4O/VDbVuC5VRXCPoVFUVAo
	CsDRDhGFbIn1K3uUJjBnRgcrAsSb/WOdEOlvWH0Ni
X-Google-Smtp-Source: AGHT+IF2PMlbEHfJMbFG4BsZKbTBkA/hrS1i8RcXPDXqNQnXdOTdT8Yi30+fabCHpNVBauV4RHbMyw==
X-Received: by 2002:a17:903:1a10:b0:267:9a29:7800 with SMTP id d9443c01a7336-28e7f43eaf5mr10641075ad.59.1759262346623;
        Tue, 30 Sep 2025 12:59:06 -0700 (PDT)
Received: from 1e895cdadf47 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28d18fed800sm36459935ad.85.2025.09.30.12.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 12:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build) format specifies type 'size_t'
 (aka
 'unsigned int') but the argume...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com,
 shreeya.patel@collabora.com, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 30 Sep 2025 19:59:04 -0000
Message-ID: <175926234387.746.13288018421181922907@1e895cdadf47>





Hello,

New build issue found on mainline/master:

---
 format specifies type 'size_t' (aka 'unsigned int') but the argument has type 'unsigned long' [-Werror,-Wformat] in fs/btrfs/disk-io.o (fs/btrfs/disk-io.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:508104d34b42851d5cf2793962558310ea5c8b41
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  755fa5b4fb36627796af19932a432d343220ec63



Log excerpt:
=====================================================
fs/btrfs/disk-io.c:3400:28: error: format specifies type 'size_t' (aka 'unsigned int') but the argument has type 'unsigned long' [-Werror,-Wformat]
 3399 |                            "support for block size %u with page size %zu is experimental, some features may be missing",
      |                                                                      ~~~
      |                                                                      %lu
 3400 |                            fs_info->sectorsize, PAGE_SIZE);
      |                                                 ^~~~~~~~~
fs/btrfs/messages.h:47:51: note: expanded from macro 'btrfs_warn'
   47 |         btrfs_printk_in_rcu(fs_info, KERN_WARNING fmt, ##args)
      |                                                   ~~~    ^~~~
fs/btrfs/messages.h:84:31: note: expanded from macro 'btrfs_printk_in_rcu'
   84 |         btrfs_printk(fs_info, fmt, ##args);             \
      |                               ~~~    ^~~~
fs/btrfs/messages.h:27:32: note: expanded from macro 'btrfs_printk'
   27 |         _btrfs_printk(fs_info, fmt, ##args)
      |                                ~~~    ^~~~
./include/vdso/page.h:15:19: note: expanded from macro 'PAGE_SIZE'
   15 | #define PAGE_SIZE       (_AC(1,UL) << CONFIG_PAGE_SHIFT)
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
1 error generated.

=====================================================


# Builds where the incident occurred:

## defconfig+allmodconfig+CONFIG_FRAME_WARN=2048 on (arm):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:68dc15cc841b167e8d35cb5e


#kernelci issue maestro:508104d34b42851d5cf2793962558310ea5c8b41

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
