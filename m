Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2593E4C62
	for <regressions@lists.linux.dev>; Fri, 15 May 2026 08:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778835551; cv=none; b=GeCW5aH7SQ0HzqLW2GGfRk9pLuYHUG6YRIOIuLOESz9X7BnYewWsCdrOtVp2TKIv5SM/J4XzMI/IopAaNsx4/kIKlFE1aVSbnPq3f05AjquiLhkchg2BRLh+5mxvX4fxKMwSZI2+GYVE0s1vvuSEkciUFlv0tqqMuSnkhjtGkr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778835551; c=relaxed/simple;
	bh=UkDP3Zk4CisPh+rTAuaNtzTGhttoBehwVidfPgBrXsU=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=O6lj4lWwAcOR5gO80BJX+Z1EQxfbveaBwzaJMl27eTku731eXUSqgkmB+WfzZIe0Emm0H2Na9fWcUx2pXWz9a50aehNIFfuEO5LUnhX05hVO4AJzs+zw3/YjHpjvG6ekWgZ5z2wOIlnRYZwj2ar6fYQlXjAL6c7f5QW4waCHh/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=jewm+9Hn; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="jewm+9Hn"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2f7020a928eso12614010eec.1
        for <regressions@lists.linux.dev>; Fri, 15 May 2026 01:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1778835549; x=1779440349; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W0QX2ZVw9bpFX+QilRz3z78NA4w3Wcvrf3OoYpsFLD4=;
        b=jewm+9HnYqqOh5ZuWkO8L9vcyKsNgg8MBdIpWYbAI+WeYMWCCVoLlRroNPqGfxX5Tk
         1yU97/IP1BoD7itTU/abfAmiQwT84oGRg/neDv6aoWDz5oS4bVnfRgfMyXbhuS4aL/UK
         C2xxDsP4A+hdjoIsuyatGKok/ChLaz9J8y3km1kxFvLb9mPGyagIJBj1BBm33PEwZnBB
         qWbxrwqSE0RIC9352/OB3Ev4+Jf/vG5BmbhxthYTkmy7Mp3VT6o3tW64Np46XtsbSATL
         7FpcRMA3GPkCEfJ6byfpuQufPU0URWT0RUG+FCCp0XdNFmpnIXKPry4BZqU2DgFxx491
         NQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835549; x=1779440349;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W0QX2ZVw9bpFX+QilRz3z78NA4w3Wcvrf3OoYpsFLD4=;
        b=Qd3jAnwFSiHDuhlCY4BS3YJw/0efa4fAwxpOAQ7870knBkdUiYKlyiPuz29ILS5YMN
         hggdgorKx7gmZdze2xldVBrsF2suyI6+Fv3ukJkw6tKinf5OVOOfR4yjRtJuaHuvUElg
         CLTB/QQoBrYI3/SYNV81Kh58eSyNObrD4woJtpD6cXCmcuEJRllquo61nEZhJOjdB1Nt
         PvEeO/J/7zFkN3qmYjSNY/nqbMMRFXf3xMm0OIrNuvP8pv/6KY7t7Epnjw2sFU6a7gpF
         siEIvnMaTxHPZ2e63sqzVoUxCzY46ojKtNDoDkw9vC0OF8WParCJa2H+ozyVYSlxu0nY
         eGzw==
X-Gm-Message-State: AOJu0YxOk0CMZbR+N9WfNM2/GW6RhXQO94NP1/sFSLxYFMWfKsd3Kny0
	ZOPl1nl3wbYrNd7V8TnQGQtuwdTmHGK7qvSMk40hKbOaIPzqJYfufBxkG+qpFtCtpgU=
X-Gm-Gg: Acq92OEFNa6AgMXZEe8qsmsuXsqkpoOUuFkb11XIQ6/i8/ESYzoJIwQk5xwfjCoAxXk
	dDC5s2oUEKW97oohIYG809gQxO24uoY614oyC/4PgrVB30VZGp0sjmlG0v1rbJqIekZ3J2OVZna
	3shxU7DV4a6EO7oLUcYJz4hKH65ePXjlP/EN8uXfu06k566gqWBnRhJ84puEtkec5u04fZ1Ljd8
	0um8BGkCRYtYNjQJ915ZAM8wfI0bVK37MZgd3XlvJ3VnW/NhJP3ePGghesgTOhIzqvEpPZgi/RH
	TXGqoEmbvNRSdZEriVUBYRdY3B7zDTlKapqnI77piP6Qh0CmkGSfuGDr5rqT+PqCGefwk4IY6g7
	M+r9YYtfeCj4T+wVsp8Of5RY6cj3S/mHFN8Emt/3vu4HDF9APDWKiPAe8h31hW/PxXiUGsVxRZ4
	CCVwAhId4Q5XoBrnPD
X-Received: by 2002:a05:693c:2b0e:b0:2dd:2ad3:f799 with SMTP id 5a478bee46e88-303982ac821mr1410025eec.9.1778835548836;
        Fri, 15 May 2026 01:59:08 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302977a9474sm6220889eec.25.2026.05.15.01.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 01:59:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?b?W1JFR1JFU1NJT05dIG1haW5saW5lL21hc3RlcjogKGJ1aWxkKSBmb3JtYXQg4oCY?=
 =?utf-8?b?JWxk4oCZIGV4cGVjdHMgYXJndW1lbnQgb2YgdHlwZSDigJhsb25nIGludOKAmSwg?=
 =?utf-8?b?YnV0IGFyZ3VtZW50IDUgaC4uLg==?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com,
 shreeya.patel@collabora.com, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 15 May 2026 08:59:08 -0000
