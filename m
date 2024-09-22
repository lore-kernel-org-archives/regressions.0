Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85AE7B64A
	for <regressions@lists.linux.dev>; Sun, 22 Sep 2024 15:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727019942; cv=none; b=Oc6u9RbKld8KjqxK/7mnDW1kUxLbggdZsYXyrZV7F93iIiKSTHVH4t93Md703FkhE+RBlcWwdzj6Lk0EahsJS0sY+QqIDSkeLuj2rpELeJZZXbfG8W5J9p2sYNDiu2/gXVvAkTDp+HW0hLdsCyyZnn2Njy4HoG/Tf4O3tHa97/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727019942; c=relaxed/simple;
	bh=5cm00P7/duSL5FVyVdO+2yozFQLDsetKduqrGv58/Zo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mFxJWUSlPGtjyqUUEy59+Q43dz6SR0uS+xAMFESyNQ/TfPpmi7YADV7ilxstJRn8LyiutOb/xyXRrxQEqM2EDE0x/ygnW7WSwga577rfgtNX3tct13C2Yil2F0SBm8bZxJt0NnUFkf0VNPBv5jLAI2dpn808MT+uemgVWO8FNMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KlXPn2NF; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KlXPn2NF"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a8d24f98215so468452366b.1
        for <regressions@lists.linux.dev>; Sun, 22 Sep 2024 08:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727019939; x=1727624739; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cqw6BNVWvQvc7Ot8kytEoiRSWngnKP58LN6xDZxWNDA=;
        b=KlXPn2NFQI5J5f7eK26P9dZz/WyzjeF86ceTVX4Lx2UlwpyBn0ejrkAExTcvQ4oE+3
         p6sfOKNhPNz7GSpuGWhMj8JRfpJAqBI6YyCCuhRVRRvXQIqcdlft60wugvnxvfmJsJoj
         AE0NpQVoIENlR+hoNMdU7fsBIc7IN7yIGwE/mopxBZ6uYEh6O1Rh7744B3YbTdytRgq2
         62DpR9+6s5iILgYD6EQ+9ERDRN4UiSlWnqwQgvYUft/rhOvzosV9GGzx8vuiC/Ad4cYg
         EeemZRL/gD7aoeyGmbWn3UawTXOjpPCyiPU8v+Qxm1X+SNKfGEhM3v76KhVH44dKGsnT
         MhQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727019939; x=1727624739;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cqw6BNVWvQvc7Ot8kytEoiRSWngnKP58LN6xDZxWNDA=;
        b=Av2Law6TxgMD2alVbA1mZZdYOokizkD+wQbNGMMQrnuo6zr+djdUOt2cV2rjKl2oll
         L497b2xVCUwnYXGnTL6H7ZhP3L0zX3UcJSI52Ky7PKaYmJxeC9FqgQ+4QXQT+icaDaZA
         ph2IOeQe0NHIAuoIW1Ss12OO8Pmc+x5ZsZ3Rw6wYIHAAlrrEGB/b24fu3XUTzA2nJDgx
         us7gahn/ZV30/+Y63jdrFLyKPZMhWtXoz2eWTI20EmQE43mEET898RL03Qh5Mo8EPMvs
         5a72sxR25ZMoCt/mtg64d6VXOjcsvsOlUcnhzuE8E4IT1tIX5HF+xtaVrg8BCeqIiNyU
         WqYw==
X-Forwarded-Encrypted: i=1; AJvYcCWOTzrkfsrcuHl/d88ejF7RA17hqSnDDKzG3W17y3cLJ1aLka5Yl2ajJBY5WFmSfwBxHI9jIK5rqaebwA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz22UvLth/hdgPINb7lAE36ff96FqrTYXoBzDL8rTE6MHHDON9i
	lzsfq6jAnFJjNY/9DsmJ3s9McciBHCG1Rs0VSD2z26yQfhYQ4kAP
X-Google-Smtp-Source: AGHT+IEZ1mrt+u2uEuHyatCd9rqHewYXgMoORyuyZ9Y4CUaDm0YCEh1Lmi0FQiTXW0q4Tr7xri3XbA==
X-Received: by 2002:a17:907:7e8b:b0:a86:789f:c756 with SMTP id a640c23a62f3a-a90d50fd4aamr984027566b.53.1727019938615;
        Sun, 22 Sep 2024 08:45:38 -0700 (PDT)
Received: from debian.local ([2a0a:ef40:c56:fd01:3715:1975:8d7:6033])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612b3833sm1098163166b.128.2024.09.22.08.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 08:45:38 -0700 (PDT)
Date: Sun, 22 Sep 2024 16:45:35 +0100
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, bsegall@google.com,
	dietmar.eggemann@arm.com, efault@gmx.de, juri.lelli@redhat.com,
	kprateek.nayak@amd.com, mgorman@suse.de, mingo@redhat.com,
	rostedt@goodmis.org, tglx@linutronix.de, vincent.guittot@linaro.org,
	vschneid@redhat.com, wuyun.abel@bytedance.com,
	youssefesmat@chromium.org, spasswolf@web.de,
	regressions@lists.linux.dev
Subject: [REGRESSION] Re: [PATCH 17/24] sched/fair: Implement delayed dequeue
Message-ID: <ZvA7n9GNoD-ipjkj@debian.local>
References: <20240830123458.3557-1-spasswolf@web.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830123458.3557-1-spasswolf@web.de>

On Fri, Aug 30, 2024 at 02:34:56PM +0200, Bert Karwatzki wrote:
> Since linux next-20240820 the following messages appears when booting:
> 
> [    T1] smp: Bringing up secondary CPUs ...
> [    T1] smpboot: x86: Booting SMP configuration:
> [    T1] .... node  #0, CPUs:        #2  #4  #6  #8 #10 #12 #14  #1
> This is the line I'm concerend about:
> [    T1] psi: inconsistent task state! task=61:cpuhp/3 cpu=0 psi_flags=4 clear=0 set=4
> [    T1]   #3  #5  #7  #9 #11 #13 #15
> [    T1] Spectre V2 : Update user space SMT mitigation: STIBP always-on
> [    T1] smp: Brought up 1 node, 16 CPUs
> [    T1] smpboot: Total of 16 processors activated (102216.16 BogoMIPS)
> 
> I bisected this to commit 152e11f6df29 ("sched/fair: Implement delayed dequeue").
> Is this normal or is this something I should worry about?
> 
> Bert Karwatzki

I am also getting a similar error on boot, and bisected it to the same commit:

[    0.342931] psi: inconsistent task state! task=15:rcu_tasks_trace cpu=0 psi_flags=4 clear=0 set=4

#regzbot introduced: 152e11f6df293e816a6a37c69757033cdc72667d
