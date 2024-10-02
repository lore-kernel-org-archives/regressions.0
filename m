Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0596B1E7646
	for <regressions@lists.linux.dev>; Wed,  2 Oct 2024 11:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727868270; cv=none; b=KfRS/+5IiP9U98PZN/ndEcjIJWsmmpzlPPBr01PyAr4Tq47uKj90rOx2TPx04Aw7V3kaqxpIfZkRc95quEDJMImEMMVOmToGr72ltzZX3kB6Qgz4M6/n0SjXo3NQOI0+ja19JNagivFchsvQ7ynctxhubGEF5maF16nSu3MF7NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727868270; c=relaxed/simple;
	bh=W6FjUp5qOJuqWglQr1p7aYktNtf8BUY26828SH+ADeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lsRVNFlm9Ija9m/24LcuHOxoHhYg9HfuJUl86xVI1nTV1AeeGvGtrwOPfFgPtLiGXS3vKwuyWxQxMAIt/q8szFcgvRl+Uox1/w3DAEqin53jHYE8JCx8vP+I12jbrTx4iF9aCpIBeiMalcJiIXDC1BQUaTnFNqh0ciknlFs0768=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fyzVo0bk; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fyzVo0bk"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cba6cdf32so58990365e9.1
        for <regressions@lists.linux.dev>; Wed, 02 Oct 2024 04:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727868267; x=1728473067; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FcLNlXBmYa+OUDtH1YmpqBo5nbDJcEl/hRVnSXUYy2U=;
        b=fyzVo0bkXJm+PGXe+YQz/O+ByJ9Jp5R7vCwPn9o+pSYJmwFBJV2iXAG/QqM/B3SEuw
         QlZbflg6aSJYex5o8MJXIXHkSMNfZCPlrNsMHAyNW/mm+i13ylCXA8SllnT29k+uWiDI
         7DzugE2ZRK9BWpJLB8cHk/pyXVdcDzBSCcaGH1XuxPBFuuP+yKmwroU0k7fJqsdfQBQV
         8LxY4TUpnyQ7WQcLMSvOuKejCvDG2PXXfyvxBQEknkNl2SdsFipGVzBfYgjKbk1U7eYP
         QzqPSL4nlwbeazQjmVjoWp1ZgHB690KP+EbO8sv2cRwVuiiXSpxWR8l6xVXXr8HDHbrI
         jOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727868267; x=1728473067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FcLNlXBmYa+OUDtH1YmpqBo5nbDJcEl/hRVnSXUYy2U=;
        b=X4NrXCJxEm/5u7wMXP8nfWovpP+JSP71S0IxsWEtxlR+I27n64/gA67KDpSYnoJnDN
         lDLRuzSznLKaFeQXhbMX7jQpSn5HUNLn1j8MO6EqvgGjNmYYJTdgo3m9aEQQWUS+5204
         wFoa7T/v/IjBGMrp75tUFDijdFqHjPOLyUonA6Re4U4+e+iQvNwrJ12sdeMKQGbNYJgG
         QcCyqUfbUg+wCqgrwuLd7RnvWKiNB6k8WSvNtr5yL5iqrKHZf63aOubYVLG+aVEQJJgT
         JISzLoDv6cyL6M/74aRH6HRGWHMi0U/KfS6LHpMhQ+LcUgoBUEYYlF8UhxhsboFo8CHK
         VkBA==
X-Forwarded-Encrypted: i=1; AJvYcCU2vA4bGA6yK9PqUZZm2JLmXuH44RnjMxa+a4aTsjagXPPpA3o8QJ4gARU0m4n2wSofkH35onrY/IDLLQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyr3AR+q81WAwz9QC3IQIOR7e1Rtdnq6YyC8QcLcsHCpX/DWm7k
	eh+jjSgyKXmp2aRwCEiALEvOJ6c9J1lg9VUMd/uWvku9bkpM8H6wCXn6dKKibANtvIES4d6Et1G
	v
X-Google-Smtp-Source: AGHT+IE+unZYeyT7IcoUfkc76BvB+aQnEO6Ki9Tzer3ZMIoT2Nu535PN1YVVYnDvG7jGhoeYb/pDtw==
X-Received: by 2002:a05:600c:4f86:b0:42c:b80e:5e50 with SMTP id 5b1f17b1804b1-42f777633f9mr20596915e9.0.1727868267302;
        Wed, 02 Oct 2024 04:24:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f79d8d409sm16277245e9.1.2024.10.02.04.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 04:24:24 -0700 (PDT)