Message-ID: <177883554772.890.14362912312699978244@330cfa3079ca>





Hello,

New build issue found on mainline/master:

---
 format ‘%ld’ expects argument of type ‘long int’, but argument 5 has type ‘size_t’ {aka ‘unsigned int’} [-Werror=format=] in drivers/hid/hid-core.o (drivers/hid/hid-core.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:2c134b9650a439d5a2095ada3b457a32db6a944f
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  70eda68668d1476b459b64e69b8f36659fa9dfa8


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
drivers/hid/hid-core.c:2053:43: error: format ‘%ld’ expects argument of type ‘long int’, but argument 5 has type ‘size_t’ {aka ‘unsigned int’} [-Werror=format=]
 2053 |                 hid_warn_ratelimited(hid, "Event data for report %d is incorrect (%d vs %ld)\n",
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/dev_printk.h:110:30: note: in definition of macro ‘dev_printk_index_wrap’
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
      |                              ^~~
./include/linux/dev_printk.h:156:61: note: in expansion of macro ‘dev_fmt’
  156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
      |                                                             ^~~~~~~
./include/linux/dev_printk.h:215:17: note: in expansion of macro ‘dev_warn’
  215 |                 dev_level(dev, fmt, ##__VA_ARGS__);                     \
      |                 ^~~~~~~~~
./include/linux/dev_printk.h:227:9: note: in expansion of macro ‘dev_level_ratelimited’
  227 |         dev_level_ratelimited(dev_warn, dev, fmt, ##__VA_ARGS__)
      |         ^~~~~~~~~~~~~~~~~~~~~
./include/linux/hid.h:1342:9: note: in expansion of macro ‘dev_warn_ratelimited’
 1342 |         dev_warn_ratelimited(&(hid)->dev, fmt, ##__VA_ARGS__)
      |         ^~~~~~~~~~~~~~~~~~~~
drivers/hid/hid-core.c:2053:17: note: in expansion of macro ‘hid_warn_ratelimited’
 2053 |                 hid_warn_ratelimited(hid, "Event data for report %d is incorrect (%d vs %ld)\n",
      |                 ^~~~~~~~~~~~~~~~~~~~
drivers/hid/hid-core.c:2053:91: note: format string is defined here
 2053 |                 hid_warn_ratelimited(hid, "Event data for report %d is incorrect (%d vs %ld)\n",
      |                                                                                         ~~^
      |                                                                                           |
      |                                                                                           long int
      |                                                                                         %d
drivers/hid/hid-core.c:2075:43: error: format ‘%ld’ expects argument of type ‘long int’, but argument 5 has type ‘size_t’ {aka ‘unsigned int’} [-Werror=format=]
 2075 |                 hid_warn_ratelimited(hid, "Event data for report %d was too short (%d vs %ld)\n",
      |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/dev_printk.h:110:30: note: in definition of macro ‘dev_printk_index_wrap’
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
      |                              ^~~
./include/linux/dev_printk.h:156:61: note: in expansion of macro ‘dev_fmt’
  156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
      |                                                             ^~~~~~~
./include/linux/dev_printk.h:215:17: note: in expansion of macro ‘dev_warn’
  215 |                 dev_level(dev, fmt, ##__VA_ARGS__);                     \
      |                 ^~~~~~~~~
./include/linux/dev_printk.h:227:9: note: in expansion of macro ‘dev_level_ratelimited’
  227 |         dev_level_ratelimited(dev_warn, dev, fmt, ##__VA_ARGS__)
      |         ^~~~~~~~~~~~~~~~~~~~~
./include/linux/hid.h:1342:9: note: in expansion of macro ‘dev_warn_ratelimited’
 1342 |         dev_warn_ratelimited(&(hid)->dev, fmt, ##__VA_ARGS__)
      |         ^~~~~~~~~~~~~~~~~~~~
drivers/hid/hid-core.c:2075:17: note: in expansion of macro ‘hid_warn_ratelimited’
 2075 |                 hid_warn_ratelimited(hid, "Event data for report %d was too short (%d vs %ld)\n",
      |                 ^~~~~~~~~~~~~~~~~~~~
drivers/hid/hid-core.c:2075:92: note: format string is defined here
 2075 |                 hid_warn_ratelimited(hid, "Event data for report %d was too short (%d vs %ld)\n",
      |                                                                                          ~~^
      |                                                                                            |
      |                                                                                            long int
      |                                                                                          %d
  CC      drivers/gpu/drm/i915/intel_runtime_pm.o
  AR      drivers/platform/x86/amd/built-in.a
  CC      drivers/platform/x86/eeepc-laptop.o
  CC      drivers/md/dm-stripe.o
  CC      drivers/firmware/efi/vars.o
  CC      drivers/net/ethernet/realtek/r8169_main.o
cc1: all warnings being treated as errors

=====================================================


# Builds where the incident occurred:

## i386_defconfig on (i386):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-i386-6a068f300ed99f002e8a9f04/.config
- dashboard: https://d.kernelci.org/build/maestro:6a068f300ed99f002e8a9f04

## i386_defconfig+kselftest on (i386):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-i386-mainline-6a068f3b0ed99f002e8a9f0d/.config
- dashboard: https://d.kernelci.org/build/maestro:6a068f3b0ed99f002e8a9f0d


#kernelci issue maestro:2c134b9650a439d5a2095ada3b457a32db6a944f

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
