Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE1C2F363F
	for <regressions@lists.linux.dev>; Mon, 18 May 2026 12:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779109150; cv=none; b=ORIllhCjt3r9MfCFL0btYt6GEK1EF02J23eNIF/Xx7+/QkkAU2LVUTjx2H1Hw8MgGm3/8IngUfNfPk+8TzyQN1WE63MCidhyyLuWSSJygDyCrLZiaXocn1e3dz1wiIbhRRz/R0ysEDeqI56xQ2TMkipaFdatFPyYBGmY0KMeevg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779109150; c=relaxed/simple;
	bh=xwenoXoBcKZbor0J9cma9ZCefU/PzDqWBJpa7npMX+M=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=uZAoidMkN6TGFa24AEfgv4ansv9zGj1vl32fD7qCbi9sKUl0kJ6ugWIoXzh1wa32YHmwtrT6tmKmBubvsw05fVDYR7VgHdKcaC3hIHPyPd8yvFInc6yvrgx67CQef1X7jsMF+2C6tj7g11Zrx96e9DXjGecI5+oClVxd7RBplKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=Lm4m20SU; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="Lm4m20SU"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2ef8d6ba48bso1059560eec.1
        for <regressions@lists.linux.dev>; Mon, 18 May 2026 05:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1779109145; x=1779713945; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OuTEZR64FKNuPtyRQsfSeTrHGtBZhqAWTR0BwH6z2gU=;
        b=Lm4m20SU5/yQsjLun5lmSk3GXPEUgQuEMZoWaPDulb0Rj1tv5tNXT2PFKmGFfnn11A
         zUEhS3ciGGLW7MBeLfjfqHIdMPH54weZkIHfvOIkOfpXg5c1g8d/OIEJilARJPDMJXdR
         FaJ23GEfpJRIMWcAFPCd34Wez1JJicHq++/yqPxgLNIAxRneHd7zpQbM9gbGbBDTl+tF
         m7KIyaEvAWhytSvsN3n8VAjdQZhz9DLiygv5WfLl2SCog8ddkhaMG8NJZT5EzlxYnc2T
         CXPItDXWggrhw09fTYUreUUgyKqENvkUHcdJ4QxbFtYyXe5tlrPv0yWDH+amijz6uNHY
         TWfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779109145; x=1779713945;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OuTEZR64FKNuPtyRQsfSeTrHGtBZhqAWTR0BwH6z2gU=;
        b=LMNlQnE9JrrOzNaOD5VGF12d3AIUKqfgN32iDx94hosu5xA21hF9CBm7JiTpCNQYxy
         9VKk2Xvb7Qx/9S6VN+vT+qb4BvAPUtx70eMRrEVWoxC012mvjp9iEiQL3noerolY1YC7
         kHIgJXZks2vQxHPu/cdMGmpGoOY20GBaoQgOqPlSrBTykoSBplBgokEbU9vmrxmxS4a3
         W2YXuezMYWWe0rc+3Z2VKtV/LRKgUM9ApsGeDyoyks+jleNPpZJbLAJ5hXsgowGaPOux
         7aXJzREqxwm+ORFC1hOKnf+i1cZ8dSV34pwk9Zg8W5NUoPueSyyBVE7kCCvuTePGh/5t
         cVWg==
X-Gm-Message-State: AOJu0Yyc7pGWlmW7E/NjSTzCFBMrt0AT0k5hEYu0qa+9cQuZ98so1RN8
	pR0xdy3uzGv6/D2p/Hkgqn7F9wEIz+umDelVk4O0AjkSD0b7uQNqUwkd7Z9vWgdqFx0=
X-Gm-Gg: Acq92OEfKGRyc+mvnAnwTOP11W5xL7VTiwrPeMRFR5OzE0ArS4XnKRYBA/zPCXWtslW
	mmLfEVIjVndyDbR3Ewtp7K3Ajfq73rNyXlBudQNCc1imTRLIHPGEgC3ZHOR+zkHDf2HgWaSiNNP
	8DGNP7jokBSONMZYQVhQZzSgr3cW7FLFRXYRH9XAjo8NGA77b1RNe9vyK/mJ3IzfR2sQfiBP9Ui
	UBhsmoCwOjG5XKDDSnxMn7zQukOkMAUREdp/yyd/GUvxfQjyGpni+rCUpDUjReTJkxQaiOZqKuB
	guK1itN12iRKofjm63FiwT9g3MhujqwXGE6xv+rn5b802xZ6PKdAtzNHzppUOC8go9Hgj3fRcbO
	Of/ucP7rV3m2xTuTlWXV3ycoEdT+OTVyoUcQyE/E4jTvnT/4SUjrXLwKQuYDPvIdjzhuwDWOFC/
	SaCDjAqkyMzY2vOBhf
X-Received: by 2002:a05:7301:128f:b0:2ed:e16:6b39 with SMTP id 5a478bee46e88-303979efbeemr5948778eec.17.1779109144678;
        Mon, 18 May 2026 05:59:04 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2ea78sm13518841eec.6.2026.05.18.05.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 05:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?q?=5BREGRESSION=5D_next/pending-fixes=3A_=28build=29_implicit_declar?=
 =?utf-8?q?ation_of_function_=E2=80=98=5F=5Fhuge=5Fpmd=5Funshare=E2=80=99=3B?=
 =?utf-8?q?_did_you_mea=2E=2E=2E?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 18 May 2026 12:59:04 -0000
Message-ID: <177910914374.2347.13071319489279095550@330cfa3079ca>





Hello,

New build issue found on next/pending-fixes:

---
 implicit declaration of function ‘__huge_pmd_unshare’; did you mean ‘huge_pmd_unshare’? [-Wimplicit-function-declaration] in mm/hugetlb.o (mm/hugetlb.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:ea522c94f7a4928113e69e8165de6c30db45f5e4
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  298cc5aa5aae60cc009e3cd66ff730bb53e3e1ad


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
mm/hugetlb.c:7281:17: error: implicit declaration of function ‘__huge_pmd_unshare’; did you mean ‘huge_pmd_unshare’? [-Wimplicit-function-declaration]
 7281 |                 __huge_pmd_unshare(&tlb, vma, address, ptep, take_locks);
      |                 ^~~~~~~~~~~~~~~~~~
      |                 huge_pmd_unshare
  AS      arch/x86/kernel/irqflags.o

=====================================================


# Builds where the incident occurred:

## defconfig+kcidebug+x86-board on (i386):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-x86-kcidebug-6a0b067ed06a47b7c8f841fe/.config
- dashboard: https://d.kernelci.org/build/maestro:6a0b067ed06a47b7c8f841fe

## i386_defconfig on (i386):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-i386-build-only-6a0b0654d06a47b7c8f841d9/.config
- dashboard: https://d.kernelci.org/build/maestro:6a0b0654d06a47b7c8f841d9

## i386_defconfig+kselftest on (i386):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-i386-kselftest-6a0b0658d06a47b7c8f841dc/.config
- dashboard: https://d.kernelci.org/build/maestro:6a0b0658d06a47b7c8f841dc


#kernelci issue maestro:ea522c94f7a4928113e69e8165de6c30db45f5e4

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org
