Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867732;
	b=iajV3FbMpnA0q0O3M3yFEzmBXD/VH3aG/i7TDGrrOjJgWyO9GeJ2C7qb1V3X5157/kvX
	 6bm5+bfkyN3ZIloiDLBK0gpsc9kjRFrCsbNTAKNE+B4fRUmfpqGwagGraqHRNBpyERPD3
	 AMNhS7I3jAKp7KrFuE2sHXFQaj41+YU7RP9q8hHQQaWj+0rAcSbwUyI6rkZKHE4BiEtZ4
	 6oqGU+u9AEGxJPLe+B10mYtEumgZnMS4KaZ4U6E97ltNKGjoq4RPXTObduJYYkn86xkqU
	 MPp4axFoTxnnvXB0dZGUIm88F3iDdYakWCJ5Sdkx+IZ/nrGkxR4Q3bR3G+x6ExLDzUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pMSexfhR541OuPmIYjYfQMR9TxRQH7Bx+m2xGYqk6uo=;
	b=KbKywJMpulnwxGPEgwYQWT68QbXt67XHXGh9fEMTxI4lAoChsEE7r7IWJoJtHnqXLdVH
	 SOnjQh6AfVjMPq3xxvnO7DUvFWhtT9VmXGvc7LORQwt0W6rRkrWk2FfbqAW+Jt4a4tt/M
	 kRW20MTd5Y54guiRjLPblRNdwvtZ4GeCTTXPuhkhqMta3j3rELy+yU6ri35XJxjCCLinm
	 qFzeZD1A4jhlptV3X5IwLiVo14J0++onEFmMs4SUFhMFDkx+umBpLunGrLy5qYErpUbpu
	 HzWovunBWGDMBFc18/SLhUiAJw57RTCdFZJUOtbI/J7dbUX+wgZMKuvRz6yKyvZRopg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LDDoIn/N";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E749606A31C
	for <regressions@lists.linux.dev>; Mon, 16 Nov 2026 22:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E749606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LDDoIn/N
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so14862175e9.3
        for <regressions@lists.linux.dev>; Mon, 16 Nov 2026 14:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794867730; x=1795472530; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pMSexfhR541OuPmIYjYfQMR9TxRQH7Bx+m2xGYqk6uo=;
        b=LDDoIn/N5cUXcQ1vYbGJDVj4gn21d36e4KCJi0oD+zGsXVXVbtjcDieAqiaR7EmU+u
         08jmv0gSkenkBdH2nd6sLhxkcAxlMzg+S1rgcOqNWKWzyKr0s+CTxYk6BYvtkWIQL6rQ
         j43n5RPv8C1ABUX4bss0Oq+Eb2/ZDWEAjkffM1LeEF0+rlLnicLnU/5wyamelyE0Yev2
         qpPeV73R23z4JlWUQ0oQB61w4Xz3500vbxRt54ys4jaSMsMOkr2dWJlnjnJeIJqyBdQe
         HDe0aBVq9lZOyWrpMH6mI7ZMSe1V063G5u12KRxPwhSrHCdgQj4r/RaEDCiew8XhF8ba
         at5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794867730; x=1795472530;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMSexfhR541OuPmIYjYfQMR9TxRQH7Bx+m2xGYqk6uo=;
        b=u83jKwgObb7EQFZLpWEH370ZXvAM1SyUjw8Q/GlqKjTzOC20i0aOFRWlNAx7s0U3Vn
         aJCsU0cCS3BiejIqtNBi51MEoGNlv3Arop62yKDNHEWSkXKndZg+47Mmuk1cljXfLdK8
         fSHpKGJTWGIPBSsGcPHo0A476tWKbXavWLErG3TjmLZHhSoQvAcPTR9roLyWxwef6zsK
         0bd1KtS/xAYOfMEi30ZSRSy9sWaUdOXf7WPuMCflgye9DMArqOitvS1+rSJL6MQWSMZl
         1KgXHoRpHTtgvCHUTkuGecr8lOFZ5ve7P7nJSP6ghtFHwPqy/yxnMDFH+lQfc08FyXHn
         ZRmA==
X-Forwarded-Encrypted: i=1; AL+hErElKWXmuiudQiAG12v7mCxz1UudE4dwV6M7TVMUn0kyE/NU1lAWa2KfoYyvEvbZW9WXMWF7tYNYjCGJ1w==@lists.linux.dev
X-Gm-Message-State: APuU4Z/IiipfHZr08DbUHDEJ325CWI3scYi+/w/NMTLj+q8mKOT0VjX9
	dcZjS8hhwy53vGKfIACKmoT9iB6ovq128hXUjqXFZscAnUjRhQU42qQI
