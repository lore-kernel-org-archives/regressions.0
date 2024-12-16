Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A1381ACA
	for <regressions@lists.linux.dev>; Mon, 16 Dec 2024 15:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734362607; cv=none; b=FUKLTRyxnq0klT4R4/b25uN9X5+SmwYzFntDOj3UW87JwsZzHRJLi1STG1BPyj1RLqobcOal+qLlEm4TWp66aDCPnX2eBa74JhJ+ZGrF3sV6Xq4sIIfRFoO5BZ5mmbPalBM7JeiYHFB4ZlqfwM1PBpFSm5yd4NBraRRWmSGi8b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734362607; c=relaxed/simple;
	bh=QtQQsUiJel4bUfPgyvGeB68f8I6g4jzU2Xy/nrs5h8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=sfFPID0CjEFKY//5oA9As4p+u6MNgMWwFIowYbHilb+5tv+3Zw+Hcxp+POtdIQWQKL+wrna7kLEmBSO8kkL5O9YWk9atDX69H6poNLZpASKiIMUiYncxJbk3Iohhuk0qeSEMq5LgbmtzfIFR56Z5F3dRFQBcjMwLbc2U9JbBaGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XEAzqkQ8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XEAzqkQ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734362604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=22hfpCiAB76G1lhRVgQIdpwqzCYya1oQySaYuhV9NKI=;
	b=XEAzqkQ8mNlZReIkg1VuXgJZO6Tg+VDeOxDhRnUG3k6uZ9KdUTmsCbKdKqPJsb7O2hQlTQ
	xdFo3ZJJzf+YTGj5OYo8mgbrtBQzFis4WI+i1pqfvXtmkx5Q85Omdqe3+Eni6Snux60Ty+
	Qk7H9J/AGxYaO8eloNc4EGBF7ZSQDKs=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-7-CI7Y-BOyCSh-GwIDN_uw-1; Mon, 16 Dec 2024 10:23:23 -0500
X-MC-Unique: 7-CI7Y-BOyCSh-GwIDN_uw-1
X-Mimecast-MFC-AGG-ID: 7-CI7Y-BOyCSh-GwIDN_uw
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d88ccf14aeso81031776d6.1
        for <regressions@lists.linux.dev>; Mon, 16 Dec 2024 07:23:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734362603; x=1734967403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=22hfpCiAB76G1lhRVgQIdpwqzCYya1oQySaYuhV9NKI=;
        b=M+dzt9CKKtB6IiMrtgplwVKubt9jvVhOkoN7/xkwQAZEajTTGKwuQrugNG8XM0feOk
         nd3jTQdmeZPm4qEq2RhpUw1T/Kh4mryBiF6JvHKtxLuWznoEtigJez+HlSVABvynNw61
         18kopRqqbVA4mTY24kaYluDisyz3lKonI355A+1vGrbM/zQb/DHWKd04LrYmUs+bmlGL
         W5204weuZ3KTq4DHsYJaheGUb/7LQvHkKNZpzxcNj7eTa6z9/bdGzR6B5GhQh5GOnwJN
         P+22jjr8WONMOY5BOp067kLsqo30ywy1W8LejAK52Pc56zCR8jh4sAKEn/uyLnZplgZe
         xTKg==
X-Forwarded-Encrypted: i=1; AJvYcCWH5MY140rzdlmg3ckyAXuKJrCZVdjBJSKZvsoOQjBiAoPWq+bxByiO8ZhAl75Ld8ArRaKqHM340Y4+Tg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxbmY7KrsoqukMv6BXyCwGn8zBrzuYIoKcrXQKfGGq8ssbzptyl
	SFMhK04d0LwbNNZs8y9xZArr16amhKF7Iaa9bO9OSCPKCsvUJqyp7yiKudS6Xuo7YulWw1pdhnk
	j6VCg0RRlL3I+gUzyX8vvUvwdip/nJTq+gTWK/L62hSZ129rvjm/ceMb4YiHf
X-Gm-Gg: ASbGncvOvpcS/kj29PgMtOgCMacw6y0W+adBQF5Ihz7fMXLtM2KT0G1mp5K5jYO+0kd
	xcEVRqUde2RycLQOXpOKl1hp4EYP4gY8Z5mmfZpH0lC9aSai5TwdWOB9QslxqE6ynG7PQv4m9eL
	PjdcP7dHpguNETh1iVAP78MsKA8Oy3O1dVGGVl0Qi9GNOJC35osLkHfdyDt+cIz36mtKwB1dfD0
	aR5P5ZxW6SoynnCytoQggEvsdM0sQyW2jWoYrhgqRcSueDneE0QYUYAffG5Zj8QN1I8qYUND+ld
	jYtYzDvHhEz3XDbrWiC8bkTMsGWE0DyLCVo1LTFjsTk=
X-Received: by 2002:a05:6214:194e:b0:6d4:2646:109c with SMTP id 6a1803df08f44-6dc844afed0mr215332076d6.3.1734362602939;
        Mon, 16 Dec 2024 07:23:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7QXHgGXzgEjQZ3uTdpr42Buq+L+mX3JmSnr4maysHO6br7rvRW5Vl5hNJwPdDyY7Ey/ZXYQ==
