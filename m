Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFD819B5B4
	for <regressions@lists.linux.dev>; Tue, 17 Dec 2024 08:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734425841; cv=none; b=B6TmnyLVqYw22OLWILnkF20+5Ea3sqgOOTugktlEIOaag4slqpTOzv423wEHk6+rTu/yEPqXIQDHBVq6HpbT8ElNPPvEKMzDmpSK4XC0CfXd4mzN+CmxRbbLg+kxCCulsLKKlhTiwRphWZFrVMFPWfWy8wQbBTj2M1oQrCktIgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734425841; c=relaxed/simple;
	bh=my89gapazaRXABx0ds8EDdV5LyYYL2x4cidIM74wTVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=F55r5Ip6R02MIPA0rNzM4Po8+LYUuCMCl/Df0yB7AnabKF4G56BogHAbH13ANpjKFf1cfW0arSVLRphE0KcDpZ6NAJSee5m7qQyjCnw/3RuDOi6G3UiwfOggwAR9SSPVEvgrBIiu0ZxG6Jjr9bZM7hrF7ZnXA+VTZLkyhAZ0/RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jFCw6vNY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jFCw6vNY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734425838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e36MqRAUUxdsVobCeHh3rEjTnXYHMB/28HuSecqnBzU=;
	b=jFCw6vNYan504jBB4wZB9SbjOBHITFDAg51rRIikZ7zjte6SXLjM/ETav1Ygwe83k4CPOC
	oD+jYi+rXshEBZItmoOMRk4oY0ow1pIsK2lMWH8W+CYbdYhA9O5XM+VKvZigpYKLYtaT9d
	lzo7CeluNgWScLqOV8HwGU5dB5zDbxA=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-nnHqiwHKP0qZtOY76FpgMQ-1; Tue, 17 Dec 2024 03:57:17 -0500
X-MC-Unique: nnHqiwHKP0qZtOY76FpgMQ-1
X-Mimecast-MFC-AGG-ID: nnHqiwHKP0qZtOY76FpgMQ
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d8e891a5f7so60083966d6.2
        for <regressions@lists.linux.dev>; Tue, 17 Dec 2024 00:57:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734425837; x=1735030637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e36MqRAUUxdsVobCeHh3rEjTnXYHMB/28HuSecqnBzU=;
        b=uz6fjzyLNZQJ63pUBr+h1kcUfJOXqYWVLBqIW1AGpyyqb16OS/mkTYuLXPel/e5yua
         1gSGdmhPo+KGnAronCw5p+XX5NQPXKwp9R8GCxBpaPqzY8FqguzEgdGDN5R5BVlIXjJ0
         3VA3q2s0IHDBvXTKIEYJKodVzu0BkTSXbOUutUc6P1TawIvu8z//Y4P0RSrpst9qCUXX
         tTh++1bBUE4AfGQJI9Yf5Q3yx2o2diPUBPeImBdvuZUsNd5jTP398iyY1snhaKVan4r0
         Q6jG+7EfoE0UH4D8rrQmDAUN/yKKogal33XX5Lxz48V3iK7o40/HIMkLFHef1PXqnoL7
         JNEA==
X-Forwarded-Encrypted: i=1; AJvYcCW00pubDtvQQ02rv2jW4tHcgzrk6cefql8XjtrXpxD57T1kjTpllvA/yq1l0cXSOZbZX3/X55+Dxr0Qsg==@lists.linux.dev
X-Gm-Message-State: AOJu0YziBGxPJZeNnnP/r2fRzkmfriGelz3xXtY08dOOiW+f2ATwaDNU
	egdjEa6oL3PWCfaEfyY6+B4hx8kE1dn/r+RtFDPzVC2JE/gH4BsGWgZKuM0x8D8/lT5hTh93Sj1
	c87qs0+omt39InPpQ54D/q7rPJ4fm8vDds4CJxFrdR1p/et/MrJxzKO5Tx9CM
X-Gm-Gg: ASbGnctneOxCnOoVzenxWTtiZiHFz1WahrdJfwDCxAjjoFxlCigNB9dBNVQNRwt6tNG
	SAZxaNVyAXg0cuueTl0O49vir55zWM1A1fHaf9VoH28TQVLgEGu4rKM/7Wst94vNTcTWrNMV1dP
	PW9soYNqCiZsIyi3clv/EPR1cjONlpK9oXV5VJc+buJqb8WrCPha8EOqBb+4yAR+BGHMJzJbzYf
	3M9MWxv20tunN98tD4DQiqZbYIpfQe3cPFrV7lE4sbClReccF+dWZ3Nd1vehW4JxMcfg0bZyL1i
	NAeEqkWqgzdgjkPVGt2XmR33/QNSo/8K1XiDBAAPRzE=