X-Gm-Gg: AYBFou1C9MZk7lygO68JWCcczNFjXFDqCU16G23LsE9mcsbFkR17r8zck6p6ry7I2xd
	GHJcUWH7zwzNOWBGpffRC2SO7nfR6bMZbCu26lQ+/cesOrfFmgTz7kQyhO7sBlBN/xKCpeWmU0U
	mxM43tRkhf51F4py6TJdohr18SBtNovNg78YbTgrEOYm+Hum1eNd1AvJd2J+eivAsRH1M0K31iv
	q+FPT8NJKzlBOlbOHZL7IowbSTAv0o/qwXvprNLgXiQSWyrNuRm2/Dl4FXT2j2WBTHPeoEWDRls
	u38UbZ++3BaTAMvGW3vhA/B2vuIqWiZS6o+TaVhW+06ECIpYjViMsfgy7cOQarnjE5B8nBnJfr0
	ZYmbSoxeCEpWr6VGAxryCvc2r1iPxW/aVGfZVwKcp6WXi2xEHQ0b8JWqI0WS5kyi2N2T2iurMPh
	qCwEp5GXk4VVwz7pJAfnDFN+69vGfhagpRuMtc7uZKwR49L0Wzak9m/rBZe4WDprrumw9PDEr45
	WvH4pY3iqkYNXNwAoF2ea2WpdO/KKho6J81N8I7yFbiWhYMej8s37siP58cTx8N8X+at3Cg+oKC
	p7iJFJP0ym/Wp8z1ktoH6AqNA4hrKn5sxzZ1Uq7De49zNUaUPu8ReVS3ChrlRivOqdG9Dg==
X-Received: by 2002:a05:600c:548e:b0:4bb:6a5a:782d with SMTP id 5b1f17b1804b1-4bb6a5a78demr119774955e9.17.1794867729993;
        Mon, 16 Nov 2026 14:22:09 -0800 (PST)
Received: from lima-fedora ([185.184.13.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783862d6sm17255175e9.2.2026.11.16.14.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:22:09 -0800 (PST)
Date: Mon, 16 Nov 2026 23:22:07 +0100
From: Mihail Mihov <mihovmihailp@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, longman@redhat.com, chenridong@huaweicloud.com, 
	juri.lelli@redhat.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jstultz@google.com, kprateek.nayak@amd.com, qyousef@layalina.io, 
	regressions@lists.linux.dev
Subject: [REGRESSION] core scheduling latency with idle load
Message-ID: <avt_mdiPQ5gwAisa@lima-fedora>
References: <20260605105513.354837583@infradead.org>
 <20260605124052.227463677@infradead.org>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605124052.227463677@infradead.org>

Hi Peter,

I was running some experiments that co-locate a latency-sensitive
service with SCHED_IDLE batch work in a cpu.idle=1 cgroup, with the
service in its own core-scheduling cookie. After updating to 7.3 its
tail latency got much worse. With the help of an LLM I bisected it to
85570f10a4c6 ("sched/eevdf: Move to a single runqueue") and reduced it
to the script below. It is still present in v7.4-rc3.

Reproducer (root, SMT machine, CONFIG_SCHED_CORE, cyclictest):

#!/bin/sh
set -e
mkdir -p /sys/fs/cgroup/be
echo 1 > /sys/fs/cgroup/be/cpu.idle
trap 'echo 1 > /sys/fs/cgroup/be/cgroup.kill; sleep 1; rmdir /sys/fs/cgroup/be' EXIT
# one SCHED_IDLE spinner per CPU in the cpu.idle=1 cgroup
chrt -i 0 sh -c 'echo $$ > /sys/fs/cgroup/be/cgroup.procs; for i in $(seq $(nproc)); do while :; do :; done & done'
sleep 1
# p99 from cyclictest's 1 us histogram, overflows (> 1 s) included
p99() { awk '/^[0-9]/ { h[$1+0] = $2; n += $2 } /Overflows/ { o = $4 } END { n += o; for (i = 0; c < n * 0.99; i++) c += h[i]; print "p99", i - 1, "us" }'; }
printf 'no cookie: '; cyclictest -q -m -i 1000 -D 10 -h 1000000 | p99
printf 'cookie:    '; coresched new -- cyclictest -q -m -i 1000 -D 10 -h 1000000 | p99

i7-1185G7 (4C/8T), vanilla kernels built with the same config (Gentoo's
distribution kernel config, HZ=300, PREEMPT_LAZY). p99 in us:

  kernel            no cookie  cookie
  85570f10a4c6^     54         59
  85570f10a4c6      53         3695
  v7.3.4            54         3276
  v7.4-rc3          53         3290

I also tried the two cpu.idle preemption fixes under discussion [1][2]
on v7.3.4; the cookie p99 stayed around 3.1 ms with both.

Changing cgroup_mode (up, smp, concur, max, tasks) on v7.4-rc3 did not
fix it.

On Fri, Jun 05, 2026 at 02:40:20PM +0200, Peter Zijlstra wrote:
> @@ -14893,30 +14803,8 @@ bool cfs_prio_less(const struct task_str
[...]
> -     se_fi_update(sea, rq->core->core_forceidle_seq, in_fi);
> -     se_fi_update(seb, rq->core->core_forceidle_seq, in_fi);

In case it helps: adding these two calls back on v7.3.4 brought the
cookie p99 back to 55 us. I don't know whether that is the right thing
to do, only that it changes this result.

Thanks,
Mihail

[1] https://lore.kernel.org/all/20261019182622.1584454-1-vincent.guittot@linaro.org/
[2] https://lore.kernel.org/all/20261105165525.011876858@infradead.org/

#regzbot introduced: 85570f10a4c6