X-Received: by 2002:a05:6214:194e:b0:6d4:2646:109c with SMTP id 6a1803df08f44-6dc844afed0mr215331766d6.3.1734362602600;
        Mon, 16 Dec 2024 07:23:22 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb (host-80-47-197-226.as13285.net. [80.47.197.226])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd279544sm28346516d6.70.2024.12.16.07.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 07:23:22 -0800 (PST)
Date: Mon, 16 Dec 2024 15:23:18 +0000
From: Juri Lelli <juri.lelli@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ranguvar <ranguvar@ranguvar.io>, Juri Lelli <juri.lelli@gmail.com>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, "regressions@leemhuis.info" <regressions@leemhuis.info>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	juri.lelli@redhat.com
Subject: Re: [REGRESSION][BISECTED] from bd9bbc96e835: cannot boot Win11 KVM
 guest
Message-ID: <gvam6amt25mlvpxlpcra2caesdfpr5a75cba3e4n373tzqld3k@ciutribtvmjj>
References: <jGQc86Npv2BVcA61A7EPFQYcclIuxb07m-UqU0w22FA8_o3-0_xc6OQPp_CHDBZhId9acH4hyiOqki9w7Q0-WmuoVqsCoQfefaHNdfcV2ww=@ranguvar.io>
 <20241214185248.GE10560@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241214185248.GE10560@noisy.programming.kicks-ass.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: abNjfcbGgAWGgeRDLqE_cr1XS01sYP0TaG92pH6zL9U_1734362603
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 14/12/24 19:52, Peter Zijlstra wrote:
> On Sat, Dec 14, 2024 at 06:32:57AM +0000, Ranguvar wrote:
> > Hello, all,
> > 
> > Any assistance with proper format and process is appreciated as I am new to these lists.
> > After the commit bd9bbc96e835 "sched: Rework dl_server" I am no longer able to boot my Windows 11 23H2 guest using pinned/exclusive CPU cores and passing a PCIe graphics card.
> > This setup worked for me since at least 5.10, likely earlier, with minimal changes.
> > 
> > Most or all cores assigned to guest VM report 100% usage, and many tasks on the host hang indefinitely (10min+) until the guest is forcibly stopped.
> > This happens only once the Windows kernel begins loading - its spinner appears and freezes.
> > 
> > Still broken on 6.13-rc2, as well as 6.12.4 from Arch's repository.
> > When testing these, the failure is similar, but tasks on the host are slow to execute instead of stalling indefinitely, and hung tasks are not reported in dmesg. Only one guest core may show 100% utilization instead of many or all of them. This seems to be due to a separate regression which also impacts my usecase [0].
> > After patching it [1], I then find the same behavior as bd9bbc96e835, with hung tasks on host.
> > 
> > git bisect log: [2]
> > dmesg from 6.11.0-rc1-1-git-00057-gbd9bbc96e835, with decoded hung task backtraces: [3]
> > dmesg from arch 6.12.4: [4]
> > dmesg from arch 6.12.4 patched for svm.c regression, has hung tasks, backtraces could not be decoded: [5]
> > config for 6.11.0-rc1-1-git-00057-gbd9bbc96e835: [6]
> > config for arch 6.12.4: [7]
> > 
> > If it helps, my host uses an AMD Ryzen 5950X CPU with latest UEFI and AMD WX 5100 (Polaris, GCN 4.0) PCIe graphics.
> > I use libvirt 10.10 and qemu 9.1.2, and I am passing three PCIe devices each from dedicated IOMMU groups: NVIDIA RTX 3090 graphics, a Renesas uPD720201 USB controller, and a Samsung 970 EVO NVMe disk.
> > 
> > I have in kernel cmdline `iommu=pt isolcpus=1-7,17-23 rcu_nocbs=1-7,17-23 nohz_full=1-7,17-23`.
> > Removing iommu=pt does not produce a change, and dropping the core isolation freezes the host on VM startup.
> > Enabling/disabling kvm_amd.nested or kvm.enable_virt_at_load did not produce a change.
> > 
> > Thank you for your attention.
> > - Devin
> > 
> > #regzbot introduced: bd9bbc96e8356886971317f57994247ca491dbf1
> > 
> > [0]: https://lore.kernel.org/regressions/52914da7-a97b-45ad-86a0-affdf8266c61@mailbox.org/
> > [1]: https://lore.kernel.org/regressions/376c445a-9437-4bdd-9b67-e7ce786ae2c4@mailbox.org/
> > [2]: https://ranguvar.io/pub/paste/linux-6.12-vm-regression/bisect.log
> > [3]: https://ranguvar.io/pub/paste/linux-6.12-vm-regression/dmesg-6.11.0-rc1-1-git-00057-gbd9bbc96e835-decoded.log
> 
> Hmm, this has:
> 
> [  978.035637] sched: DL replenish lagged too much
> 
> Juri, have we seen that before?

Not in the context of dl_server. Hummm, looks like replenishment wasn't
able to catch up with the clock or something like that (e.g.
replenishment didn't happen for a long time).