X-Received: by 2002:ad4:5c6f:0:b0:6d8:a32e:8426 with SMTP id 6a1803df08f44-6dc86ad7976mr257129856d6.3.1734425837030;
        Tue, 17 Dec 2024 00:57:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7OHDlYB62X/RjbCS6tlztv/Jo/Zkez7NULudfz1M3aDsbY23BSx9G1w3C9AIZrsP6H+k8zA==
X-Received: by 2002:ad4:5c6f:0:b0:6d8:a32e:8426 with SMTP id 6a1803df08f44-6dc86ad7976mr257129666d6.3.1734425836698;
        Tue, 17 Dec 2024 00:57:16 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb (host-80-40-237-196.as13285.net. [80.40.237.196])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd25a0c9sm36322796d6.33.2024.12.17.00.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 00:57:16 -0800 (PST)
Date: Tue, 17 Dec 2024 08:57:11 +0000
From: Juri Lelli <juri.lelli@redhat.com>
To: Ranguvar <ranguvar@ranguvar.io>
Cc: Sean Christopherson <seanjc@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@gmail.com>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"regressions@leemhuis.info" <regressions@leemhuis.info>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>
Subject: Re: [REGRESSION][BISECTED] from bd9bbc96e835: cannot boot Win11 KVM
 guest
Message-ID: <Z2E858-8jA6_xWFd@jlelli-thinkpadt14gen4.remote.csb>
References: <jGQc86Npv2BVcA61A7EPFQYcclIuxb07m-UqU0w22FA8_o3-0_xc6OQPp_CHDBZhId9acH4hyiOqki9w7Q0-WmuoVqsCoQfefaHNdfcV2ww=@ranguvar.io>
 <20241214185248.GE10560@noisy.programming.kicks-ass.net>
 <gvam6amt25mlvpxlpcra2caesdfpr5a75cba3e4n373tzqld3k@ciutribtvmjj>
 <Z2BaZSKtaAPGSCqb@google.com>
 <b6d8WzC2p_tpdLs36QeL_oqtEKy_pRy-PdeOxa08JtTcPhHNNOCjN73b799C0gv8NnmIJKH9gD6J4W-Dv5JKEVdrbMoVUp3wSOrqEY_LrDg=@ranguvar.io>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <b6d8WzC2p_tpdLs36QeL_oqtEKy_pRy-PdeOxa08JtTcPhHNNOCjN73b799C0gv8NnmIJKH9gD6J4W-Dv5JKEVdrbMoVUp3wSOrqEY_LrDg=@ranguvar.io>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: E1CV-v82KrH9QWYSxi-7uewG3RR364FhZ_rge5Kvkpo_1734425837
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 16/12/24 20:40, Ranguvar wrote:
> On Monday, December 16th, 2024 at 16:50, Sean Christopherson <seanjc@google.com> wrote:
> > 
> > On Mon, Dec 16, 2024, Juri Lelli wrote:
> > 
> > > On 14/12/24 19:52, Peter Zijlstra wrote:
> > > 
> > > > On Sat, Dec 14, 2024 at 06:32:57AM +0000, Ranguvar wrote:
> > > > 
> > > > > I have in kernel cmdline `iommu=pt isolcpus=1-7,17-23 rcu_nocbs=1-7,17-23 nohz_full=1-7,17-23`. Removing iommu=pt does not produce a change, and
> > > > > dropping the core isolation freezes the host on VM startup.
> > 
> > As in, dropping all of isolcpus, rcu_nocbs, and nohz_full? Or just dropping
> > isolcpus?
> 
> Thanks for looking.
> I had dropped all three, but not altered the VM guest config, which is:
> 
> <cputune>
> <vcpupin vcpu='0' cpuset='2'/>
> <vcpupin vcpu='1' cpuset='18'/>
> ...
> <vcpupin vcpu='11' cpuset='23'/>
> <emulatorpin cpuset='1,17'/>
> <iothreadpin iothread='1' cpuset='1,17'/>
> <vcpusched vcpus='0' scheduler='fifo' priority='95'/>
> ...
> <iothreadsched iothreads='1' scheduler='fifo' priority='50'/>

Are you disabling/enabling/configuring RT throttling (sched_rt_{runtime,
period}_us) in your configuration?

> </cputune>
> 
> CPU mode is host-passthrough, cache mode is passthrough.
> 
> The 24GB VRAM did cause trouble when setting up resizeable BAR months ago as well. It necessitated a special qemu config:
> <qemu:commandline>
> <qemu:arg value='-fw_cfg'/>
> <qemu:arg value='opt/ovmf/PciMmio64Mb,string=65536'/>
> </qemu:commandline>
> 