Date: Wed, 2 Oct 2024 14:24:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Kairui Song <kasong@tencent.com>
Cc: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	linux-mm <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: next-20241001: WARNING: at mm/list_lru.c:77 list_lru_del
 (mm/list_lru.c:212 mm/list_lru.c:200)
Message-ID: <e718bc99-e63b-4adb-9e40-2379f48301f5@stanley.mountain>
References: <CA+G9fYvo5npQ3o_vgiOX2guHtgafRoFPL__4O8Kcwg2=ssXmKg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="y+7EcPOXsnI0Fodd"
Content-Disposition: inline
In-Reply-To: <CA+G9fYvo5npQ3o_vgiOX2guHtgafRoFPL__4O8Kcwg2=ssXmKg@mail.gmail.com>


--y+7EcPOXsnI0Fodd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Let's add Kairui Song to the  CC list.

One simple thing is that we should add a READ_ONCE() to the comparison.  Naresh,
could you test the attached diff?  I don't know that it will fix it but it's
worth checking the easy stuff first.

regards,
dan carpenter

On Wed, Oct 02, 2024 at 04:40:36PM +0530, Naresh Kamboju wrote:
> The following kernel warnings have been occurring on arm64 DUT and qemu-arm64
> running Linux next-20240930, next-20241001 and next-20241002 while
> booting the kernel.
> 
> This is an intermittent warning noticed on arm64
>  - Juno-r2
>  - Dragonboard-410c
>  - Qemu-arm64
> 
> First seen on next-20240930
> 
>   Good: next-20240927
>   BAD:  next-20240930..next-20241002
> 
> Since this is an intermittent problem hard to bisect.
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> Warning log:
> ----------
> <4>[   26.293906] ------------[ cut here ]------------
> <4>[ 26.295948] WARNING: CPU: 1 PID: 1 at mm/list_lru.c:77
> list_lru_del (mm/list_lru.c:212 mm/list_lru.c:200)
> <4>[   26.299608] Modules linked in: fuse drm backlight ip_tables x_tables
> <4>[   26.308212] CPU: 1 UID: 0 PID: 1 Comm: systemd Not tainted
> 6.12.0-rc1-next-20241001 #1
> <4>[   26.310552] Hardware name: linux,dummy-virt (DT)
> <4>[   26.313304] pstate: 23400009 (nzCv daif +PAN -UAO +TCO +DIT
> -SSBS BTYPE=--)
> <4>[ 26.315519] pc : list_lru_del (mm/list_lru.c:212 mm/list_lru.c:200)
> <4>[ 26.316457] lr : list_lru_del (mm/list_lru.c:76 mm/list_lru.c:200)
> <4>[   26.317603] sp : ffff80008002b950
> <4>[   26.319015] x29: ffff80008002b950 x28: fff00000c0540240 x27:
> 0000000000000000
> <4>[   26.321155] x26: fff00000c2dce690 x25: 8000000000000000 x24:
> 0000000000000000
> <4>[   26.322653] x23: fff00000c0c4e900 x22: fff00000c12f4478 x21:
> fff00000c12f4458
> <4>[   26.324697] x20: fff00000c1b14800 x19: fff00000c0542088 x18:
> 0000000000000000
> <4>[   26.326121] x17: 0000000000000000 x16: 0000000000000000 x15:
> 0000000000000000
> <4>[   26.327590] x14: 0000000000000000 x13: fff00000c146b940 x12:
> 0000000000000005
> <4>[   26.329087] x11: 0000000000000000 x10: 0000000000000402 x9 :
> 0000000000000003
> <4>[   26.330650] x8 : ffffffffffffffff x7 : 0000000023d53570 x6 :
> 0000000023d53570
> <4>[   26.332484] x5 : 00000000000f000c x4 : ffffc1ffc3032e20 x3 :
> fff00000c2f70800
> <4>[   26.334759] x2 : 0000000000000000 x1 : 0000000000000000 x0 :
> 0000000000000001
> <4>[   26.338095] Call trace:
> <4>[ 26.339907] list_lru_del (mm/list_lru.c:212 mm/list_lru.c:200)
> <4>[ 26.340990] list_lru_del_obj (mm/list_lru.c:221)
> <4>[ 26.341972] d_lru_del (fs/dcache.c:463)
> <4>[ 26.342794] to_shrink_list (fs/dcache.c:477 fs/dcache.c:887)
> <4>[ 26.343615] select_collect (fs/dcache.c:0)
> <4>[ 26.344524] d_walk (fs/dcache.c:1278)
> <4>[ 26.345384] shrink_dcache_parent (include/linux/list.h:373 fs/dcache.c:1511)
> <4>[ 26.346512] d_invalidate (fs/dcache.c:1617)
> <4>[ 26.347451] proc_invalidate_siblings_dcache (fs/proc/inode.c:143)
> <4>[ 26.348744] proc_flush_pid (fs/proc/base.c:3480)
> <4>[ 26.349747] release_task (kernel/exit.c:281)
> <4>[ 26.350810] wait_consider_task (kernel/exit.c:1253 kernel/exit.c:1477)
> <4>[ 26.352093] __do_wait (kernel/exit.c:1617 kernel/exit.c:1651)
> <4>[ 26.353151] do_wait (kernel/exit.c:1693)
> <4>[ 26.353958] __arm64_sys_waitid (kernel/exit.c:1775
> kernel/exit.c:1788 kernel/exit.c:1783 kernel/exit.c:1783)
> <4>[ 26.359772] invoke_syscall (arch/arm64/kernel/syscall.c:50)
> <4>[ 26.360706] el0_svc_common (include/linux/thread_info.h:127
> arch/arm64/kernel/syscall.c:140)
> <4>[ 26.361477] do_el0_svc (arch/arm64/kernel/syscall.c:152)
> <4>[ 26.362218] el0_svc (arch/arm64/kernel/entry-common.c:165
> arch/arm64/kernel/entry-common.c:178
> arch/arm64/kernel/entry-common.c:713)
> <4>[ 26.363014] el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:765)
> <4>[ 26.364138] el0t_64_sync (arch/arm64/kernel/entry.S:598)
> <4>[   26.365321] ---[ end trace 0000000000000000 ]---
> 
> boot Log links,
> --------
>   - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241001/testrun/25235075/suite/log-parser-boot/test/check-kernel-exception-warning-cpu-pid-at-mmlist_lruc-list_lru_del/log
>   - https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2mp2m5m4PnjJgdix32h7pIGe63Y/logs?format=html
> 
> Test results history:
> ----------
> - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241002/testrun/25242215/suite/log-parser-boot/test/check-kernel-exception-warning-cpu-pid-at-mmlist_lruc-list_lru_del/history/
> 
> metadata:
> ----
>   git describe: next-20241001
>   git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>   git sha: 77df9e4bb2224d8ffbddec04c333a9d7965dad6c
>   kernel config:
> - https://storage.tuxsuite.com/public/linaro/lkft/builds/2mp2jhmSKhlF6c0x1SBsJFyBbTq/config
>   build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2mp2jhmSKhlF6c0x1SBsJFyBbTq/
>   toolchain: clang-19 and gcc-13
> 
> Steps to reproduce:
> ---------
> - https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2mp2m5m4PnjJgdix32h7pIGe63Y/reproducer
> - https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2mp2m5m4PnjJgdix32h7pIGe63Y/tux_plan
> 
> --
> Linaro LKFT
> https://lkft.linaro.org

--y+7EcPOXsnI0Fodd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=diff

diff --git a/mm/list_lru.c b/mm/list_lru.c
index 79c2d21504a2..a9a8b02e056a 100644
--- a/mm/list_lru.c
+++ b/mm/list_lru.c
@@ -74,7 +74,7 @@ lock_list_lru_of_memcg(struct list_lru *lru, int nid, struct mem_cgroup *memcg,
 		else
 			spin_lock(&l->lock);
 		if (likely(READ_ONCE(l->nr_items) != LONG_MIN)) {
-			WARN_ON(l->nr_items < 0);
+			WARN_ON(READ_ONCE(l->nr_items) < 0);
 			rcu_read_unlock();
 			return l;
 		}

--y+7EcPOXsnI0Fodd--
